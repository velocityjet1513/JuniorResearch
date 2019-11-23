clc;
clear all;
close all;
numfiles = 5;
%unix('rm *.eps *.pdf');
set (figure, 'defaultLegendAutoUpdate', 'off');

for k = 1:numfiles
    

    
    y1 = y1 + y2 + y3 + y4 + y5 + y6;
    y1 = (y1 - y1(1,1))./y1(1,1);
    [row_size, col_size] = size(y1);
    x1 = 0.0:1:row_size;
    x1 = x1*0.005;
    figure(1);
    
    plot(x1(1:row_size),y1(1:row_size),'-o',...
                'LineWidth',1.5,...
                'MarkerSize',5);  
            
    hold on 
    if k==numfiles
    legend('show');
    legend({'CF$_2$CH$_2$CH$_2$CF$_2$',...
            'CHFCH$_2$CHFCF$_2$',...
            'CH$_2$CF$_2$CH$_2$CF$_2$',...
            'CF$_2$CH$_2$CHFCFH',...
            'CH$_2$CH$_2$CH$_2$CH$_2$'},...
    end 
end  

    ax.XAxis.FontSize = 20;
    ax.YAxis.FontSize = 20;
    ylim([-0.1,0.05]);
    xlabel('Strain','FontSize',20,'FontWeight','bold','Color','k');
    ylabel('Electronic charge','FontSize',20,'FontWeight','bold','Color','k');
    dim = [.20 .10 0.25 0.25];
    str = ['(a)'];
    annotation('textbox',dim,'String',str,...
            'FitBoxToText','on','FontSize',18,'LineStyle','none');
    print('-depsc','-r600',sprintf('electronRender/pElectron_C1.eps'));
    hold off;
    display('Done');

