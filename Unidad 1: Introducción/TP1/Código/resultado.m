clc;
clf;
clear all;
% En este script, se resuelve el sistema con la ode y se obtiene el gif con
% los resultados del ejercicio.

% ---------------------------------------------
% ---------------DATOS DE TIEMPO---------------
tini = 0; % tiempo inicial
tfin = 50; % tiempo final
T = 0.1; % período
t=tini:T:tfin-T; % intervalo de tiempo
n = tfin/T; % número de muestras para usar en índices

% ---------------------------------------------
% ------------CONDICIONES INICIALES------------
% Posición:
% Para el nodo 1, el soporte es inmovil. Mantengo condiciones iniciales.
% Para el nodo 2, el soporte es móvil en x. Mantengo condición inicial en y.
% xi_0 = [x2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9,x10,y10,x11,y11,x12,y12,x13,y13,x14,y14];
xi_0 = [40 0 10 10 10 30 10 40 10 0 20 10 20 20 20 30 20 40 20 10 30 20 30 30 30];
% Velocidad:
% vi_0 = [u2,u3,v3,u4,v4,u5,v5,u6,v6,u7,v7,u8,v8,u9,v9,u10,v10,u11,v11,u12,v12,u13,v13,u14,v14];
vi_0 = zeros(1,25);
% Vector completo:
y = [xi_0, vi_0];

% ---------------------------------------------
% -------------RESUELVO EL SISTEMA-------------
[t,y] = ode23(@sistema,t,y);

% ---------------------------------------------
% ------------FUERZA SOBRE BARRA 13------------
for i = 1:n
   F(i) = norm(fuerza(xi_0(20:21),xi_0(14:15),y(i,20:21),y(i,14:15),2)); % obtengo magnitud
endfor

figure(1)
hold on
grid on
% Grafico fuerza en la barra:
plot(t,F)
title('Fuerza sobre Barra 13')
xlabel('Tiempo (t)')
ylabel('Fuerza (F)')

% ---------------------------------------------
% -------------POSICIÓN DE NODO 13-------------
figure(2)
hold on
grid on
% Grafico posición en X para el nodo:
subplot(2,1,1)
plot(t,y(1:n, 22));
title('Posicion X Nodo 13')
xlabel('Tiempo (t)');
ylabel('Posición (x)');
% Grafico posición en Y para el nodo:
subplot(2,1,2)
plot(t,y(1:n, 23));
title('Posicion Y Nodo 13')
xlabel('Tiempo (t)');
ylabel('Posición (y)');

% ---------------------------------------------
% -----------DESPLAZAMIENTO MÁXIMO-------------
% obtengo diferencia entre coordenadas actuales e iniciales
for i=1:25
  desplazamientos(:,i) = abs(y(:,i) - xi_0(i));
endfor
% obtengo magnitud sacando la norma entre el desplazamiento en x y en y
magnitud_desplazamiento(:,1) = desplazamientos(:,1); % para el nodo 2, sólo tengo el desplazamiento en y
cont = 1;
for i = 2:2:24
  cont += 1;
  for j = 1:length(desplazamientos(:,i))
    magnitud_desplazamiento(j,cont) = norm([desplazamientos(j,i) desplazamientos(j,i+1)]);
  endfor
endfor

% Armo la salida para el máximo desplazamiento de cada nodo con la función max:
  [max n_max]=max(magnitud_desplazamiento);
  max=max
  t_max=n_max*T % multiplico por T para obtener tiempo en vez de número de muestras
disp('      2(y)       3         4         5         6         7         8         9         10        11        12        13       14');

% Grafico los desplazamientos:
figure(3)
hold on
grid on
title('Magnitud del desplazamiento de cada nodo')
xlabel('Tiempo (t)')
ylabel('Desplazamiento')
plot(t,magnitud_desplazamiento)
legStr = {'Nodo 2 (y)','Nodo 3','Nodo 4','Nodo 5','Nodo 6','Nodo 7','Nodo 8','Nodo 9','Nodo 10','Nodo 11','Nodo 12','Nodo 13','Nodo 14'};
legend(legStr,'location','northwest')

% ---------------------------------------------
% ----------ANIMACIÓN DEL RETICULADO-----------

% PLOT DE BARRAS:
figure(4)
axis([-10 50 -10 40])
hold on; grid on;
title('Movimiento del reticulado')
xlabel('Posición (x)');
ylabel('Posición (y)');

