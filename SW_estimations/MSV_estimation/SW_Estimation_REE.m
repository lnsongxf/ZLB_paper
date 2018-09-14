%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'SW_Estimation_REE';
M_.dynare_version = '4.5.4';
oo_.dynare_version = '4.5.4';
options_.dynare_version = '4.5.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('SW_Estimation_REE.log');
M_.exo_names = 'eta_a';
M_.exo_names_tex = 'eta\_a';
M_.exo_names_long = 'eta_a';
M_.exo_names = char(M_.exo_names, 'eta_b');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_b');
M_.exo_names_long = char(M_.exo_names_long, 'eta_b');
M_.exo_names = char(M_.exo_names, 'eta_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_g');
M_.exo_names_long = char(M_.exo_names_long, 'eta_g');
M_.exo_names = char(M_.exo_names, 'eta_i');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_i');
M_.exo_names_long = char(M_.exo_names_long, 'eta_i');
M_.exo_names = char(M_.exo_names, 'eta_r');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_r');
M_.exo_names_long = char(M_.exo_names_long, 'eta_r');
M_.exo_names = char(M_.exo_names, 'eta_p');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_p');
M_.exo_names_long = char(M_.exo_names_long, 'eta_p');
M_.exo_names = char(M_.exo_names, 'eta_w');
M_.exo_names_tex = char(M_.exo_names_tex, 'eta\_w');
M_.exo_names_long = char(M_.exo_names_long, 'eta_w');
M_.endo_names = 'mc';
M_.endo_names_tex = 'mc';
M_.endo_names_long = 'mc';
M_.endo_names = char(M_.endo_names, 'zcap');
M_.endo_names_tex = char(M_.endo_names_tex, 'zcap');
M_.endo_names_long = char(M_.endo_names_long, 'zcap');
M_.endo_names = char(M_.endo_names, 'rk');
M_.endo_names_tex = char(M_.endo_names_tex, 'rk');
M_.endo_names_long = char(M_.endo_names_long, 'rk');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'inve');
M_.endo_names_tex = char(M_.endo_names_tex, 'inve');
M_.endo_names_long = char(M_.endo_names_long, 'inve');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'lab');
M_.endo_names_tex = char(M_.endo_names_tex, 'lab');
M_.endo_names_long = char(M_.endo_names_long, 'lab');
M_.endo_names = char(M_.endo_names, 'pinf');
M_.endo_names_tex = char(M_.endo_names_tex, 'pinf');
M_.endo_names_long = char(M_.endo_names_long, 'pinf');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'kp');
M_.endo_names_tex = char(M_.endo_names_tex, 'kp');
M_.endo_names_long = char(M_.endo_names_long, 'kp');
M_.endo_names = char(M_.endo_names, 'eps_a');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_a');
M_.endo_names_long = char(M_.endo_names_long, 'eps_a');
M_.endo_names = char(M_.endo_names, 'eps_b');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_b');
M_.endo_names_long = char(M_.endo_names_long, 'eps_b');
M_.endo_names = char(M_.endo_names, 'eps_g');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_g');
M_.endo_names_long = char(M_.endo_names_long, 'eps_g');
M_.endo_names = char(M_.endo_names, 'eps_i');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_i');
M_.endo_names_long = char(M_.endo_names_long, 'eps_i');
M_.endo_names = char(M_.endo_names, 'eps_r');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_r');
M_.endo_names_long = char(M_.endo_names_long, 'eps_r');
M_.endo_names = char(M_.endo_names, 'eps_p');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_p');
M_.endo_names_long = char(M_.endo_names_long, 'eps_p');
M_.endo_names = char(M_.endo_names, 'eps_w');
M_.endo_names_tex = char(M_.endo_names_tex, 'eps\_w');
M_.endo_names_long = char(M_.endo_names_long, 'eps_w');
M_.endo_names = char(M_.endo_names, 'labobs');
M_.endo_names_tex = char(M_.endo_names_tex, 'labobs');
M_.endo_names_long = char(M_.endo_names_long, 'labobs');
M_.endo_names = char(M_.endo_names, 'robs');
M_.endo_names_tex = char(M_.endo_names_tex, 'robs');
M_.endo_names_long = char(M_.endo_names_long, 'robs');
M_.endo_names = char(M_.endo_names, 'pinfobs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pinfobs');
M_.endo_names_long = char(M_.endo_names_long, 'pinfobs');
M_.endo_names = char(M_.endo_names, 'dy');
M_.endo_names_tex = char(M_.endo_names_tex, 'dy');
M_.endo_names_long = char(M_.endo_names_long, 'dy');
M_.endo_names = char(M_.endo_names, 'dc');
M_.endo_names_tex = char(M_.endo_names_tex, 'dc');
M_.endo_names_long = char(M_.endo_names_long, 'dc');
M_.endo_names = char(M_.endo_names, 'dinve');
M_.endo_names_tex = char(M_.endo_names_tex, 'dinve');
M_.endo_names_long = char(M_.endo_names_long, 'dinve');
M_.endo_names = char(M_.endo_names, 'dw');
M_.endo_names_tex = char(M_.endo_names_tex, 'dw');
M_.endo_names_long = char(M_.endo_names_long, 'dw');
M_.endo_names = char(M_.endo_names, 'AUX_EXO_LAG_32_0');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_EXO\_LAG\_32\_0');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_EXO_LAG_32_0');
M_.endo_names = char(M_.endo_names, 'AUX_EXO_LAG_33_0');
M_.endo_names_tex = char(M_.endo_names_tex, 'AUX\_EXO\_LAG\_33\_0');
M_.endo_names_long = char(M_.endo_names_long, 'AUX_EXO_LAG_33_0');
M_.endo_partitions = struct();
M_.param_names = 'curvw';
M_.param_names_tex = 'curvw';
M_.param_names_long = 'curvw';
M_.param_names = char(M_.param_names, 'curvp');
M_.param_names_tex = char(M_.param_names_tex, 'curvp');
M_.param_names_long = char(M_.param_names_long, 'curvp');
M_.param_names = char(M_.param_names, 'rho_ga');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_ga');
M_.param_names_long = char(M_.param_names_long, 'rho_ga');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'phi_w');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_w');
M_.param_names_long = char(M_.param_names_long, 'phi_w');
M_.param_names = char(M_.param_names, 'l_bar');
M_.param_names_tex = char(M_.param_names_tex, 'l\_bar');
M_.param_names_long = char(M_.param_names_long, 'l_bar');
M_.param_names = char(M_.param_names, 'pi_bar');
M_.param_names_tex = char(M_.param_names_tex, 'pi\_bar');
M_.param_names_long = char(M_.param_names_long, 'pi_bar');
M_.param_names = char(M_.param_names, 'beta_const');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_const');
M_.param_names_long = char(M_.param_names_long, 'beta_const');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'gamma_bar');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_bar');
M_.param_names_long = char(M_.param_names_long, 'gamma_bar');
M_.param_names = char(M_.param_names, 'mu_w');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_w');
M_.param_names_long = char(M_.param_names_long, 'mu_w');
M_.param_names = char(M_.param_names, 'mu_p');
M_.param_names_tex = char(M_.param_names_tex, 'mu\_p');
M_.param_names_long = char(M_.param_names_long, 'mu_p');
M_.param_names = char(M_.param_names, 'psi');
M_.param_names_tex = char(M_.param_names_tex, 'psi');
M_.param_names_long = char(M_.param_names_long, 'psi');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_names = char(M_.param_names, 'phi_p');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_p');
M_.param_names_long = char(M_.param_names_long, 'phi_p');
M_.param_names = char(M_.param_names, 'iota_w');
M_.param_names_tex = char(M_.param_names_tex, 'iota\_w');
M_.param_names_long = char(M_.param_names_long, 'iota_w');
M_.param_names = char(M_.param_names, 'xi_w');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_w');
M_.param_names_long = char(M_.param_names_long, 'xi_w');
M_.param_names = char(M_.param_names, 'iota_p');
M_.param_names_tex = char(M_.param_names_tex, 'iota\_p');
M_.param_names_long = char(M_.param_names_long, 'iota_p');
M_.param_names = char(M_.param_names, 'xi_p');
M_.param_names_tex = char(M_.param_names_tex, 'xi\_p');
M_.param_names_long = char(M_.param_names_long, 'xi_p');
M_.param_names = char(M_.param_names, 'sigma_c');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_c');
M_.param_names_long = char(M_.param_names_long, 'sigma_c');
M_.param_names = char(M_.param_names, 'sigma_l');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_l');
M_.param_names_long = char(M_.param_names_long, 'sigma_l');
M_.param_names = char(M_.param_names, 'r_pi');
M_.param_names_tex = char(M_.param_names_tex, 'r\_pi');
M_.param_names_long = char(M_.param_names_long, 'r_pi');
M_.param_names = char(M_.param_names, 'r_dy');
M_.param_names_tex = char(M_.param_names_tex, 'r\_dy');
M_.param_names_long = char(M_.param_names_long, 'r_dy');
M_.param_names = char(M_.param_names, 'r_y');
M_.param_names_tex = char(M_.param_names_tex, 'r\_y');
M_.param_names_long = char(M_.param_names_long, 'r_y');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_b');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_b');
M_.param_names_long = char(M_.param_names_long, 'rho_b');
M_.param_names = char(M_.param_names, 'rho_p');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_p');
M_.param_names_long = char(M_.param_names_long, 'rho_p');
M_.param_names = char(M_.param_names, 'rho_w');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_w');
M_.param_names_long = char(M_.param_names_long, 'rho_w');
M_.param_names = char(M_.param_names, 'rho_i');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_i');
M_.param_names_long = char(M_.param_names_long, 'rho_i');
M_.param_names = char(M_.param_names, 'rho_r');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_r');
M_.param_names_long = char(M_.param_names_long, 'rho_r');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'cpie');
M_.param_names_tex = char(M_.param_names_tex, 'cpie');
M_.param_names_long = char(M_.param_names_long, 'cpie');
M_.param_names = char(M_.param_names, 'beta_bar');
M_.param_names_tex = char(M_.param_names_tex, 'beta\_bar');
M_.param_names_long = char(M_.param_names_long, 'beta_bar');
M_.param_names = char(M_.param_names, 'cr');
M_.param_names_tex = char(M_.param_names_tex, 'cr');
M_.param_names_long = char(M_.param_names_long, 'cr');
M_.param_names = char(M_.param_names, 'crk');
M_.param_names_tex = char(M_.param_names_tex, 'crk');
M_.param_names_long = char(M_.param_names_long, 'crk');
M_.param_names = char(M_.param_names, 'cw');
M_.param_names_tex = char(M_.param_names_tex, 'cw');
M_.param_names_long = char(M_.param_names_long, 'cw');
M_.param_names = char(M_.param_names, 'cikbar');
M_.param_names_tex = char(M_.param_names_tex, 'cikbar');
M_.param_names_long = char(M_.param_names_long, 'cikbar');
M_.param_names = char(M_.param_names, 'cik');
M_.param_names_tex = char(M_.param_names_tex, 'cik');
M_.param_names_long = char(M_.param_names_long, 'cik');
M_.param_names = char(M_.param_names, 'clk');
M_.param_names_tex = char(M_.param_names_tex, 'clk');
M_.param_names_long = char(M_.param_names_long, 'clk');
M_.param_names = char(M_.param_names, 'cky');
M_.param_names_tex = char(M_.param_names_tex, 'cky');
M_.param_names_long = char(M_.param_names_long, 'cky');
M_.param_names = char(M_.param_names, 'ciy');
M_.param_names_tex = char(M_.param_names_tex, 'ciy');
M_.param_names_long = char(M_.param_names_long, 'ciy');
M_.param_names = char(M_.param_names, 'ccy');
M_.param_names_tex = char(M_.param_names_tex, 'ccy');
M_.param_names_long = char(M_.param_names_long, 'ccy');
M_.param_names = char(M_.param_names, 'crkky');
M_.param_names_tex = char(M_.param_names_tex, 'crkky');
M_.param_names_long = char(M_.param_names_long, 'crkky');
M_.param_names = char(M_.param_names, 'cwhlc');
M_.param_names_tex = char(M_.param_names_tex, 'cwhlc');
M_.param_names_long = char(M_.param_names_long, 'cwhlc');
M_.param_names = char(M_.param_names, 'cwly');
M_.param_names_tex = char(M_.param_names_tex, 'cwly');
M_.param_names_long = char(M_.param_names_long, 'cwly');
M_.param_names = char(M_.param_names, 'r_bar');
M_.param_names_tex = char(M_.param_names_tex, 'r\_bar');
M_.param_names_long = char(M_.param_names_long, 'r_bar');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 7;
M_.endo_nbr = 29;
M_.param_nbr = 50;
M_.orig_endo_nbr = 27;
M_.aux_vars(1).endo_index = 28;
M_.aux_vars(1).type = 3;
M_.aux_vars(1).orig_index = 6;
M_.aux_vars(1).orig_lead_lag = 0;
M_.aux_vars(2).endo_index = 29;
M_.aux_vars(2).type = 3;
M_.aux_vars(2).orig_index = 7;
M_.aux_vars(2).orig_lead_lag = 0;
options_.varobs = cell(1);
options_.varobs(1)  = {'dy'};
options_.varobs(2)  = {'dc'};
options_.varobs(3)  = {'dinve'};
options_.varobs(4)  = {'labobs'};
options_.varobs(5)  = {'pinfobs'};
options_.varobs(6)  = {'dw'};
options_.varobs(7)  = {'robs'};
options_.varobs_id = [ 24 25 26 21 23 27 22  ];
M_.Sigma_e = zeros(7, 7);
M_.Correlation_matrix = eye(7, 7);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('SW_Estimation_REE_static');
erase_compiled_function('SW_Estimation_REE_dynamic');
M_.orig_eq_nbr = 27;
M_.eq_nbr = 29;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 17 0;
 0 18 0;
 0 19 46;
 0 20 0;
 0 21 47;
 1 22 48;
 2 23 49;
 3 24 0;
 0 25 50;
 4 26 51;
 5 27 52;
 6 28 0;
 7 29 0;
 8 30 0;
 9 31 0;
 10 32 0;
 11 33 0;
 12 34 0;
 13 35 0;
 14 36 0;
 0 37 0;
 0 38 0;
 0 39 0;
 0 40 0;
 0 41 0;
 0 42 0;
 0 43 0;
 15 44 0;
 16 45 0;]';
