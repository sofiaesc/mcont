# FUNCIÓN PARA LA DEFINICIÓN DE LAS FUERZAS
function F = fuerza(xi0, xj0, xi, xj, k)
Ftot = k * (1 - sqrt((xj0(1) - xi0(1))^2 + (xj0(2) - xi0(2))^2)/sqrt((xj(1) - xi(1))^2 + (xj(2) - xi(2))^2));

F(1) = Ftot * (xj(1) - xi(2)); # fuerza en x
F(2) = Ftot * (xj(2) - xi(2)); # fuerza en y
