function [residual, g1, g2, g3] = NKPC_REE_Estimation_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 8, 1);

%
% Model equations
%

beta__ = 0.99;
y_forecast__ = params(11)+params(14)*(params(13)+params(20)*y(3)+params(21)*y(4)+params(22)*y(5))+y(4)*params(15)*params(8)+y(5)*params(16)*params(9);
pi_forecast__ = params(12)+(params(13)+params(20)*y(3)+params(21)*y(4)+params(22)*y(5))*params(17)+y(4)*params(8)*params(18)+y(5)*params(9)*params(19);
T51 = 1/params(5);
lhs =y(1);
rhs =y(4)+y_forecast__-T51*(y(3)-pi_forecast__);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =y(5)+pi_forecast__*beta__+y(1)*params(4);
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(10)+(1-params(10))*(y(2)*params(6)+y(1)*params(7))+x(3);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(4)*params(8)+x(1);
residual(4)= lhs-rhs;
lhs =y(5);
rhs =y(5)*params(9)+x(2);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(1)+params(1);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(2)+params(2);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(3)+params(3);
residual(8)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(8, 8);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,3)=(-(params(14)*params(20)-T51*(1-params(20)*params(17))));
  g1(1,4)=(-(1+params(15)*params(8)+params(14)*params(21)-T51*(-(params(8)*params(18)+params(21)*params(17)))));
  g1(1,5)=(-(params(16)*params(9)+params(14)*params(22)-T51*(-(params(9)*params(19)+params(22)*params(17)))));
  g1(2,1)=(-params(4));
  g1(2,2)=1;
  g1(2,3)=(-(beta__*params(20)*params(17)));
  g1(2,4)=(-(beta__*(params(8)*params(18)+params(21)*params(17))));
  g1(2,5)=(-(1+beta__*(params(9)*params(19)+params(22)*params(17))));
  g1(3,1)=(-((1-params(10))*params(7)));
  g1(3,2)=(-((1-params(10))*params(6)));
  g1(3,3)=1-params(10);
  g1(4,4)=1-params(8);
  g1(5,5)=1-params(9);
  g1(6,1)=(-1);
  g1(6,6)=1;
  g1(7,2)=(-1);
  g1(7,7)=1;
  g1(8,3)=(-1);
  g1(8,8)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],8,64);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,512);
end
end
end
end
