# En este script, se resuelve el sistema con la ode y se obtiene el gif con
# los resultados del ejercicio.

# DATOS DE TIEMPO:
tini = 0;
tfin = 50;
t=tini:tfin;

# CONDICIONES INICIALES:
# Posición:
# Para el nodo 1, el soporte es inmovil. Mantengo condiciones iniciales.
# Para el nodo 2, el soporte es móvil en x. Mantengo condición inicial en y.
# xi_0 = [x2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8,x9,y9,x10,y10,x11,y11,x12,y12,x13,y13,x14,y14];
xi_0 = [40 0 10 10 10 30 10 40 10 0 20 10 20 20 20 30 20 40 20 10 40 20 40 30 40];
# Velocidad:
vi_0 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
# Vector completo:
y = [xi_0, vi_0];

# RESOLUCIÓN DEL SISTEMA DE ECUACIONES:
[t,y] = ode23(@f,t,y);

#------------------------------------------------------------
# BARRA 13:
for i = 1:tfin+1
  # FALTA CAMBIAR VALORES EN Y(I,??):
   F = fuerza(xi_0(20:21),xi_0(14:15),y(i,10:11),y(i,16:17),2);
   F129_x(i)=F(1);
   F129_y(i)=F(2);
endfor

figure(1)
hold on
grid on
title('Barra 13 Fuerza')
xlabel('Tiempo')
ylabel('Fuerza')
# Grafico fuerza en X para la barra:
subplot(2,1,1)
plot(t,F129_x)
# Grafico fuerza en Y para la barra:
subplot(2,1,2)
plot(t,F129_y)

# NODO 13:
figure(2)
hold on
grid on
title('Posicion X Nodo 6')
xlabel('Tiempo');
ylabel('Posición');
# Grafico posición en X para el nodo:
subplot(2,1,1)
plot(t,y(1:tfin+1, 22));
# Grafico posición en Y para el nodo:
subplot(2,1,2)
plot(t,y(1:tfin+1, 23));

