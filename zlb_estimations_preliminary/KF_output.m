parameters=x;
%clear;clc;close all;
%parameters=[0.1 0.1 1 0.01 3 1.5 0.5 0.1 0.1 0.9 0.7 0.3 0.3 0.03 0.03 0.05 0.15 0.01];    
%clear;clc;load('us_dataset.mat');dataset=[gap_hp,pinfobs,robs];
%dataset=dataset(44:end,:);

   gain=parameters(18);
%  q_11=0.99;q_22=0.85; 

load('us_dataset.mat');
first_obs=20;burn_in=24;
dataset=[gap_hp,pinfobs,robs];
dataset=dataset(first_obs:end,:);
param(:,1)=parameters(1:13);
param(:,2)=parameters(1:13);
param(3,2)=parameters(14);
% param(12,1)=0.3;param(13,1)=0.3;
param(13,2)=parameters(15);
% param(13,2)=0.03;
param(6,2)=0;param(7,2)=0;param(10,2)=0;
q_11=1-parameters(16);q_22=1-parameters(17);

Q=[q_11,1-q_11;1-q_22,q_22];
% q_11=Q(1,1);q_12=Q(1,2);q_21=Q(2,1);q_22=Q(2,2);
numVar=5;numExo=2;numObs=3;numRegimes=2;
T=size(dataset,1);l=3;
alpha1=0*ones(numVar,1);beta1=0.75*eye(numVar);
rr=zeros(2,2,2);%rr(:,:,1)=10*eye(2);rr(:,:,2)=10*eye(2);
load('AR1_initial_beliefs.mat');
alpha1(1)=alpha_y;alpha1(2)=alpha_pinf;
beta1(1,1)=beta_y;beta1(2,2)=beta_pinf;
rr(:,:,1)=rr_y;
rr(:,:,2)=rr_pinf;

[A1 B1 C1 D1, E1 F1 G1]=NKPC_sysmat_regime1(param(:,1));
[A2 B2 C2 D2 E2 F2 G2]=NKPC_sysmat_regime1(param(:,2));
A1_inv=A1^(-1);A2_inv=A2^(-1);
Sigma1=diag([param(end-2,1)^2;param(end-1,1)^2;param(end,1)^2]);
Sigma2=diag([param(end-2,2)^2;param(end-1,2)^2;param(end,2)^2]);
gamma1_1=A1_inv*(B1+C1*beta1^2);gamma2_1=A1_inv*C1*(eye(numVar)-beta1^2)*alpha1;gamma3_1=A1_inv*D1;
gamma1_2=A2_inv*(B2+C2*beta1^2);gamma2_2=A2_inv*C2*(eye(numVar)-beta1^2)*alpha1;gamma3_2=A1_inv*D2;

H1=0*diag(var(dataset(1:150,:)));H2=0*diag(var(dataset(150:end,:)));



S_fore11=zeros(numVar,1);S_fore12=zeros(numVar,1);S_fore21=zeros(numVar,1);S_fore22=zeros(numVar,1);
P_fore11=zeros(numVar,numVar);P_fore12=zeros(numVar,numVar);P_fore21=zeros(numVar,numVar);P_fore22=zeros(numVar,numVar);
v11=zeros(numObs,1);v12=zeros(numObs,1);v21=zeros(numObs,1);v22=zeros(numObs,1);
Fe11=zeros(numObs,numObs);Fe12=zeros(numObs,numObs);Fe21=zeros(numObs,numObs);Fe22=zeros(numObs,numObs);
S_upd11=zeros(numVar,1);S_upd12=zeros(numVar,1);S_upd21=zeros(numVar,1);S_upd22=zeros(numVar,1);
P_upd11=zeros(numVar,numVar);P_upd12=zeros(numVar,numVar);P_upd21=zeros(numVar,numVar);P_upd22=zeros(numVar,numVar);
ml11=0;ml12=0;ml21=0;ml22=0;
likl=zeros(T,1);
%pp_fore11=0;pp_fore12=0;pp_fore21=0;pp_fore22=0;
pp_fore11=1;pp_fore12=0;pp_fore21=0;pp_fore22=0;
pp_upd11=1;pp_upd12=0;pp_upd21=0;pp_upd22=0;
%pp_collapse1=regime(1);pp_collapse2=1-regime(1);
pp_collapse1=0.5;pp_collapse2=0.5;
S_collapse1=zeros(numVar,1);S_collapse2=zeros(numVar,1);
P_collapse1=eye(numVar);P_collapse2=eye(numVar);
q_11=Q(1,1);q_12=Q(1,2);q_21=Q(2,1);q_22=Q(2,2);
S_filtered=zeros(T,numVar);
%pp_filtered=zeros(T,1);
pp_filtered=ones(T,1);


