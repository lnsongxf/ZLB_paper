function hessian_computation_test
% H1 line
%
% ::
%
%
% Args:
%
% Returns:
%    :
%
% Note:
%
% Example:
%
%    See also:

clc
% load some data
[CORE_CPI,YGAP_CBO,FFR]=load_data;
y0=transpose([CORE_CPI,YGAP_CBO,FFR]);
n=size(y0,1);
nlags=4;
const=true;
[lik,lik_ml,xml,params,sd_fd,sd_opg,sd_ols,sd_ml,A,A0,SIGml]=compute_all(y0,nlags,const);

disp('Real data')
disp([lik_ml,lik])
disp([xml,params])
disp('standard deviations: FD vs OPG vs OLS vs direct(ML)')
disp([sd_fd,sd_opg,sd_ols,sd_ml])

% simulate a long sample and recompute
burn=100;
T=1000+burn;
ylong=zeros(n,T);
CS=transpose(chol(SIGml));
for t=1:T-nlags
    ylag=fliplr(ylong(:,t-1+(1:nlags)));
    ylong(:,t+nlags)=A0+A*ylag(:)+CS*randn(n,1);
end
ylong=ylong(:,burn+1:end);

[lik,lik_ml,xml,params,sd_fd,sd_opg,sd_ols,sd_ml]=compute_all(ylong,nlags,const);
disp('Simulated data')
disp([lik_ml,lik])
disp([xml,params])
disp('standard deviations: FD vs OPG vs OLS vs direct(ML)')
disp([sd_fd,sd_opg,sd_ols,sd_ml])


function [lik,lik_ml,xml,params,sd_fd,sd_opg,sd_ols,sd_ml,A,A0,SIGml]=compute_all(y0,nlags,const)
[A,A0,~,SIGml,~,Vols,Vml]=var_ols(y0,nlags,const);
% check that the OLS estimator is indeed the ML one, by maximizing the
% likelihood
params=[A(:);A0;vartools.vech(SIGml)];
lik=var_likelihood(params,y0,nlags,const);
[xml,lik_ml]=fminunc(@var_likelihood,params,optimset('Display','final'),y0,nlags,const);
n=size(y0,1);
% compute the hessian by finite differences and also by outer product
% gradient
tmp=1:n^2*nlags+n*const;
Hfd=utils.hessian.finite_differences(@var_likelihood,params,y0,nlags,const);
Hopg=utils.hessian.outer_product(@var_likelihood,params,y0,nlags,const);
sd_fd=sqrt(diag(inv(Hfd)));
sd_opg=sqrt(diag(inv(Hopg)));
% truncate vectors for comparison with ols
sd_fd=sd_fd(tmp);
sd_opg=sd_opg(tmp);
sd_ols=sqrt(diag(Vols));
sd_ml=sqrt(diag(Vml));
disp(['maximum difference between fd and opg is: ',num2str(max(abs(sd_fd-sd_opg)))])

