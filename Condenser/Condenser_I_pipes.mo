within Seneca.Condenser;

partial model Condenser_I_pipes
  //extends Pipe;
  extends Gas_Flow;
  Gas_Flow mf;
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Pressure P;
  Pipe in_condenser_I annotation(Placement(transformation(extent = {{-40, 10}, {-20, -10}}, rotation = 0)));
  Pipe out_condenser_I annotation(Placement(transformation(extent = {{40, 10}, {20, -10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_I_pipes;