#--------------------------------------------
#-------------------DATOS--------------------
#--------------------------------------------

P = 1.0; # carga uniforme
a = 13; # barra a analizar
b = 13; # nodo a analizar
t_f = 50.0; # tiempo final

#--------------------------------------------
#-----MATRIZ DE DEFINICIÓN DE LOS NODOS------
nodos = zeros(14,3);
# i: número de nodo
# n = 1: posición en x
# n = 2: posición en y
# n = 3: masa

# POSICIÓN EN X DE LOS NODOS:
nodos(1,1) = 0.0;
nodos(2,1) = 40.0;
nodos(3,1) = 0.0;
nodos(4,1) = 10.0;
nodos(5,1) = 30.0;
nodos(6,1) = 40.0;
nodos(7,1) = 0.0;
nodos(8,1) = 10.0;
nodos(9,1) = 20.0;
nodos(10,1) = 30.0;
nodos(11,1) = 40.0;
nodos(12,1) = 10.0;
nodos(13,1) = 20.0;
nodos(14,1) = 30.0;

# POSICIÓN EN Y DE LOS NODOS:
nodos(1,2) = 0.0;
nodos(2,2) = 0.0;
nodos(3,2) = 10.0;
nodos(4,2) = 10.0;
nodos(5,2) = 10.0;
nodos(6,2) = 10.0;
nodos(7,2) = 20.0;
nodos(8,2) = 20.0;
nodos(9,2) = 20.0;
nodos(10,2) = 20.0;
nodos(11,2) = 20.0;
nodos(12,2) = 30.0;
nodos(13,2) = 30.0;
nodos(14,2) = 30.0;

# MASAS DE LOS NODOS:
nodos(1,3) = 1;
nodos(2,3) = 1;
nodos(3,3) = 1;
nodos(4,3) = 1;
nodos(5,3) = 1;
nodos(6,3) = 1;
nodos(7,3) = 1;
nodos(8,3) = 2;
nodos(9,3) = 1;
nodos(10,3) = 2;
nodos(11,3) = 1;
nodos(12,3) = 2;
nodos(13,3) = 2;
nodos(14,3) = 2;

#--------------------------------------------
#-----MATRIZ DE DEFINICIÓN DE LAS BARRAS-----
barras = zeros(18,3);
# barras(i,n)
# i: número de barra
# n = 1: primer nodo
# n = 2: segundo nodo
# n = 3: rigidez

# PRIMER NODO DE LAS BARRAS:
barras(1,1) = 1;
barras(2,1) = 1;
barras(3,1) = 4;
barras(4,1) = 4;
barras(5,1) = 8;
barras(6,1) = 7;
barras(7,1) = 8;
barras(8,1) = 7;
barras(9,1) = 8;
barras(10,1) = 8;
barras(11,1) = 9;
barras(12,1) = 12;
barras(13,1) = 12;
barras(14,1) = 2;
barras(15,1) = 2;
barras(16,1) = 5;
barras(17,1) = 5;
barras(18,1) = 10;

# SEGUNDO NODO DE LAS BARRAS:
barras(1,2) = 3;
barras(2,2) = 4;
barras(3,2) = 3;
barras(4,2) = 8;
barras(5,2) = 7;
barras(6,2) = 3;
barras(7,2) = 3;
barras(8,2) = 12;
barras(9,2) = 12;
barras(10,2) = 9;
barras(11,2) = 13;
barras(12,2) = 13;
barras(13,2) = 9;
barras(14,2) = 6;
barras(15,2) = 5;
barras(16,2) = 6;
barras(17,2) = 10;
barras(18,2) = 11;

# RIGIDEZ DE LAS BARRAS:
barras(1,3) = 2;
barras(2,3) = 2;
barras(3,3) = 2;
barras(4,3) = 2;
barras(5,3) = 4;
barras(6,3) = 2;
barras(7,3) = 2;
barras(8,3) = 2;
barras(9,3) = 2;
barras(10,3) = 4;
barras(11,3) = 2;
barras(12,3) = 4;
barras(13,3) = 2;
barras(14,3) = 2;
barras(15,3) = 2;
barras(16,3) = 2;
barras(17,3) = 2;
barras(18,3) = 4;

#--------------------------------------------
#------------------FUERZAS-------------------
#--------------------------------------------

fuerzas = zeros(14,14);
# primer argumento es el nodo, segundo tengo 14 por los nodos, 1 por la P y otro por mv?
for i = 1:length(barras);
  nodo1 = barras(i,1);
  nodo2 = barras(i,2);

  k = barras(i,3);


  f = k*1-

  fuerzas(nodo1,nodo2) = f;
  fuerzas(nodo2,nodo1) = -f;
endfor
