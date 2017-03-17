%% Simulación Combinador Convexo:
clear all;
close all;
clc;
% Evalua la rejilla
Cv=1.6e-4;%m^(5/2)/s
D=0.4;%[m]
L=0.6;%[m]
Ts=5000;
dt=5;
warning('off','all');
C=[];
u=[];
n=16;
tic
for j=1:n+1
    for i=1:n+1
        disp('i'); 
        i
        disp('j'); 
        j
        C1=1.0*(i/n-1/n-0.0); C2=1.0*(j/n-1/n-0.0);
        sim('modelo.mdl');
        datos1=Datos1.signals.values;
        datos=Datos.signals.values;
        C=[C,datos1(:,1)];
        u=[u,datos(:,1)];
    end
end
a=toc;
% Respuestas Temporales
%figure(19),plot(C)
%figure(20),plot(u)
%% Analisis de los indices de desempeño
% Grafica ISE:
E=C-0.3;
ISE=(sum(E.^2,1)/Ts).^0.5;
ISE=reshape(ISE,n+1,n+1);
D=[0:1/n:1];
ISE1=ISE;
ISE1(ISE>0.036)=nan;
figure(29),mesh(D,D,ISE1);colormap([0 0 0]);axis tight
title('Superficie ISE en función de \lambda_{1} y \lambda_{2}','FontSize',16),xlabel('Parámetro \lambda_{2}','FontSize',12),
ylabel('Parámetro \lambda_{1}','FontSize',12),zlabel('Valor ISE','FontSize',12)
% Grafica ITSE:
T=1:size(E,1);
ITSE=(sum(E.^2.*(ones(size(E,2),1)*T)',1)).^0.5/(Ts).^0.5;
ITSE=reshape(ITSE,n+1,n+1);
ITSE1=ITSE;
ITSE1(ITSE>0.3)=nan;
D=[0:1/n:1];
figure(37),mesh(D,D,ITSE1);colormap([0 0 0]);axis tight
title('Superficie ITSE en función de \lambda_{1} y \lambda_{2}','FontSize',16),xlabel('Parámetro \lambda_{2}','FontSize',12),
ylabel('Parámetro \lambda_{1}','FontSize',12),zlabel('Valor ITSE','FontSize',12)
%% Encontrando minimos y comparando con los extremos
[lise1,lise2]=find(ISE==min(ISE(:)));
index2=[ISE(1,1) ISE(1,end) ISE(end,1) ISE(end,end) ISE(lise1(1),lise2(1))]
improvementISE=100-100*ISE(lise1(1),lise2(1))/min(index2(1:end-1))
[litse1,litse2]=find(ITSE==min(ITSE(:)));
index1=[ITSE(1,1) ITSE(end,1) ITSE(1,end) ITSE(end,end) ITSE(litse1(1),litse2(1))]
improvementITSE=100-100*ITSE(litse1(1),litse2(1))/min(index1(1:end-1))

%% Respuestas Temporales de algunos parametros
Cv=1.6e-4;%m^(5/2)/s
D=0.4;%[m]
L=0.6;%[m]
Ts=5000;
dt=5;
warning('off','all');
Co=[];
u=[];
n=16;
%CC=[0,0;1,0;0,1;1,1;litse1(1)/(n+1),litse2(1)/(n+1);lise1(1)/(n+1),lise2(1)/(n+1)];
CC=[0,0;1,0;0,1;1,1;litse1(1)/(n+1),litse2(1)/(n+1)]
for j=1:size(CC,1)
    j
    C1=CC(j,1); C2=CC(j,2);
    sim('modelo.mdl');
    datos1=Datos1.signals.values;
    datos=Datos.signals.values;
    Co=[Co,datos1(:,1)];
    u=[u,datos(:,1)];
end
sim('modeloBoole.mdl');
datos1=Datos1.signals.values;
Co=[Co,datos1(:,1)];
%% Grafico
figure(1),hold on;
SUBV=floor(linspace(1,size(Co,1),floor(size(Co,1)/60)));
SUBD=linspace(1,Ts,size(Co,1))';
plot(SUBD(SUBV),Co(SUBV,1),'^','LineWidth',2);
plot(SUBD(SUBV),Co(SUBV,2),'ro','LineWidth',2);
plot(SUBD(SUBV),Co(SUBV,3),'gs','LineWidth',2);
plot(SUBD(SUBV),Co(SUBV,4),'cd','LineWidth',2);
plot(SUBD(SUBV),Co(SUBV,5),'k>','LineWidth',2);
plot(SUBD(SUBV),Co(SUBV,6),'m*','LineWidth',2);

plot(linspace(1,Ts,size(Co,1))',Co(:,1),'b','LineWidth',1);
plot(linspace(1,Ts,size(Co,1))',Co(:,2),'r','LineWidth',1);
plot(linspace(1,Ts,size(Co,1))',Co(:,3),'g','LineWidth',1);
plot(linspace(1,Ts,size(Co,1))',Co(:,4),'c','LineWidth',1);
plot(linspace(1,Ts,size(Co,1))',Co(:,5),'k','LineWidth',1);
plot(linspace(1,Ts,size(Co,1))',Co(:,6),'m','LineWidth',1);

%plot(linspace(1,Ts,size(Co,1))',Co(:,6),'LineWidth',2);

legend([num2str(CC(1:end,:));'  Control Booleano '],'Location','SouthEast');
title('Respuestas Temporales Para Distintos Parámetros','FontSize',15), xlabel('Tiempo [s]','FontSize',15),ylabel('Nivel [m]','FontSize',15);
text(3880,0.17,'\lambda_{1}','HorizontalAlignment','right','fontSize',13)
text(4480,0.17,'\lambda_{2}','HorizontalAlignment','right','fontSize',13)

%% Calculo de los indices para el controlador Booleano
E=Co-0.3;
ISE=(sum(E.^2,1)/Ts).^0.5;
ITSE=(sum(E.^2.*(ones(size(E,2),1)*T)',1)).^0.5/(Ts).^0.5;
