clear all;
close all;
%% StartScript 
% 
% Set variable 'Filename' for the CSV-file which contains necessary
% irradiance data.
% 
% Set switch-case variable 'Block' for which Block of the solar plant
% should be evaluated 
% 
% Runs all m-files used to describe the solar plant in Buttenwiesen
% (initialize_PVData, calculate_WeatherData, PVScript, InverterScript)
% 
% Jonathan Huth
% 
% 27.03.2025
%% Init CSV filename
Filename = 'Csv-Export-19.01.25.csv';

%% Choose Block 'A' 'B' 'C' 'D' or ALL for switch case
Block = 'all';

%% Initialize PV Configuration (Array, Location, Modules)
run('initialize_PVData.m'); 

%% Read CSV.file and calculate/plot sun/irradiance Data
run('calculate_WeatherData.m');

%% Model DC Current/Voltage/Power Output 
run('PVScript.m');

%% Model Inverter Output
run('InverterScript.m');