function [CORE_CPI,YGAP_CBO,FFR]=load_data
datamat=[ 
   4.86797022  14.23000000  -5.76183228 
   7.33313321  14.51000000  -5.98462114 
   6.65715291  11.01000000  -7.14513225 
   1.37084417   9.29000000  -7.83983393 
   2.45819298   8.65000000  -7.33530247 
   3.93026690   8.80000000  -5.82757380 
   4.94404124   9.46000000  -4.58699823 
   5.15982547   9.43000000  -3.26133609 
   5.48329354   9.69000000  -2.08866847 
   4.90993455  10.56000000  -1.15646774 
   4.96426419  11.39000000  -0.99154997 
   4.04024769   9.27000000  -1.00136437 
   4.33446558   8.48000000  -0.90534443 
   4.21445673   7.92000000  -0.91236565 
   3.51489676   7.90000000  -0.21126361 
   4.60295932   8.10000000  -0.29714718 
   4.30111671   7.83000000  -0.16361842 
   3.30184274   6.92000000  -0.56992298 
   3.76547891   6.21000000  -0.40653312 
   3.83445202   6.27000000  -0.70903018 
   3.21342375   6.22000000  -0.93403661 
   4.78924733   6.65000000  -0.64855605 
   3.72316108   6.84000000  -0.55216450 
   4.58908856   6.92000000   0.37883413 
   3.87789423   6.66000000   0.13214714 
   4.78694238   7.16000000   0.64743104 
   4.44034864   7.98000000   0.40305959 
   4.80582473   8.47000000   0.97055974 
   4.21339975   9.44000000   1.14660949 
   4.29420729   9.73000000   1.13161710 
   3.81649717   9.08000000   1.16476607 
   4.81915049   8.61000000   0.62880583 
   5.06316686   8.25000000   0.92105420 
   5.17835645   8.24000000   0.58236645 
   5.90416623   8.16000000  -0.14010901 
   4.57447532   7.74000000  -1.72372060 
   5.75259789   6.43000000  -2.89350660 
   3.58211349   5.86000000  -2.88411671 
   4.33501780   5.64000000  -3.11369249 
   3.70643959   4.82000000  -3.36210150 
   3.50746197   4.02000000  -2.90435742 
   3.44971337   3.77000000  -2.47982232 
   3.09573847   3.26000000  -2.08980738 
   3.58167135   3.04000000  -1.68584021 
   3.47015857   3.04000000  -2.15624702 
   3.36125311   3.00000000  -2.18421056 
   2.36500492   3.06000000  -2.33448393 
   3.13174432   2.99000000  -1.70795308 
   2.59118610   3.21000000  -1.43332488 
   2.72845331   3.94000000  -0.77463035 
   2.99014267   4.49000000  -0.84098953 
   2.53807958   5.17000000  -0.45214847 
   3.35088408   5.81000000  -0.92860804 
   3.24839366   6.02000000  -1.44451225 
   2.65402642   5.80000000  -1.34497723 
   2.78386244   5.72000000  -1.39479815 
   2.69147088   5.36000000  -1.46533385 
   2.35845439   5.24000000  -0.50895552 
   2.58556493   5.31000000  -0.40911467 
   2.54502659   5.28000000  -0.09794524 
   2.31483509   5.28000000  -0.11476725 
   2.53803443   5.52000000   0.56225294 
   1.72236088   5.53000000   1.00374207 
   2.27720191   5.51000000   0.94965378 
   2.40395157   5.52000000   1.05769499 
   2.25078182   5.50000000   1.11068413 
   2.37622177   5.53000000   1.57004108 
   2.22496775   4.86000000   2.42944087 
   1.73466748   4.73000000   2.45605608 
   1.90855233   4.75000000   2.37542660 
   2.10247185   5.09000000   2.77381702 
   2.24846011   5.31000000   3.67944532 
   2.61475356   5.68000000   3.05348285 
   2.50923742   6.27000000   4.07905373 
   2.64755517   6.52000000   3.24431753 
   2.41162693   6.47000000   2.90926354 
   2.89659067   5.59000000   1.65023045 
   2.46620576   4.33000000   1.38761364 
   2.70823173   3.50000000   0.21186262 
   2.64746096   2.13000000  -0.31847021 
   2.18585577   1.73000000  -0.31402389 
   2.04765996   1.75000000  -0.61687526 
   2.10007308   1.74000000  -0.92786781 
   1.79728620   1.44000000  -1.69012328 
   1.33229371   1.25000000  -2.04829408 
   0.68523390   1.25000000  -1.98549082 
   1.59432879   1.02000000  -1.02609458 
   1.03188583   1.00000000  -0.80717630 
   1.91225594   1.00000000  -0.75164545 
   2.51515283   1.01000000  -0.66994135 
   1.70862197   1.43000000  -0.54874158 
   2.42829703   1.95000000  -0.28564436 
   2.47379927   2.47000000   0.10856291 
   1.86032891   2.94000000  -0.06194705 
   1.33489527   3.46000000   0.09781495 
   2.63674040   3.98000000   0.01098211 
   2.50167018   4.46000000   0.70627195 
   3.46068586   4.91000000   0.44922351 
   2.52281061   5.25000000  -0.14951142 
   2.04534937   5.25000000  -0.05128578 
   2.22638644   5.26000000  -0.46874907 
   2.08080265   5.25000000  -0.30572964 
   2.16473351   5.07000000  -0.37762577 
   2.64251622   4.50000000  -0.29439916 
   2.49432320   3.18000000  -1.09747016 
   1.93966902   2.09000000  -1.56711588 
   2.79961281   1.94000000  -3.18831563 
   0.60923557   0.51000000  -5.51914257 
   1.54660722   0.18000000  -7.31724163 
   2.30875584   0.18000000  -8.00282958 
   1.49539702   0.16000000  -8.08008370 
   1.52609532   0.12000000  -7.29688776 
  -0.03626802   0.13000000  -6.78353229 
   0.88762122   0.19000000  -6.73651615 
   1.24658532   0.19000000  -6.48378572 
]; 
CORE_CPI=datamat(:,1); 
FFR     =datamat(:,2); 
YGAP_CBO=datamat(:,3); 
