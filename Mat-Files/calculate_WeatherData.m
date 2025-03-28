%% calculate_WeatherData.m
% 
% read CSV-file, calculate necessary data of the sun such as Zenith
% Azimuth, Elevation and Angle of incidence and estimate incidence
% irradiance
% 
% Jonathan Huth
% 
% 27.03.2025

%% Read Data
[weatherData,DateNum,DateSpan] = readCSV_GHI_DNI_DHI(Filename);

%% Timestruct with Datenum
T = pvl_maketimestruct(DateNum, +1);

%% Calculate sun position
[Sun.SunAz, Sun.SunEl, Sun.ApparentSunEl, Sun.SolarTime] = pvl_ephemeris(T,Array.Location,'temperature',weatherData.temperature);
dHr = T.hour+T.minute./60+T.second./3600; % Calculate decimal hours for plotting 

%% Plot Sun Position
figure('Name',DateSpan,'OuterPosition',[100 100 600 800],'NumberTitle','off')
subplot(3,1,1)
plot(dHr,90-Sun.ApparentSunEl);
hold all
grid on
plot(dHr,Sun.SunAz)
title('Sun Position','FontSize',14)
ylim([0 370])
legend('Sun Zenith','Sun Azimuth')
ylabel('Angle')

%% Plot Sun Elevation
subplot(3,1,2)
plot (dHr, Sun.ApparentSunEl);
grid on
title('Apparent Sun Elavation','FontSize',14)
ylabel('Angle')
ylim([0 60])

%% Calc AOI
Sun.AOI = pvl_getaoi(Array.Tilt, Array.Azimuth, 90-Sun.ApparentSunEl, Sun.SunAz);
Sun.SunZen = 90-Sun.ApparentSunEl;

%% Plot AOI
subplot(3,1,3)
plot(dHr, Sun.AOI)
grid on
title('Angle of Incidence','FontSize',14)
ylabel('Angle')
xlabel('Hour of Day')

%% Plot Irradiance
figure('Name',DateSpan,'NumberTitle','off')
plot(dHr,weatherData.GHI);
hold all
grid on
plot(dHr,weatherData.DHI)
plot(dHr,weatherData.DNI)
title('Irradiance Buttenwiesen - ' + DateSpan,'FontSize',14)
legend('GHI','DHI','DNI')
ylabel('Irradiance (W/m^2)')
xlabel('Hour of Day')

%% Calculate Irradiance data
% POA Beam
irradianceData.Eb = 0*Sun.AOI; %Initiallize variable
irradianceData.Eb(Sun.AOI<90) = weatherData.DNI(Sun.AOI<90).*cosd(Sun.AOI(Sun.AOI<90)); %Only calculate when sun is in view of the plane of array

%POA Diffuse
irradianceData.POADiffuse = pvl_kingdiffuse(Array.Tilt, weatherData.DHI, weatherData.GHI, Sun.SunZen);

%Incident irradiance
irradianceData.Ee = irradianceData.Eb + irradianceData.POADiffuse;