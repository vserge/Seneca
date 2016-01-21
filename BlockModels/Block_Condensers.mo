within Seneca.BlockModels;

model Block_Condensers
  Modelica.Fluid.Interfaces.FluidPorts_a ports_a annotation(Placement(visible = true, transformation(origin = {-98, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {-98, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b annotation(Placement(visible = true, transformation(origin = {100, 12}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {102, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {0, 89}, extent = {{-96, 1}, {96, -1}}, textString = "Блок осаждения и хранения серы", fontSize = 40), Rectangle(lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-100, 100}, {100, -100}}, radius = 3), Text(origin = {1, -7}, lineColor = {255, 0, 0}, extent = {{-87, 85}, {87, -85}}, textString = "B_CS", fontSize = 250)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Condensers;