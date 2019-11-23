clc;
clear all;
close all;
numfiles = 5;
%unix('rm *.eps *.pdf');
set (figure, 'defaultLegendAutoUpdate', 'off');

for k = 1:numfiles
    
    myfilename1 = sprintf('%d/energyFiles/all_sp_Orbitals_C_1.txt',k);    
    mydata1{k} = importdata(myfilename1);

    
    y1 = mydata1{k}(:,5);
    y2 = mydata1{k}(:,8);
    y3 = mydata1{k}(:,6);
    y4 = mydata1{k}(:,9);
    y5 = mydata1{k}(:,4);
    y6 = mydata1{k}(:,7);
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
            'interpreter','latex',...
            'FontSize',16,'location','northwest',...
            'box','off');
        
        yline(0,'--','Linewidth', 2);
    end 
end  

    grid on;        
    ax = gca;
    set(gcf,'Renderer','Painters');
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

    %str = ['(a)' num2str(yplot(maxLoc)) ' GPa'];
%    legend('Location','northwest','d_0=10.7',...
%        'd_0=15.0','d_0=18.2','d_0=20.8','d_0=23.1','d_0=25.5','d_0=27.4');
%    xlim([0,0.15]);
%    ylim([0.0,5.5]);
%    legend('Location','northwest',{'small-large (S2L)',...
%        'large-small (L2S)'},'FontSize',16);
    
%     image = imread('multiple_holes_v.png');
%     axes('position',[0.35,0.17,0.38,0.38])
%     imshow(image);