M_.nstatic = 10;
M_.nfwrd   = 3;
M_.npred   = 12;
M_.nboth   = 4;
M_.nsfwrd   = 7;
M_.nspred   = 16;
M_.ndynamic   = 19;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:7];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(7, 1);
M_.params = NaN(50, 1);
M_.NNZDerivatives = [114; 0; -1];
M_.params( 4 ) = .025;
delta = M_.params( 4 );
M_.params( 5 ) = 1.5;
phi_w = M_.params( 5 );
G=0.18;
M_.params( 2 ) = 10;
curvp = M_.params( 2 );
M_.params( 1 ) = 10;
curvw = M_.params( 1 );
M_.params( 9 ) = .24;
alpha = M_.params( 9 );
M_.params( 50 ) = 1.004;
gamma = M_.params( 50 );
M_.params( 27 ) = .9995;
beta = M_.params( 27 );
M_.params( 21 ) = 1.5;
sigma_c = M_.params( 21 );
M_.params( 16 ) = 1.5;
phi_p = M_.params( 16 );
M_.params( 3 ) = 0.51;
rho_ga = M_.params( 3 );
M_.params( 14 ) = 6.0144;
phi = M_.params( 14 );
M_.params( 15 ) = 0.6361;
lambda = M_.params( 15 );
M_.params( 18 ) = 0.8087;
xi_w = M_.params( 18 );
M_.params( 22 ) = 1.9423;
sigma_l = M_.params( 22 );
M_.params( 20 ) = 0.6;
xi_p = M_.params( 20 );
M_.params( 17 ) = 0.3243;
iota_w = M_.params( 17 );
M_.params( 19 ) = 0.47;
iota_p = M_.params( 19 );
M_.params( 13 ) = 0.2696;
psi = M_.params( 13 );
M_.params( 23 ) = 1.488;
r_pi = M_.params( 23 );
M_.params( 26 ) = 0.8762;
rho = M_.params( 26 );
M_.params( 25 ) = 0.0593;
r_y = M_.params( 25 );
M_.params( 24 ) = 0.2347;
r_dy = M_.params( 24 );
M_.params( 28 ) = 0.9977;
rho_a = M_.params( 28 );
M_.params( 29 ) = 0.5799;
rho_b = M_.params( 29 );
M_.params( 34 ) = 0.9957;
rho_g = M_.params( 34 );
M_.params( 32 ) = 0.7165;
rho_i = M_.params( 32 );
M_.params( 33 ) = 0;
rho_r = M_.params( 33 );
M_.params( 30 ) = 0;
rho_p = M_.params( 30 );
M_.params( 31 ) = 0;
rho_w = M_.params( 31 );
M_.params( 12 ) = 0;
mu_p = M_.params( 12 );
M_.params( 11 ) = 0;
mu_w = M_.params( 11 );
M_.params( 35 ) = 1.005;
cpie = M_.params( 35 );
M_.params( 36 ) = M_.params(27)*M_.params(50)^(-M_.params(21));
beta_bar = M_.params( 36 );
M_.params( 37 ) = M_.params(35)/(M_.params(27)*M_.params(50)^(-M_.params(21)));
cr = M_.params( 37 );
M_.params( 38 ) = M_.params(27)^(-1)*M_.params(50)^M_.params(21)-(1-M_.params(4));
crk = M_.params( 38 );
M_.params( 39 ) = (M_.params(9)^M_.params(9)*(1-M_.params(9))^(1-M_.params(9))/(M_.params(16)*M_.params(38)^M_.params(9)))^(1/(1-M_.params(9)));
cw = M_.params( 39 );
M_.params( 40 ) = 1-(1-M_.params(4))/M_.params(50);
cikbar = M_.params( 40 );
M_.params( 41 ) = M_.params(50)*(1-(1-M_.params(4))/M_.params(50));
cik = M_.params( 41 );
M_.params( 42 ) = (1-M_.params(9))/M_.params(9)*M_.params(38)/M_.params(39);
clk = M_.params( 42 );
M_.params( 43 ) = M_.params(16)*M_.params(42)^(M_.params(9)-1);
cky = M_.params( 43 );
M_.params( 44 ) = M_.params(41)*M_.params(43);
ciy = M_.params( 44 );
M_.params( 45 ) = 1-G-M_.params(41)*M_.params(43);
ccy = M_.params( 45 );
M_.params( 46 ) = M_.params(38)*M_.params(43);
crkky = M_.params( 46 );
M_.params( 47 ) = M_.params(43)*M_.params(38)*(1-M_.params(9))*1/M_.params(5)/M_.params(9)/M_.params(45);
cwhlc = M_.params( 47 );
M_.params( 48 ) = 1-M_.params(38)*M_.params(43);
cwly = M_.params( 48 );
M_.params( 10 ) = (M_.params(50)-1)*100;
gamma_bar = M_.params( 10 );
M_.params( 49 ) = 100*(M_.params(37)-1);
r_bar = M_.params( 49 );
M_.params( 7 ) = 100*(M_.params(35)-1);
pi_bar = M_.params( 7 );
M_.params( 6 ) = 0;
l_bar = M_.params( 6 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.4618)^2;
M_.Sigma_e(2, 2) = (1.8513)^2;
M_.Sigma_e(3, 3) = (0.6090)^2;
M_.Sigma_e(4, 4) = (0.6017)^2;
M_.Sigma_e(5, 5) = (0.2397)^2;
M_.Sigma_e(6, 6) = (0.1455)^2;
M_.Sigma_e(7, 7) = (0.2089)^2;
estim_params_.var_exo = [];
estim_params_.var_endo = [];
estim_params_.corrx = [];
estim_params_.corrn = [];
estim_params_.param_vals = [];
estim_params_.param_vals = [estim_params_.param_vals; 14, 6.3325, 2, 15, 3, 4, 1.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 21, 1.2312, 0.25, 3, 3, 1.50, 0.375, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 15, 0.7205, 0.001, 0.99, 1, 0.7, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 18, 0.7937, 0.3, 0.95, 1, 0.5, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 22, 5, 0.5, 10, 3, 2, 0.75, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 20, 0.7813, 0.5, 0.95, 1, 0.5, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 17, 0.4425, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 19, 0.3291, 0.01, 0.99, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 13, 0.2648, 0.01, 1, 1, 0.5, 0.15, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 16, 1.4672, 1.0, 3, 3, 1.25, 0.125, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 23, 1.7985, 1.0, 3, 3, 1.5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 26, 0.8258, 0.5, 0.975, 1, 0.75, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 25, 0.0893, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 24, 0.2239, 0.001, 0.5, 3, 0.125, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, 0.7, 0.1, 2.0, 2, 0.625, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, 0.7420, 0.01, 2.0, 2, 0.25, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, 1.2918, (-10.0), 10.0, 3, 0.0, 2.0, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, 0.3982, 0.1, 0.8, 3, 0.4, 0.10, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, 0.05, 0.01, 2.0, 3, 0.5, 0.25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, 0.24, 0.01, 1.0, 3, 0.3, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 28, .9676, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 29, .2703, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 34, .9930, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 32, .5724, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 33, .3, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 30, .8692, .01, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 31, .9546, .001, .9999, 1, 0.5, 0.20, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 12, .7652, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, .8936, 0.01, .9999, 1, 0.5, 0.2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.4618, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, 0.1818513, 0.025, 5, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.6090, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 4, 0.46017, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 5, 0.2397, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 6, 0.1455, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 7, 0.2089, 0.01, 3, 4, 0.1, 2, NaN, NaN, NaN ];
options_.kalman_algo = 1;
options_.lik_init = 2;
options_.mh_drop = 0.2;
options_.mh_jscale = 0.3;
options_.mh_nblck = 2;
options_.mh_replic = 0;
options_.mode_compute = 1;
options_.nograph = 1;
options_.prefilter = 0;
options_.presample = 4;
options_.datafile = 'full_dataset';
options_.optim_opt = '''MaxIter'',500';
options_.first_obs = 71;
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
options_.periods = 50000;
var_list_ = char();
info = stoch_simul(var_list_);
save('SW_Estimation_REE_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('SW_Estimation_REE_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
disp('Note: 3 warning(s) encountered in the preprocessor')
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
