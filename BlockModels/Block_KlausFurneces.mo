within Seneca.BlockModels;

model Block_KlausFurneces
  Modelica.Fluid.Interfaces.FluidPort_a port_a annotation(Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_b annotation(Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoSysPro.Combustion.CombustionChambers.GTCombustionChamber gTCombustionChamber1 annotation(Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gTCombustionChamber1.Cfg, port_b) annotation(Line(points = {{0, 8}, {98, 8}, {98, 10}, {100, 10}}));
  connect(port_a, gTCombustionChamber1.Cws) annotation(Line(points = {{-100, 10}, {-48, 10}, {-48, 20}, {-16, 20}, {-16, 17}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {0, 90}, extent = {{-100, 0}, {100, -2}}, textString = "Блок печь Клауса", fontSize = 40), Text(origin = {1, -11}, lineColor = {255, 0, 0}, extent = {{-77, 69}, {77, -69}}, textString = "К", fontSize = 500), Rectangle(lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-100, 98}, {100, -98}}, radius = 2)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_KlausFurneces;