

function hello
clc; clear;
close all;

numberOfFiles = 5;
normalizationFactor = 12/(5.14797364*5.083665334*5.014280303);




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



