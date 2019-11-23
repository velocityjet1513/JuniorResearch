

function hello
clc; clear;
close all;

numberOfFiles = 5;
normalizationFactor = 12/(5.14797364*5.083665334*5.014280303);

for k =1:numberOfFiles
myfilename = sprintf('rdf_%d_80.txt',k);
mydata{k} = importdata(myfilename);
x1 = mydata{k}(:,2); 
y1 = mydata{k}(:,3); 
y1 = normalizationFactor*y1; 


plotting(x1,y1,k);
end




% plotting
function plotting(x1,y1,k)
figure(1)
area(x1,y1,'LineWidth',0.1,...
        'FaceColor',[0.85 0.85 0.85]);
hold on
plot(x1,y1,'-r','LineWidth',1.5);    
hold off
ax = gca; grid on;
ax.Title.FontSize = 20;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
ax.YAxis.Color = 'k';
xlim([1.0,1.7]);
%ylim([0 1.1]);
xlabel('Interatomic distance $r$ (\AA)','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Radial distribution function','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
print('-depsc','-r1200',sprintf('rdf_%d_80',k));
close(figure(1));













% NOT NEEDED -----------------------------------
%line([1.60 1.60],[0, 2],'LineWidth',1,'LineStyle','--','Color','k');
%line([2.47 2.47],[0, 2],'LineWidth',1,'LineStyle','--','Color','k');
%line([5 5],[0, 2],'LineWidth',1,'LineStyle','-','Color','b');
%dim = [.75 .6 .3 .3];
%    str = ['(a)'];
%    annotation('textbox',dim,'String',str,'FitBoxToText','on',...
%        'FontSize',20,'LineStyle','none');
%dim = [.55 .3 .3 .3];
%    str = ['continuum'];
%    annotation('textbox',dim,'String',str,'FitBoxToText','on',...
%        'FontSize',20,'LineStyle','none');
%dim = [.55 .25 .3 .3];
%    str = ['(r > R_c)'];
%    annotation('textbox',dim,'String',str,'FitBoxToText','on',...
%        'FontSize',20,'LineStyle','none');
 %dim = [.19 .20 .3 .3];
 %str = ['n=',num2str(coefficeints_modulus_curve(3))];
 %  annotation('textbox',dim,'String','r_{1nn}','FitBoxToText','on',...
 %          'FontSize',24,'LineStyle','none');  
 %  dim = [.27 .30 .3 .3];
 %str = ['n=',num2str(coefficeints_modulus_curve(3))];
 %annotation('textbox',dim,'String','r_{2nn}','FitBoxToText','on',...
 %        'FontSize',24,'LineStyle','none');
%  normalizationFactor = [12/(5.14797364*5.083665334*5.014280303)
%                        12/(5.14797364*5.083665334*5.014280303)
%                        12/(5.14797364*5.083665334*5.014280303)
%                        12/(5.14797364*5.083665334*5.014280303)
%                        12/(5.14797364*5.083665334*5.014280303)];