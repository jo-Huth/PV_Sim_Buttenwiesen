%%  Definition of the PV-model
%   Location: Buttenwiesen, Bayern DE
%   Module: Canadian Solar CS6P-240P
%   Inverter:   AE (REF Usol) AE 3TL 23-MV
%   Number of Modules:  4.176
%   Number of Inverters:    40
%   Module angle:   28 degrees
%   Azimuth angle:  172 degrees (east = 90, south = 180) 

%% Create Location structure
% latitude = 48.61;
% longitude = 10.77;
% altitude = 442;
Array.Location = pvl_makelocationstruct(48.61,10.77,442);

%% Module Array Configuration 
% Ms (Modules in serie), Mp (Modules in parallel)
%Block A
Array.A.Inverter.Ms = 32;
Array.A.Inverter.Mp = 3;

%Block B
Array.B.Inverter.Ms = 32;
Array.B.Inverter.Mp = 3;

%Block C
Array.C.Inverter.Ms_40 = 40;
Array.C.Inverter.Ms_60 = 60;
Array.C.Inverter.Mp_3 = 3;
Array.C.Inverter.Mp_2 = 2;

%Block D
Array.D.Inverter.Ms_48 = 48;
Array.D.Inverter.Ms_60 = 60;
Array.D.Inverter.Mp = 2;

%Array angles and number of modules
Array.Tilt = 28;
Array.Azimuth = 172;
Array.Modules = 4176;

%% Load Module and Inverter Database
load('CanadianSolar_CS6P_240P.mat');
load('AE_3TL_23_480V.mat');
inverter_10 = AE_3TL_23_480V(1);
inverter_06 = AE_3TL_23_480V(2);

%% Characteristics
irradianceData.E0 = 1000; % Ref Irradiance in W/m^2
CanadianSolar_CS6P_240P.DT = 22; % Erwärmung DT ggü. T_außen in K