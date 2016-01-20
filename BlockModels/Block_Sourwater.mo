within Seneca.BlockModels;

model Block_Sourwater
  Modelica.Fluid.Interfaces.FluidPort_a port_a annotation(Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_b annotation(Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-100, 100}, {100, -100}}, radius = 2), Text(origin = {-2, 1}, extent = {{-94, 93}, {94, -93}}, textString = "B_SW", fontSize = 250)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-79, 85}, extent = {{177, 3}, {-19, 3}}, textString = "Блок кислой воды", fontSize = 40)}));
end Block_Sourwater;