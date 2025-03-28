%% InverterScript.m
% 
% calculate AC outputs of inverter and the entire block/system 
% with the snl-model
% 
% Jonathan Huth
% 
% 27.03.2025

%% Inverter Output
switch Block
    % Block A
    case 'A'
        % calculate inverter SNL
        Array.A.electricOutput.AC.Inverter.Power06 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.A.Inverter.Ms,Array.A.electricOutput.DC.Power);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])        
        subplot(2,1,1)
        plot(dHr,Array.A.electricOutput.AC.Inverter.Power06)        
        grid on        
        title('Buttenwiesen AC Inverter Output Block A - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

        % Calculate Power Output Block
        Array.A.electricOutput.AC.Block.Power06 = Array.A.electricOutput.AC.Inverter.Power06 * 9;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.A.electricOutput.AC.Block.Power06)        
        grid on
        title('Buttenwiesen AC Output Block A - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    % Block B
    case 'B'
        % calculate inverter SNL
        Array.B.electricOutput.AC.Inverter.Power06 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.B.Inverter.Ms,Array.B.electricOutput.DC.Power);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.B.electricOutput.AC.Inverter.Power06)        
        grid on        
        title('Buttenwiesen AC Inverter Output Block B - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

        % Calculate Power Output Block
        Array.B.electricOutput.AC.Block.Power06 = Array.B.electricOutput.AC.Inverter.Power06 * 9;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.B.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block B - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    % Block C
    case 'C'
        % calculate inverter SNL
        % Modules in serie 40
        Array.C.electricOutput.AC.Inverter.Power06_40 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.C.Inverter.Ms_40, Array.C.electricOutput.DC.Power_40_3);
        % Modules in serie 60
        Array.C.electricOutput.AC.Inverter.Power06_60 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.C.Inverter.Ms_60, Array.C.electricOutput.DC.Power_60_2);

        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.C.electricOutput.AC.Inverter.Power06_40)        
        grid on
        hold all        
        plot(dHr,Array.C.electricOutput.AC.Inverter.Power06_60)
        title('Buttenwiesen AC Inverter Output Block C - '  + DateSpan,'FontSize',14)        
        legend('Inverter 06 Ms 40','Inverter 06 Ms 60')
        ylabel('Power (W)')
        xlabel('Hour of Day')

        % Calculate Power Output Block
        Array.C.electricOutput.AC.Block.Power06 = Array.C.electricOutput.AC.Inverter.Power06_40 * 3 + Array.C.electricOutput.AC.Inverter.Power06_60 * 7;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.C.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block C - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

% Block D
    case 'D'
        % calculate inverter SNL
        % Modules in serie 48
        Array.D.electricOutput.AC.Inverter.Power06_48 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.D.Inverter.Ms_48, Array.D.electricOutput.DC.Power_48);
        % Modules in serie 60
        Array.D.electricOutput.AC.Inverter.Power06_60 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.D.Inverter.Ms_60, Array.D.electricOutput.DC.Power_60);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.D.electricOutput.AC.Inverter.Power06_48)        
        grid on
        hold all        
        plot(dHr,Array.D.electricOutput.AC.Inverter.Power06_60)      
        title('Buttenwiesen AC Inverter Output Block D - '  + DateSpan,'FontSize',14)
        legend('Inverter 06 Ms 48','Inverter 06 Ms 60')
        ylabel('Power (W)')
        xlabel('Hour of Day')
        
        % Calculate Power Output Block
        Array.D.electricOutput.AC.Block.Power06 = Array.D.electricOutput.AC.Inverter.Power06_48 * 8 + Array.D.electricOutput.AC.Inverter.Power06_60 * 4;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.D.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block D - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    otherwise
    %% Block A
        % calculate inverter SNL
        Array.A.electricOutput.AC.Inverter.Power06 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.A.Inverter.Ms,Array.A.electricOutput.DC.Power);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.A.electricOutput.AC.Inverter.Power06)        
        grid on        
        title('Buttenwiesen AC Inverter Output Block A - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

        % Calculate Power Output Block
        Array.A.electricOutput.AC.Block.Power06 = Array.A.electricOutput.AC.Inverter.Power06 * 9;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.A.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block A - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    %% Block B
        % calculate inverter SNL
        Array.B.electricOutput.AC.Inverter.Power06 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.B.Inverter.Ms,Array.B.electricOutput.DC.Power);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.B.electricOutput.AC.Inverter.Power06)        
        grid on        
        title('Buttenwiesen AC Inverter Output Block B - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')
        
        % Calculate Power Output Block
        Array.B.electricOutput.AC.Block.Power06 = Array.B.electricOutput.AC.Inverter.Power06 * 9;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.B.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block B - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    %% Block C
        % calculate inverter SNL
        % Modules in serie 40
        Array.C.electricOutput.AC.Inverter.Power06_40 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.C.Inverter.Ms_40, Array.C.electricOutput.DC.Power_40_3);
        % Modules in serie 60
        Array.C.electricOutput.AC.Inverter.Power06_60 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.C.Inverter.Ms_60, Array.C.electricOutput.DC.Power_60_2);

        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.C.electricOutput.AC.Inverter.Power06_40)        
        grid on
        hold all        
        plot(dHr,Array.C.electricOutput.AC.Inverter.Power06_60)
        title('Buttenwiesen AC Inverter Output Block C - '  + DateSpan,'FontSize',14)        
        legend('Inverter 06 Ms 40','Inverter 06 Ms 60')
        ylabel('Power (W)')
        xlabel('Hour of Day')

        % Calculate Power Output Block
        Array.C.electricOutput.AC.Block.Power06 = Array.C.electricOutput.AC.Inverter.Power06_40 * 3 + Array.C.electricOutput.AC.Inverter.Power06_60 * 7;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.C.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block C - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')

    %% Block D
        % calculate inverter SNL
        % Modules in serie 48
        Array.D.electricOutput.AC.Inverter.Power06_48 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.D.Inverter.Ms_48, Array.D.electricOutput.DC.Power_48);
        % Modules in serie 60
        Array.D.electricOutput.AC.Inverter.Power06_60 = pvl_snlinverter(inverter_06, IVResult.Vmp*Array.D.Inverter.Ms_60, Array.D.electricOutput.DC.Power_60);
        
        % Plot AC-Output
        figure('Name',DateSpan,'OuterPosition',[100 100 700 900])
        subplot(2,1,1)
        plot(dHr,Array.D.electricOutput.AC.Inverter.Power06_48)        
        grid on
        hold all        
        plot(dHr,Array.D.electricOutput.AC.Inverter.Power06_60)        
        title('Buttenwiesen AC Inverter Output Block D - '  + DateSpan,'FontSize',14)
        legend('Inverter 06 Ms 48','Inverter 06 Ms 60')
        ylabel('Power (W)')
        xlabel('Hour of Day')
        
        % Calculate Power Output Block
        Array.D.electricOutput.AC.Block.Power06 = Array.D.electricOutput.AC.Inverter.Power06_48 * 8 + Array.C.electricOutput.AC.Inverter.Power06_60 * 4;
        
        % Plot AC-Output
        subplot(2,1,2)
        plot(dHr,Array.D.electricOutput.AC.Block.Power06)        
        grid on        
        title('Buttenwiesen AC Output Block D - '  + DateSpan,'FontSize',14)
        ylabel('Power (W)')
        xlabel('Hour of Day')
end
        
        

        