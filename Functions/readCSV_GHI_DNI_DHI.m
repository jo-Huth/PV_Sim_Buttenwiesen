function [weatherData,DateNum,DateSpan] = readCSV_GHI_DNI_DHI(filename)
% READCSV_GHI_DNI_DHI Read CSV-file and write .mat file with irradiance data 
% 
% Input
%   filename - Name of the CSV-file to read 
%
% Outputs
%   weatherData - a table which contains irradiance and relevant time
%   and date data (UnixTime, Date, LocalTime, DNI_GC, GHI, DHI_GC, DHI,
%   DNI, TransposedIrradiance)
%
%   DateNum - a date in datenum format for further calculations with pv_lib
%
%   DateSpan - a string which contains either the date of a single day or the
%   first and last day

%% Import options and create empty table
opts = detectImportOptions('Csv-Export-19.01.25.csv','Delimiter',';','HeaderLines',6,'ReadVariableNames',false);
opts = setvaropts(opts,["Var4","Var5","Var6","Var7","Var8","Var9"],'FillValue', 0);
a = readtable(filename,opts);

DataWeather = table(a{:,1},a{:,2},a{:,3},a{:,4},a{:,5},a{:,6},a{:,7},a{:,8},a{:,9},'VariableNames',["UnixTime",  ...
    "Date","LocalTime","DNI_GC","GHI","DHI_GC", ...
    "DHI","DNI","TransposedIrradiance"]);

%% Temperature vector with size of table column until real data is available
DataWeather.temperature = ones(size(a{:,1}))*5; % T_außen in °C

%% set negative values to 0 
DataWeather.DHI(DataWeather.DHI<0) = 0;
DataWeather.DHI_GC(DataWeather.DHI_GC<0) = 0;
DataWeather.DNI(DataWeather.DNI<0) = 0;
DataWeather.DNI_GC(DataWeather.DNI_GC<0) = 0;
DataWeather.GHI(DataWeather.GHI<0) = 0;

%% Create String with span of Date or single day for using datenum
DateBegin = DataWeather.Date(1);
DateEnd = DataWeather.Date(end);

if DateBegin(1) == DateEnd(1)
    DateSpan = string(DateBegin, "yyyy-MM-dd");
else
    DateSpan = string(DateBegin, "yyyy-MM-dd") + '_' + string(DateEnd, "yyyy-MM-dd");
end

dateEndString = string(DateEnd, "yyyy-MM-dd");
dateEndTimeString = string(DataWeather.LocalTime(end),"hh:mm:ss");
dateEndString = dateEndString + " " + dateEndTimeString;
DateNum = datenum(string(DateBegin, "yyyy-MM-dd")):1/96:datenum(dateEndString,"yyyy-mm-dd HH:MM:SS");

%% Write the information to the output variables.
weatherData = DataWeather;
outputFileName = "WeatherData/DataWeather_" + DateSpan + ".mat";
save(outputFileName, "weatherData");