%% PVScript.m
% 
% calculate CEC parameters of the PV-module for the single diode model and Plot DC outputs
% for module and per inverter 
% 
% Jonathan Huth
% 
% 27.03.2025

%% pvl_calcParamsCEC 
% Cell Temperature
CanadianSolar_CS6P_240P.Tcell = getCellTemperature(weatherData.temperature,CanadianSolar_CS6P_240P.t_noct,irradianceData.Ee);

%CEC Calc Params
[CECData.IL, CECData.I0, CECData.Rs, CECData.Rsh, CECData.nNsVth] = pvl_calcparams_CEC(irradianceData.Ee, CanadianSolar_CS6P_240P.Tcell, CanadianSolar_CS6P_240P);

%% Single Diode model
[IVResult] = pvl_singlediode(CECData.IL, CECData.I0, CECData.Rs, CECData.Rsh, CECData.nNsVth);
IVResult.Vmp(Sun.ApparentSunEl<0)=0;

%% Plot DC-Output
figure('Name',DateSpan,'OuterPosition',[100 100 700 800])

%Current
subplot(3,1,1)
plot(dHr,IVResult.Imp)
hold on
grid on
ylabel('Current Module (A)')
title('Buttenwiesen DC Array Output -'+ DateSpan,'FontSize',14)

%Voltage
subplot(3,1,2)
plot(dHr,IVResult.Vmp)
hold on
grid on
ylabel('Voltage Module (V)')

%Power
subplot(3,1,3)
plot(dHr,IVResult.Pmp)
hold on
grid on
ylabel('Power Module (W)')
xlabel('Hour of Day')

%% switch Block
switch Block
% Block A
    case 'A'
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.A.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block A (A)')
        title('Buttenwiesen DC Array Output Block A per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.A.Inverter.Ms)
        hold on
        grid on
        ylabel('Voltage Block A (V)')
        
        %Power
        Array.A.electricOutput.DC.Power = IVResult.Vmp*Array.A.Inverter.Ms .* IVResult.Imp*Array.A.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.A.electricOutput.DC.Power)
        grid on
        ylabel('Power Block A(W)')
        xlabel('Hour of Day')

% Block B
    case 'B' 
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.B.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block B (A)')
        title('Buttenwiesen DC Array Output Block B per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.B.Inverter.Ms)
        hold on
        grid on
        ylabel('Voltage Block B (V)')
        
        %Power
        Array.B.electricOutput.DC.Power = IVResult.Vmp*Array.B.Inverter.Ms .* IVResult.Imp*Array.B.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.B.electricOutput.DC.Power)
        hold on
        grid on
        ylabel('Power Block B (W)')
        xlabel('Hour of Day')

% Block C
    case 'C'
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.C.Inverter.Mp_3)
        hold all
        plot(dHr,IVResult.Imp*Array.C.Inverter.Mp_2)
        grid on
        legend('Mp 3', 'Mp 2')
        ylabel('Current Block C (A)')
        title('Buttenwiesen DC Array Output Block C per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.C.Inverter.Ms_40)
        hold all
        plot(dHr,IVResult.Vmp*Array.C.Inverter.Ms_60)
        grid on
        legend('Ms 40', 'Ms 60')
        ylabel('Voltage Block C (V)')
        
        %Power
        % Modules in serie 60 & modules in parallel 2
        Array.C.electricOutput.DC.Power_60_2 = IVResult.Vmp*Array.C.Inverter.Ms_60 .* IVResult.Imp*Array.C.Inverter.Mp_2; 
        % Modules in serie 40 & modules in parallel 3
        Array.C.electricOutput.DC.Power_40_3 = IVResult.Vmp*Array.C.Inverter.Ms_40 .* IVResult.Imp*Array.C.Inverter.Mp_3;
        
        subplot(3,1,3)
        plot(dHr,Array.C.electricOutput.DC.Power_40_3)
        hold all
        plot(dHr,Array.C.electricOutput.DC.Power_60_2)
        grid on
        legend('Ms 40', 'Ms 60')
        ylabel('Power Block C (W)')
        xlabel('Hour of Day')

% Block D
    case 'D'
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.D.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block D (A)')
        title('Buttenwiesen DC Array Output Block D per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.D.Inverter.Ms_48)
        hold all
        plot(dHr,IVResult.Vmp*Array.D.Inverter.Ms_60)
        grid on
        legend('Ms 48', 'Ms 60')
        ylabel('Voltage Block D (V)')
        
        %Power        
        % Modules in serie 48
        Array.D.electricOutput.DC.Power_48 = IVResult.Vmp*Array.D.Inverter.Ms_48 .* IVResult.Imp*Array.D.Inverter.Mp;
        % Modules in serie 60
        Array.D.electricOutput.DC.Power_60 = IVResult.Vmp*Array.D.Inverter.Ms_60 .* IVResult.Imp*Array.D.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.D.electricOutput.DC.Power_48)
        hold all
        plot(dHr,Array.D.electricOutput.DC.Power_60)
        grid on
        legend('Ms 48', 'Ms 60')
        ylabel('Power Block D (W)')
        xlabel('Hour of Day')

    otherwise
        %% Block A
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.A.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block A (A)')
        title('Buttenwiesen DC Array Output Block A -'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.A.Inverter.Ms)
        hold on
        grid on
        ylabel('Voltage Block A (V)')
        
        %Power
        Array.A.electricOutput.DC.Power = IVResult.Vmp*Array.A.Inverter.Ms .* IVResult.Imp*Array.A.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.A.electricOutput.DC.Power)
        grid on
        ylabel('Power Block A(W)')
        xlabel('Hour of Day')

