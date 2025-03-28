function [moduleTemp] = getModuleTemperature(ambientTemp,E)
%MODULETEMPERATURE Summary of this function goes here
%   Detailed explanation goes here

moduleTemp = ambientTemp + CanadianSolar_CS6P_240P.DT .* E/irradianceData.E0;
end

