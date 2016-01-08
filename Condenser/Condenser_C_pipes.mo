within Seneca.Condenser;

partial model Condenser_C_pipes
  //extends Pipe;
  extends Gas_Flow;
  Gas_Flow mf;
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Pressure P;
  Pipe in_condenser_III annotation(Placement(transformation(extent = {{-80, 10}, {-60, -10}}, rotation = 0)));
  Pipe out_vapor annotation(Placement(transformation(extent = {{20, 90}, {40, 70}}, rotation = 0)));
  Pipe out_sulfur annotation(Placement(transformation(extent = {{20, -90}, {40, -70}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_C_pipes;