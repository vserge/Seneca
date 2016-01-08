within Seneca.Condenser;
partial model ABO_pipes
  //extends Pipe;
  Pipe out_ABO annotation(Placement(transformation(extent = {{70, 10}, {50, -10}}, rotation = 0)));
  Pipe in_ABO annotation(Placement(transformation(extent = {{-70, 10}, {-50, -10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end ABO_pipes;