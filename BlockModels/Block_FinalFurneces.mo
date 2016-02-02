within Seneca.BlockModels;

model Block_FinalFurneces
  Modelica.Fluid.Interfaces.FluidPort_a port_a annotation(Placement(visible = true, transformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_b annotation(Placement(visible = true, transformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {101, 10}, extent = {{-9, -10}, {9, 10}}, rotation = 0)));
  ThermoSysPro.Combustion.CombustionChambers.GenericCombustion genericCombustion1 annotation(Placement(visible = true, transformation(origin = {-24, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ fuelSourcePQ1 annotation(Placement(visible = true, transformation(origin = {-74, -46}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundary(nPorts = 1)  annotation(Placement(visible = true, transformation(origin = {-82, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary.ports[1], genericCombustion1.Cfg) annotation(Line(points = {{-72, 74}, {-28, 74}, {-28, 22}, {-28, 22}}, color = {0, 127, 255}));
  connect(fuelSourcePQ1.C, genericCombustion1.Ca) annotation(Line(points = {{-52, -46}, {-26, -46}, {-26, 2}, {-28, 2}}));
  connect(genericCombustion1.Cfuel, port_b) annotation(Line(points = {{-20, 2}, {98, 2}, {98, 10}, {100, 10}}));
  connect(port_a, genericCombustion1.Cws) annotation(Line(points = {{-100, 10}, {-36, 10}, {-36, 14}, {-34, 14}, {-34, 14}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {3, 89}, extent = {{-101, 1}, {93, -1}}, textString = "Блок дожига", fontSize = 40), Rectangle(origin = {-6, 2}, lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-94, 98}, {106, -102}}, radius = 3), Text(origin = {-1, -7}, lineColor = {255, 0, 0}, extent = {{-95, 87}, {95, -87}}, textString = "B_FF", fontSize = 250)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_FinalFurneces;