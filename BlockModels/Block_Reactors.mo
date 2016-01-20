within Seneca.BlockModels;

model Block_Reactors
  Modelica.Fluid.Interfaces.FluidPorts_a ports_a annotation(Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b annotation(Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {0, 85}, extent = {{-98, 3}, {100, -3}}, textString = "Блок реакторов", fontSize = 40), Text(lineColor = {255, 0, 0}, extent = {{-98, 98}, {98, -98}}, textString = "Р", fontSize = 500), Rectangle(origin = {1, -1}, lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-101, 101}, {99, -99}}, radius = 2)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Reactors;