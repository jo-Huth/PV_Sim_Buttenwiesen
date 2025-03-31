
# PV-Plant Buttenwiesen with PV_Lib in Matlab

This Project is a model of the PV-plant "Buttenwiesen 1" in Buttenwiesen. It was programmed with the help of the library PV_LIB in matlab and is estimating the power output of the system based on the irradiance inputs GHI, DHI, and DNI.



## Variables

To complete this project, you will need to change the following variables to real data when it is available and integrate it into the created table. It is found in the function "readCSV_GHI_DNI_DHI(filename)"

```matlab
%% Temperature vector with size of table column until real data is available
DataWeather.temperature = ones(size(a{:,1}))*5; % T_außen in °C
```

## Usage/Examples

```matlab
%% Init CSV filename
Filename = 'Csv-Export-19.01.25.csv';

%% Choose Block 'A' 'B' 'C' 'D' or ALL for switch case
Block = 'all';
```

For starting the Project you will need to change the variables above "Filename" and "Block" in the .mat file "StartScript" to the CSV-file that needs to be read and the block of the PV-Plant that needs to be evaluated. The CSV-file can be put in the folder "WeatherData", where to coherent table variable will be provided afte reading the data. 
## Authors
Jonathan Huth
- [@jo-Huth](https://github.com/jo-Huth)