%----------------------------------------------------------------------------

for tt=2:T
    
    %when using sac_learning algorithms
%gamma1_1=A1_inv*(B1+C1*beta1^2);gamma2_1=A1_inv*C1*(eye(numVar)-beta1^2)*alpha1;gamma3_1=A1_inv*D1;
%gamma1_2=A2_inv*(B2+C2*beta1^2);gamma2_2=A2_inv*C2*(eye(numVar)-beta1^2)*alpha1;gamma3_2=A1_inv*D2;

   %when using msv_learning algorithms. Only intercepts are different
gamma1_1=A1_inv*(B1+C1*beta1^2);gamma2_1=A1_inv*C1*(eye(numVar)+beta1)*alpha1;gamma3_1=A1_inv*D1;
gamma1_2=A2_inv*(B2+C2*beta1^2);gamma2_2=A2_inv*C2*(eye(numVar)+beta1)*alpha1;gamma3_2=A1_inv*D2;

    x_tt=dataset(tt,:)';

%kalman block
S_fore11=gamma1_1*S_collapse1+gamma2_1;%
S_fore12=gamma1_2*S_collapse1+gamma2_2;%
S_fore21=gamma1_1*S_collapse2+gamma2_1;%
S_fore22=gamma1_2*S_collapse2+gamma2_2;%
%
P_fore11=gamma1_1*P_collapse1*gamma1_1'+gamma3_1*Sigma1*gamma3_1';
P_fore12=gamma1_2*P_collapse1*gamma1_2'+gamma3_2*Sigma2*gamma3_2';  
P_fore21=gamma1_1*P_collapse2*gamma1_1'+gamma3_1*Sigma1*gamma3_1';
P_fore22=gamma1_2*P_collapse2*gamma1_2'+gamma3_2*Sigma2*gamma3_2';
%    
v11=x_tt-E1-F1*S_fore11;
v12=x_tt-E2-F2*S_fore12;
v21=x_tt-E1-F1*S_fore21;
v22=x_tt-E2-F2*S_fore22;
%
Fe11=F1*P_fore11*F1'+H1;
Fe12=F2*P_fore12*F2'+H2;
Fe21=F1*P_fore21*F1'+H1;
Fe22=F2*P_fore22*F2'+H2;
%
S_upd11=S_fore11+P_fore11*F1'*(Fe11^(-1))*v11;
S_upd12=S_fore12+P_fore12*F2'*(Fe12^(-1))*v12;
S_upd21=S_fore21+P_fore21*F1'*(Fe21^(-1))*v21;
S_upd22=S_fore22+P_fore22*F2'*(Fe22^(-1))*v22;
%
P_upd11=(eye(numVar)-P_fore11*F1'*Fe11^(-1)*F1)*P_fore11;    
P_upd12=(eye(numVar)-P_fore12*F2'*Fe12^(-1)*F2)*P_fore12;  
P_upd21=(eye(numVar)-P_fore21*F1'*Fe21^(-1)*F1)*P_fore21;  
P_upd22=(eye(numVar)-P_fore22*F2'*Fe22^(-1)*F2)*P_fore22;  
%
pp_fore11=q_11*pp_collapse1;
pp_fore12=q_12*pp_collapse1;
pp_fore21=q_21*pp_collapse2;
pp_fore22=q_22*pp_collapse2;
%
ml11=(2*pi)^(-l/2)*det(Fe11)^(-0.5)*exp(-0.5*v11'*Fe11^(-1)*v11);
ml12=(2*pi)^(-l/2)*det(Fe12)^(-0.5)*exp(-0.5*v12'*Fe12^(-1)*v12);
ml21=(2*pi)^(-l/2)*det(Fe21)^(-0.5)*exp(-0.5*v21'*Fe21^(-1)*v21);
ml22=(2*pi)^(-l/2)*det(Fe22)^(-0.5)*exp(-0.5*v22'*Fe22^(-1)*v22);
% 
likl(tt)=ml11*pp_fore11+ml12*pp_fore12+ml21*pp_fore21+ml22*pp_fore22;
%
pp_upd11=(ml11*pp_fore11)/likl(tt);
pp_upd12=(ml12*pp_fore12)/likl(tt);
pp_upd21=(ml21*pp_fore21)/likl(tt);
pp_upd22=(ml22*pp_fore22)/likl(tt);
%
pp_collapse1=pp_upd11+pp_upd21;
pp_collapse2=pp_upd12+pp_upd22;
%
if pp_collapse1>10e-5;
    S_collapse1=(pp_upd11*S_upd11+pp_upd21*S_upd21)/pp_collapse1;
P_collapse1=(pp_upd11*(P_upd11+(S_collapse1-S_upd11)*(S_collapse1-S_upd11)')+...
    pp_upd21*(P_upd21+(S_collapse1-S_upd21)*(S_collapse1-S_upd21)'))/pp_collapse1;
else S_collapse1=zeros(numVar,1);
    P_collapse1=eye(numVar);
end

if pp_collapse2>10e-5
P_collapse2=(pp_upd12*(P_upd12+(S_collapse2-S_upd12)*(S_collapse2-S_upd12)')+...
    pp_upd22*(P_upd22+(S_collapse2-S_upd22)*(S_collapse2-S_upd22)'))/pp_collapse2;
S_collapse2=(pp_upd12*S_upd12+pp_upd22*S_upd22)/pp_collapse2;
else S_collapse2=zeros(numVar,1);
    P_collapse2=eye(numVar);
end

%
S_filtered(tt,:)=pp_collapse1*S_collapse1+pp_collapse2*S_collapse2;
pp_filtered(tt)=pp_collapse1;





    for jj=1:2
    [alpha1(jj) beta1(jj,jj) rr(:,:,jj)] =...
         msv_learning(S_filtered(tt,jj)',[1,S_filtered(tt-1,jj)]',...
      alpha1(jj),beta1(jj,jj),rr(:,:,jj),gain);
learning_filtered(jj,tt-1,:)=[alpha1(jj),beta1(jj,jj)];
      end



 end

likl=-sum(log(likl(burn_in+1:end)));




















figure;
% plot(S_filtered(:,3),'--');
subplot(2,1,1);
plot(dataset(:,3),'--');
hold on;
plot(ones(T,1)-pp_filtered,'lineWidth',3);
% hold on;
% plot(gap_exp+param(1,1),'lineWidth',3);
% hold on;
% plot(infl_exp+param(2,1),'lineWidth',3);
% hold on;
% plot(0.5*ones(T,1),'--');
% grid minor;
% legend('int. rate','regime prob.');
% subplot(2,1,2);
%  plot(gap_exp+param(1,1),'lineWidth',3);
%  hold on;
%  plot(infl_exp+param(2,1),'lineWidth',3);
%  hold on;
%  legend('output gap expectations','inflation expectations');

% figure;
% for jj=1:2
% subplot(2,1,jj);
% plot(S_filtered(:,jj),'--');
% hold on;
% plot(squeeze(learning_filtered(jj,:,1)),'lineWidth',3);
% title('learning:mean coefficients');
% end
% 
% 
% figure;
% for jj=1:2
% subplot(2,1,jj);
% plot(squeeze(learning_filtered(jj,:,2)),'lineWidth',3);
% title('learning: first-order autocorrelations');
% end
% 
% figure;
% for jj=1:4
%     subplot(4,1,jj);
%     plot(cross_correlations(jj,:),'lineWidth',3);
%     title('cross-correlations');
% end
% 
% figure;
% subplot(2,1,1);
% plot(largestEig,'lineWidth',3);
% subplot(2,1,2);
% plot(projectionFlag,'lineWidth',3);

% figure;
% subplot(2,1,1);
% plot(expectations(1,:),'lineWidth',3);
% hold on;
% plot(S_filtered(:,1),'--');
% legend('expectations','filtered output gap');
% 
% subplot(2,1,2);
% plot(expectations(2,:),'lineWidth',3);
% hold on;
% plot(S_filtered(:,2),'--');
% legend('expectations','filtered inflation');