%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW2 Problem 4

clc;clear; close all

%% Constants
kB    = 1.380649e-23;      % Boltzmann constant, J/K
eV    = 1.602176634e-19;   % 1 eV in Joules
m_O   = 2.657e-26;         % mass of atomic oxygen, kg
G     = 6.67e-11;          % gravitational constant, N m^2/kg^2
M_E   = 5.972e24;          % Earth mass, kg
R_E   = 6371e3;            % Earth radius, m

T     = 1000;              % thermosphere temperature, K
alt   = 600e3;             % LEO altitude, m

%% (i) Characteristic (RMS) velocity of an oxygen atom at T = 1000 K
v_rms = sqrt(3*kB*T/m_O);
fprintf('(i)   v_rms = %.2f m/s\n', v_rms);

%% (ii) Impact energy on a spacecraft at 600 km altitude
r = R_E + alt;
v_orbit = sqrt(G*M_E/r);
KE_J = 0.5*m_O*v_orbit^2;
KE_eV = KE_J/eV;
fprintf('(ii)  v_orbit = %.2f m/s, KE = %.4e J = %.4f eV\n', v_orbit, KE_J, KE_eV);

%% (iii) Fraction of the O population energetic enough to sputter Aluminum
% Sputtering threshold for O on Al target (Figure 15 / Table 3.5, from Tribble)
E_th_eV = 23;
E_th_J  = E_th_eV*eV;

% Notes Eq. (3) gives the 3D (isotropic) Maxwell-Boltzmann SPEED distribution,
% used in part (i). It has no preferred direction, so it can't be combined
% with the spacecraft's directional ram velocity. The hint to use "just the
% 1D velocities parallel to the ram direction" means using the 1D Maxwell-
% Boltzmann VELOCITY COMPONENT distribution instead -- the marginal of the
% same underlying distribution along a single axis:
%
%   g(vx) = sqrt(m/(2*pi*kB*T)) * exp(-m*vx^2/(2*kB*T))
%
% In the spacecraft frame this component is centered on v_orbit (the bulk
% streaming velocity of the atmosphere relative to the spacecraft), with
% the same thermal spread, sigma = sqrt(kB*T/m).
sigma_1D = sqrt(kB*T/m_O);
g1D = @(vx) sqrt(m_O./(2*pi*kB*T)) .* exp(-m_O.*vx.^2./(2*kB*T));

% Speed required for KE to equal the sputtering threshold
v_th = sqrt(2*E_th_J/m_O);

% Fraction with total ram-direction speed (v_orbit + thermal) above v_th is
% the fraction of the THERMAL component above (v_th - v_orbit); integrate
% the 1D Maxwell-Boltzmann velocity distribution numerically:
fraction = integral(g1D, v_th - v_orbit, Inf);

% Cross-check against the closed-form Gaussian tail (Q-function):
% Q(z) = 1 - Phi(z) = 0.5*erfc(z/sqrt(2))
z = (v_th - v_orbit)/sigma_1D;
fraction_closedform = 0.5*erfc(z/sqrt(2));

fprintf('(iii) E_th (O on Al)  = %.1f eV\n', E_th_eV);
fprintf('      v_th            = %.2f m/s\n', v_th);
fprintf('      sigma_1D        = %.2f m/s\n', sigma_1D);
fprintf('      fraction (numerical integral of 1D Maxwell-Boltzmann) = %.3e\n', fraction);
fprintf('      fraction (closed-form erfc check)                    = %.3e\n', fraction_closedform);
