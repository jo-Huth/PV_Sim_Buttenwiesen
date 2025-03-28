function [cellTemp] = getCellTemperature(ambientTemp,NOCT,E_POA)
%GETCELLTEMPERATURE estimate cell temperature with simple model
%   
%   Inputs
%       ambientTemp - a numeric value or vector of the ambient temperature,
%       must be same size as irradiance data
%       
%       NOCT - a numeric value of the nominal operating cell temperature
% 
%       E_POA - a numeric value or vector of the incidence irradiance, must
%       be same size as ambient temperature
% 
%   Output
%       cellTemp - a numeric value or vector of the estimated cell
%       temperature

E_ref = 800; %reference irradiance
cellTemp = ambientTemp + (NOCT - 20) .* E_POA/E_ref;
end