%% Block B
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.B.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block B (A)')
        title('Buttenwiesen DC Array Output Block B per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.B.Inverter.Ms)
        hold on
        grid on
        ylabel('Voltage Block B (V)')
        
        %Power
        Array.B.electricOutput.DC.Power = IVResult.Vmp*Array.B.Inverter.Ms .* IVResult.Imp*Array.B.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.B.electricOutput.DC.Power)
        hold on
        grid on
        ylabel('Power Block B (W)')
        xlabel('Hour of Day')

%% Block C
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.C.Inverter.Mp_3)
        hold all
        plot(dHr,IVResult.Imp*Array.C.Inverter.Mp_2)
        grid on
        legend('Mp 3', 'Mp 2')
        ylabel('Current Block C (A)')
        title('Buttenwiesen DC Array Output Block C per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.C.Inverter.Ms_40)
        hold all
        plot(dHr,IVResult.Vmp*Array.C.Inverter.Ms_60)
        grid on
        legend('Ms 40', 'Ms 60')
        ylabel('Voltage Block C (V)')
        
        %Power
        % Modules in serie 60 & modules in parallel 2
        Array.C.electricOutput.DC.Power_60_2 = IVResult.Vmp*Array.C.Inverter.Ms_60 .* IVResult.Imp*Array.C.Inverter.Mp_2; 
        % Modules in serie 40 & modules in parallel 3
        Array.C.electricOutput.DC.Power_40_3 = IVResult.Vmp*Array.C.Inverter.Ms_40 .* IVResult.Imp*Array.C.Inverter.Mp_3;
        
        subplot(3,1,3)
        plot(dHr,Array.C.electricOutput.DC.Power_40_3)
        hold all
        plot(dHr,Array.C.electricOutput.DC.Power_60_2)
        grid on
        legend('Ms 40', 'Ms 60')
        ylabel('Power Block C (W)')
        xlabel('Hour of Day')

%% Block D
        figure('Name',DateSpan,'OuterPosition',[100 100 700 800])
        
        %Current
        subplot(3,1,1)
        plot(dHr,IVResult.Imp*Array.D.Inverter.Mp)
        hold on
        grid on
        ylabel('Current Block D (A)')
        title('Buttenwiesen DC Array Output Block D per Inverter-'+ DateSpan,'FontSize',14)
        
        %Voltage
        subplot(3,1,2)
        plot(dHr,IVResult.Vmp*Array.D.Inverter.Ms_48)
        hold all
        plot(dHr,IVResult.Vmp*Array.D.Inverter.Ms_60)
        grid on
        legend('Ms 48', 'Ms 60')
        ylabel('Voltage Block D (V)')
        
        %Power
        % Modules in serie 48
        Array.D.electricOutput.DC.Power_48 = IVResult.Vmp*Array.D.Inverter.Ms_48 .* IVResult.Imp*Array.D.Inverter.Mp;
        % Modules in serie 60
        Array.D.electricOutput.DC.Power_60 = IVResult.Vmp*Array.D.Inverter.Ms_60 .* IVResult.Imp*Array.D.Inverter.Mp;
        
        subplot(3,1,3)
        plot(dHr,Array.D.electricOutput.DC.Power_48)
        hold all
        plot(dHr,Array.D.electricOutput.DC.Power_60)
        grid on
        legend('Ms 48', 'Ms 60')
        ylabel('Power Block D (W)')
        xlabel('Hour of Day')
end
