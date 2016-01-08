within Seneca.Condenser;
partial model Sulfur_Seal_pipes
  //extends Pipe;
  Pipe in_seal annotation(Placement(transformation(extent = {{-10, 90}, {10, 70}}, rotation = 0)));
  Pipe out_seal annotation(Placement(transformation(extent = {{-10, -90}, {10, -70}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Sulfur_Seal_pipes;