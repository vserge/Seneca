within Seneca.Condenser;
model Condenser_I
  extends Condenser_A_pipes;
  extends Condenser_A;
  extends Gas_Flow;
  Gas_Flow F;
  Real T0;
  Real P0;
  Real v0;
equation
  F = in_condenser_I.mf;
  T0 = in_condenser_I.T;
  P0 = in_condenser_I.P;
  v0 = in_condenser_I.v;
  out_condenser_I.mf = F;
  out_condenser_I.T = T0;
  out_condenser_I.P = P0;
  out_condenser_I.v = v0;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_I;