within Seneca.Condenser;
partial model Condenser_pipes
  //extends Pipe;
  extends Gas_Flow;
  Gas_Flow mf;
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Pressure P;
  Pipe in_condenser annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  Pipe out_condenser annotation(Placement(transformation(extent = {{50, 70}, {70, 50}}, rotation = 0)));
  Pipe sulfur annotation(Placement(transformation(extent = {{40, -60}, {60, -40}}, rotation = 0)));
equation

  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_pipes;