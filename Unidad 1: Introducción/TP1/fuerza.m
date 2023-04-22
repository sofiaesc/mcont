% FUNCIÓN PARA LA DEFINICIÓN DE LAS FUERZAS
function F = fuerza(xi_0, xj_0, xi, xj, k)
  % INCISOS A Y B:
   Ftot = k * (1 - sqrt((xj_0(1) - xi_0(1))^2 + (xj_0(2) - xi_0(2))^2)/sqrt((xj(1) - xi(1))^2 + (xj(2) - xi(2))^2));
   F(1) = Ftot * (xj(1) - xi(1)); % fuerza en x
   F(2) = Ftot * (xj(2) - xi(2)); % fuerza en y

  % INCISO C:
  % Ftot = k * (sqrt((xj(1) - xi(1))^2 + (xj(2) - xi(2))^2)/sqrt((xj_0(1) - xi_0(1))^2 + (xj_0(2) - xi_0(2))^2) - 1);
  % F(1) = Ftot * (xj_0(1) - xi_0(1)); % fuerza en x
  % F(2) = Ftot * (xj_0(2) - xi_0(2)); % fuerza en y

