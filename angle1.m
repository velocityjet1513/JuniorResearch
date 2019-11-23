clearvars
numberoffiles=80;

for k = 1:numberoffiles

    myfilename = sprintf('deform_%d.txt',k);
    headerlinesIn = 9;
    delimiterIn = ' ';
    coordinates{k} = importdata(myfilename,delimiterIn,headerlinesIn);
    x = coordinates{1,k}.data(:,3);
    y = coordinates{1,k}.data(:,4);
    z = coordinates{1,k}.data(:,5);
    
    %carboncarbon
%4-2-10

[vector1,vector2] = calcvector(4,2,10,x,y,z);
anglea = dotproduct(vector1,vector2);
%2-10-8
[vector1,vector2] = calcvector(2,10,8,x,y,z);
angleb = dotproduct(vector1,vector2);

angleCCC(k) = (anglea+angleb)/2;



%carbonhydrogen
%10-2-3
[vector1,vector2] = calcvector(10,2,3,x,y,z);
anglea = dotproduct(vector1,vector2);
%10-2-6
[vector1,vector2] = calcvector(10,2,6,x,y,z);
angleb = dotproduct(vector1,vector2);
%2-10-7
[vector1,vector2] = calcvector(2,10,7,x,y,z);
anglec = dotproduct(vector1,vector2);
%2-10-11
[vector1,vector2] = calcvector(2,10,11,x,y,z);
angled = dotproduct(vector1,vector2);

angleCCH(k) = (anglea+angleb+anglec+angled)/4;


%carbonfluorine
%2-4-1
[vector1,vector2] = calcvector(2,4,1,x,y,z);
anglea = dotproduct(vector1,vector2);
%2-4-5
[vector1,vector2] = calcvector(2,4,5,x,y,z);
angleb = dotproduct(vector1,vector2);
%10-8-12
[vector1,vector2] = calcvector(10,8,12,x,y,z);
anglec = dotproduct(vector1,vector2);
%10-8-9
[vector1,vector2] = calcvector(10,8,9,x,y,z);
angled = dotproduct(vector1,vector2);

angleCCF(k) = (anglea+angleb+anglec+angled)/4;

    
end

plotting(angleCCC,angleCCH,angleCCF);

% calculate vectors
function [vector1,vector2] = calcvector(a,b,c,x,y,z)
vector1 = [x(a,1)-x(b,1) y(a,1)-y(b,1) z(a,1)-z(b,1)];
vector2 = [x(c,1)-x(b,1) y(c,1)-y(b,1) z(c,1)-z(b,1)];

end

% calculate angles
function angle = dotproduct(vector1,vector2)

CosTheta = dot(vector1,vector2)/(norm(vector1)*norm(vector2));
angle = acosd(CosTheta);

end

function plotting(angleCCC,angleCCH,angleCCF);

xvalue = [0.005:0.005:0.4]

figure(1)


plot(xvalue,angleCCC,'-r','LineWidth',1.5);    

  
ax = gca; grid on;
ax.Title.FontSize = 20;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
ax.YAxis.Color = 'k';
xlim([0,0.5]);
%ylim([0 1.1]);
xlabel('Axial Strain','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Angle Between Bonds (Degrees)','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
print('-depsc','-r1200',sprintf('1_CCC'));
close(figure(1));

figure(1)


plot(xvalue,angleCCH,'-r','LineWidth',1.5);    

  
ax = gca; grid on;
ax.Title.FontSize = 20;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
ax.YAxis.Color = 'k';
xlim([0,0.5]);
%ylim([0 1.1]);
xlabel('Axial Strain','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Angle Between Bonds (Degrees)','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
print('-depsc','-r1200',sprintf('1_CCH'));
close(figure(1));

figure(1)


plot(xvalue,angleCCF,'-r','LineWidth',1.5);    

  
ax = gca; grid on;
ax.Title.FontSize = 20;
ax.XAxis.FontSize = 20;
ax.YAxis.FontSize = 20;
ax.YAxis.Color = 'k';
xlim([0,0.5]);
%ylim([0 1.1]);
xlabel('Axial Strain','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
ylabel('Angle Between Bonds (Degrees)','Interpreter','latex','FontSize',20,'FontWeight','bold','Color','k');
print('-depsc','-r1200',sprintf('1_CCF'));
close(figure(1));

end
