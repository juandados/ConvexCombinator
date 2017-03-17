% En este archivo se incluyen las graficas de simulación del articulo del 
% tanque
%% CONJUNTOS DIFUSOS Y BOOLEANOS
%Conjuntos Difusos
U1=[-5:0.1:5];
U2=[-5:0.1:5];
v1=U1/4.*(U1>0).*(U1<4)+(U1>=4);
v2=-U1/4.*((-U1)>0).*((-U1)<4)+((-U1)>=4);
v3=(U2/4+0.5).*(U2>-2).*(U2<2)+(U2>=2);
%Conjuntos Booleanos
b1=U1>2;
b2=U1<-2;
b3=U2>0;
%Graficas
%pos
figure(19),plot(U1,[b1;b2],':','linewidth',2),hold on;
plot(U1,[v1;v2],'linewidth',2),title('Conceptos asociados al error','FontSize',20),
xlabel('Error [cm]','FontSize',20),ylabel('Pertenencia','FontSize',20),legend('Boolean \mu_{P}(e)','Boolean \mu_{N}(e)','\mu_{P}(e)','\mu_{N}(e)');
h=legend('Location', 'Best');
set(h,'FontSize',12);
axis(axis+[0 0 -0.1 0.1]);
%vel
figure(31),plot(U1,[v3],'linewidth',2),title('Conceptos asociados a la derivada del error','FontSize',20),
xlabel('Derivada error [cm/s]','FontSize',20),ylabel('Pertenencia','FontSize',20),legend('\mu_{P}(de/dt)');
h=legend('Location', 'Best');
set(h,'FontSize',12);
axis(axis+[0 0 -0.1 0.1]);

%% SUPERFICIES DE CONTROL
U1=[-10:0.6:10];
U2=[-10:0.6:10];
[u2,u1]=meshgrid(U1,U2);
V3=(u1>4)+(1/4*u1).*((u1>=0).*(u1<=4));%% cambiar estos
V2=(u1<-4)+(-1/4*u1).*((u1>=-4).*(u1<=0));
V1=(u2>2)+(1/4*u2+0.5).*((u2>=-2).*(u2<=2));
f1=U(Y(V3,1-V2,1-V1),Y(V3,1-V2,V1));
f2=U(Y(1-V3,V2,1-V1),Y(1-V3,V2,V1),Y(V3,1-V2,V1));
F1=Y(U(V3,V2,V1),U(V3,V2,1-V1),U(V3,1-V2,V1),U(V3,1-V2,1-V1));
F2=Y(U(V3,V2,V1),U(V3,V2,1-V1),U(1-V3,V2,V1));
ym = (0.15*f1+0.05*f2)*1e-4;
yM = (0.15*F1+0.05*F2)*1e-4;
figure(15),mesh(U1,U2,ym);colormap([0 0 0]);axis tight
title('Mínima Acción De Control','FontSize',16),xlabel('Derivada del error [cm/s]','FontSize',12),
ylabel('Error [cm]','FontSize',12),zlabel('Flujo de liquido [m^3/s]','FontSize',12)
figure(18),mesh(U1,U2,yM);colormap([0 0 0]);axis tight
title('Máxima Acción De Control','FontSize',16),xlabel('Derivada del error [cm/s]','FontSize',12),
ylabel('Error [cm]','FontSize',12),zlabel('Flujo de liquido [m^3/s]','FontSize',12)
