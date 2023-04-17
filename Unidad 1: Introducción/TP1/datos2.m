# La función recibe el tiempo y la posición actual de los nodos.
function dy = f(t,y)

P = [0,1] # carga uniforme va en +y
a = 13; # barra a analizar
b = 13; # nodo a analizar
t_f = 50.0; # tiempo final

# CONDICIONES INICIALES:
# xi = [x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9,x10,y10,x11,y11,x12,y12,x13,y13,x14,y14];
xi = [];

# CONSTANTES RESORTES:
k = [2 2 2 2 4 2 2 2 2 4 2 4 2 2 2 2 2 4];

# MASAS:
m = [0 40 0 10 30 40 0 10 20 30 40 10 20 30];

# CÁLCULO DE FUERZAS:
# Calculo una vez cada par y aplico Fij = -Fij
# Para el nodo 1, el soporte es inmovil. Mantengo condiciones indiciales.
# Para el nodo 2, el soporte es móvil en x. Mantengo condición indicial en y.
# y = [x2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9,x10,y10,x11,y11,x12,y12,x13,y13,x14,y14];
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
