%% ASEN 5335 Aerospace Environment
%% Justin Le
%% HW2 Problem 2

clc;clear; close all

% Constants
k=1.38E-23;
T=300;
g=9.81;

%g/mol to kg conversion
gmol2kg = (1/(1000*6.02E23));

% air
amu_air = 28.0124*(0.781) + 31.9988*(0.209);
m_air = amu_air*gmol2kg;
H_air = (k*T)/(m_air*g)
% atomic oxygen
amu_oxygen = 31.9988/2;
m_oxygen = amu_oxygen*gmol2kg;
H_oxygen = (k*T)/(m_oxygen*g)
% helium
amu_helium = 4.0026;
m_helium = amu_helium*gmol2kg;
H_helium = (k*T)/(m_helium*g)
% hydrogen
amu_hydrogen = 2.01594;
m_hydrogen= amu_hydrogen*gmol2kg;
H_hydrogen = (k*T)/(m_hydrogen*g)

% Convert to km
H_air_km = H_air/1000
H_oxygen_km = H_oxygen/1000
H_helium_km = H_helium/1000
H_hydrogen_km = H_hydrogen/1000

% Recalculate scale height with MSIS profile
MSIS = MSISatmosphere1000(1)
m_air_MSIS_kg = ((MSIS.o2*0.209)+(MSIS.n2*0.781))/1000
m_oxygen_MSIS_kg = (MSIS.o*MSIS.mass)/1000
m_helium_MSIS_kg = (MSIS.he*MSIS.mass)/1000
m_hydrogen_MSIS_kg = (MSIS.h*MSIS.mass)/1000
