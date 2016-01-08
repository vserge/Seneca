within Seneca.Condenser;

partial model BFW_Pipes
  Gas_Flow mf;
  Modelica.SIunits.Temperature T;
  Modelica.SIunits.Pressure P;
  Pipe out_BFW annotation(Placement(transformation(extent = {{-20, 40}, {-40, 60}}, rotation = 0)));
  Pipe in_BFW annotation(Placement(transformation(extent = {{-20, -40}, {-40, -60}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end BFW_Pipes;