%        [1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16  17  18  19  20  21  22  23  24  25]
%inipos= [X2 X3 Y3 X4 Y4 X5 Y5 X6 Y6 X7 Y7 X8 Y8 X9 Y9 X10 Y10 X11 Y11 X12 Y12 X13 Y13 X14 Y14]
h(1)=plot([0, y(1,2)],[0, y(1,3)],"k"); % Barra de 1 a 3
h(2)=plot([0, y(1,4)],[0, y(1,5)],"k"); % Barra de 1 a 4
h(3)=plot([y(1,4),y(1,2)],[y(1,5),y(1,3)],"k"); % Barra de 4 a 3
h(4)=plot([y(1,4),y(1,12)],[y(1,5),y(1,13)],"k"); % Barra de 4 a 8
h(5)=plot([y(1,12),y(1,10)],[y(1,13),y(1,11)],"k"); % Barra de 8 a 7
h(6)=plot([y(1,10),y(1,2)],[y(1,11),y(1,3)],"k"); % Barra de 7 a 3
h(7)=plot([y(1,12),y(1,2)],[y(1,13),y(1,3)],"k"); % Barra de 8 a 3
h(8)=plot([y(1,10),y(1,20)],[y(1,11),y(1,21)],"k"); % Barra de 7 a 12
h(9)=plot([y(1,12),y(1,20)],[y(1,13),y(1,21)],"k"); % Barra de 8 a 12
h(10)=plot([y(1,12),y(1,14)],[y(1,13),y(1,15)],"k"); % Barra de 8 a 9
h(11)=plot([y(1,14),y(1,22)],[y(1,15),y(1,23)],"k"); % Barra de 9 a 13
h(12)=plot([y(1,20),y(1,22)],[y(1,21),y(1,23)],"k"); % Barra de 12 a 13
h(13)=plot([y(1,20),y(1,14)],[y(1,21),y(1,15)],"k"); % Barra de 12 a 9
h(14)=plot([y(1,1),y(1,8)],[0,y(1,9)],"k"); % Barra de 2 a 6
h(15)=plot([y(1,1),y(1,6)],[0,y(1,7)],"k"); % Barra de 2 a 5
h(16)=plot([y(1,6),y(1,8)],[y(1,7),y(1,9)],"k"); % Barra de 5 a 6
h(17)=plot([y(1,6),y(1,16)],[y(1,7),y(1,17)],"k"); % Barra de 5 a 10
h(18)=plot([y(1,16),y(1,18)],[y(1,17),y(1,19)],"k"); % Barra de 10 a 11
h(19)=plot([y(1,18),y(1,8)],[y(1,19),y(1,9)],"k"); % Barra de 11 a 6
h(20)=plot([y(1,16),y(1,8)],[y(1,17),y(1,9)],"k"); % Barra de 10 a 6
h(21)=plot([y(1,18),y(1,24)],[y(1,19),y(1,25)],"k"); % Barra de 11 a 14
h(22)=plot([y(1,16),y(1,24)],[y(1,17),y(1,25)],"k"); % Barra de 10 a 14
h(23)=plot([y(1,16),y(1,14)],[y(1,17),y(1,15)],"k"); % Barra de 10 a 9
h(24)=plot([y(1,24),y(1,22)],[y(1,25),y(1,23)],"k"); % Barra de 14 a 13
h(25)=plot([y(1,24),y(1,14)],[y(1,25),y(1,15)],"k"); % Barra de 14 a 9

% ANIMACIÓN:
for i = 1:length(y)
pause(0.01)
set(h(1),'xdata',[0, y(i,2)],'ydata',[0, y(i,3)])
set(h(2),'xdata',[0, y(i,4)],'ydata',[0, y(i,5)])
set(h(3),'xdata',[y(i,4),y(i,2)],'ydata',[y(i,5),y(i,3)])
set(h(4),'xdata',[y(i,4),y(i,12)],'ydata',[y(i,5),y(i,13)])
set(h(5),'xdata',[y(i,12),y(i,10)],'ydata',[y(i,13),y(i,11)])
set(h(6),'xdata',[y(i,10),y(i,2)],'ydata',[y(i,11),y(i,3)])
set(h(7),'xdata',[y(i,12),y(i,2)],'ydata',[y(i,13),y(i,3)])
set(h(8),'xdata',[y(i,10),y(i,20)],'ydata',[y(i,11),y(i,21)])
set(h(9),'xdata',[y(i,12),y(i,20)],'ydata',[y(i,13),y(i,21)])
set(h(10),'xdata',[y(i,12),y(i,14)],'ydata',[y(i,13),y(i,15)])
set(h(11),'xdata',[y(i,14),y(i,22)],'ydata',[y(i,15),y(i,23)])
set(h(12),'xdata',[y(i,20),y(i,22)],'ydata',[y(i,21),y(i,23)])
set(h(13),'xdata',[y(i,20),y(i,14)],'ydata',[y(i,21),y(i,15)])
set(h(14),'xdata',[y(i,1),y(i,8)],'ydata',[0,y(i,9)])
set(h(15),'xdata',[y(i,1),y(i,6)],'ydata',[0,y(i,7)])
set(h(16),'xdata',[y(i,6),y(i,8)],'ydata',[y(i,7),y(i,9)])
set(h(17),'xdata',[y(i,6),y(i,16)],'ydata',[y(i,7),y(i,17)])
set(h(18),'xdata',[y(i,16),y(i,18)],'ydata',[y(i,17),y(i,19)])
set(h(19),'xdata',[y(i,18),y(i,8)],'ydata',[y(i,19),y(i,9)])
set(h(20),'xdata',[y(i,16),y(i,8)],'ydata',[y(i,17),y(i,9)])
set(h(21),'xdata',[y(i,18),y(i,24)],'ydata',[y(i,19),y(i,25)])
set(h(22),'xdata',[y(i,16),y(i,24)],'ydata',[y(i,17),y(i,25)])
set(h(23),'xdata',[y(i,16),y(i,14)],'ydata',[y(i,17),y(i,15)])
set(h(24),'xdata',[y(i,24),y(i,22)],'ydata',[y(i,25),y(i,23)])
set(h(25),'xdata',[y(i,24),y(i,14)],'ydata',[y(i,25),y(i,15)])
endfor
