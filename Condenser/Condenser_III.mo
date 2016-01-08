within Seneca.Condenser;
model Condenser_III
  extends Condenser_C_pipes;
  extends Condenser_C;
  extends Gas_Flow;
  Integer n = 610;
  Integer k = 130;
  Gas_Flow F = in_condenser_III.mf;
  Real j[n, k, 10] = in_condenser_III.J;
  Real T0 = in_condenser_III.T;
  Real P0 = in_condenser_III.P;
  Real q[i, j];
  Real u;
  Real Q;
  Real M;
  constant Real plq = 1791.3;
  constant Real pv = 0.862;
  constant Real uv = 8.163 / 10000;
  parameter Real l = 1.9;
  parameter Real h = 1.45;
  parameter Real w = 1;
  constant Real g = 9.81;
  parameter Integer n = 10;
  Real jf;
equation
  Q = 0;
  jf = 0;
  for i in 1:n loop
    for j in 1:k loop
      q[i, j] = j[i, j, 10] * r;
      jf = jf + j[i, j, 10];
    end for;
  end for;
  u = g * (plq - pv) / 4 / uv * d ^ 2;
  w * h * jf - l * d * plq * u = h * l * plq * der(d);
  der(M) = l * n * d * plq * d;
  out_vapor.mf = F;
  out_sulfur = M;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_III;