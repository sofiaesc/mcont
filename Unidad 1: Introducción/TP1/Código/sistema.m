% La función recibe el intervalo de tiempo y la posición actual de los nodos.
function dy = sistema(t,y)

% ---------------------------------------------
% -------------------DATOS---------------------
% CONDICIONES INICIALES:
% xi = [x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9,x10,y10,x11,y11,x12,y12,x13,y13,x14,y14];
xi = [0 0 40 0 0 10 10 10 30 10 40 10 0 20 10 20 20 20 30 20 40 20 10 30 20 30 30 30];

% CONSTANTES RESORTES:
k = [2 2 2 2 4 2 2 2 2 4 2 4 2 2 2 2 2 4 2 2 2 2 4 4 2];

% MASAS:
m = [1 1 1 1 1 1 1 2 1 2 1 2 2 2];

% Carga uniforme (inciso a):
P = [0,1];

% Carga sinusoidal (inciso b):
f = 5; % frecuencia
%P = [0,sin(f*t)];

% ---------------------------------------------
% -------------CÁLCULO DE FUERZAS--------------
% Calculo una vez cada par y aplico Fij = -Fij
F13 = fuerza(xi(1:2), xi(5:6), xi(1:2), y(2:3), k(1));
F14 = fuerza(xi(1:2), xi(7:8), xi(1:2), y(4:5), k(2));
F43 = fuerza(xi(7:8), xi(5:6), y(4:5), y(2:3), k(3));
F48 = fuerza(xi(7:8), xi(15:16), y(4:5), y(12:13), k(4));
F87 = fuerza(xi(15:16), xi(13:14), y(12:13), y(10:11), k(5));
F73 = fuerza(xi(13:14), xi(5:6), y(10:11), y(2:3), k(6));
F83 = fuerza(xi(15:16), xi(5:6), y(12:13), y(2:3), k(7));
F712 = fuerza(xi(13:14), xi(23:24), y(10:11), y(20:21), k(8));
F812 = fuerza(xi(15:16), xi(23:24), y(12:13), y(20:21), k(9));
F89 = fuerza(xi(15:16), xi(17:18), y(12:13), y(14:15), k(10));
F913 = fuerza(xi(17:18), xi(25:26), y(14:15), y(22:23), k(11));
F1213 = fuerza(xi(23:24), xi(25:26), y(20:21), y(22:23), k(12));
F129 = fuerza(xi(23:24), xi(17:18), y(20:21), y(14:15), k(13));
F26 = fuerza(xi(3:4), xi(11:12), [y(1),xi(4)], y(8:9), k(14));
F25 = fuerza(xi(3:4), xi(9:10), [y(1),xi(4)], y(6:7), k(15));
F56 = fuerza(xi(9:10), xi(11:12), y(6:7), y(8:9), k(16));
F510 = fuerza(xi(9:10), xi(19:20), y(6:7), y(16:17), k(17));
F1011 = fuerza(xi(19:20), xi(21:22), y(16:17), y(18:19), k(18));
F116 = fuerza(xi(21:22), xi(11:12), y(18:19), y(8:9), k(19));
F106 = fuerza(xi(19:20), xi(11:12), y(16:17), y(8:9), k(20));
F1114 = fuerza(xi(21:22), xi(27:28), y(18:19), y(24:25), k(21));
F1014 = fuerza(xi(19:20), xi(27:28), y(16:17), y(24:25), k(22));
F109 = fuerza(xi(19:20), xi(17:18), y(16:17), y(14:15), k(23));
F1413 = fuerza(xi(27:28), xi(25:26), y(24:25), y(22:23), k(24));
F149 = fuerza(xi(27:28), xi(17:18), y(24:25), y(14:15), k(25));

% ---------------------------------------------
% -------------ARMADO DEL SISTEMA--------------
dy = zeros(length(y),1); % declaro mi sistema vacío

% Velocidades:
dy(1:25) = y(26:50);
% Posiciones:
%dy( = 1/m(1) * (F13 + F14); % es inmovil, no va en el sistema de ecuaciones.
dy(26) = 1/m(2) * (F25(1) + F26(1)); % solo se mueve en x.
dy(27:28) = 1/m(3) * (-F13 - F43 - F83 - F73);
dy(29:30) = 1/m(4) * (-F14 + F43 + F48);
dy(31:32) = 1/m(5) * (-F25 + F56 + F510);
dy(33:34) = 1/m(6) * (-F26 - F56 - F116 - F106);
dy(35:36) = 1/m(7) * (F73 - F87 + F712);
dy(37:38) = 1/m(8) * (F83 - F48 + F87 + F89 + F812);
dy(39:40) = 1/m(9) * (-F89 - F129 + F913 - F149 - F109);
dy(41:42) = 1/m(10) * (-F510 + F106 + F109 + F1011 + F1014);
dy(43:44) = 1/m(11) * (F116 - F1011 + F1114);
dy(45:46) = 1/m(12) * (-F712 -F812 + F129 + F1213);
dy(47:48) = 1/m(13) * (-F913 - F1213 - F1413 + P);
dy(49:50) = 1/m(14) * (F149 - F1014 - F1114 + F1413);
