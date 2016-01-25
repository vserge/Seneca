within Seneca.BlockModels;

model Block_Condensers
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b[3] annotation(Placement(visible = true, transformation(origin = {100, 12}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {102, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundary_Sulfur(nPorts = 4) annotation(Placement(visible = true, transformation(origin = {2, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Common.SulfurPorts_a sulfurPorts_a1[3] annotation(Placement(visible = true, transformation(origin = {-102, -50}, extent = {{-22, -22}, {22, 22}}, rotation = 0), iconTransformation(origin = {-3, -87}, extent = {{-31, -31}, {31, 31}}, rotation = 90)));
  Condenser.BaseCondenser baseCondenser1 annotation(Placement(visible = true, transformation(origin = {-25, 77}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Condenser.BaseCondenser baseCondenser2 annotation(Placement(visible = true, transformation(origin = {-31, -15}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPorts_a ports_a[3] annotation(Placement(visible = true, transformation(origin = {-98, 12}, extent = {{-10, -26}, {10, 26}}, rotation = 0), iconTransformation(origin = {-98, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
equation
  connect(sulfurPorts_a1[2], boundary_Sulfur.ports[4]) annotation(Line(points = {{-102, -50}, {0, -50}, {0, -80}, {0, -80}}));
  connect(sulfurPorts_a1[1], boundary_Sulfur.ports[1]) annotation(Line(points = {{-102, -50}, {0, -50}, {0, -80}, {0, -80}}));
  connect(ports_a[2], baseCondenser2.port_a) annotation(Line(points = {{-108, 13}, {-56, 13}, {-56, -16}, {-56, -16}}));
  connect(baseCondenser2.port_b, ports_b) annotation(Line(points = {{-6, -15}, {100, -15}, {100, -2}, {102, -2}, {102, -2}}, color = {0, 127, 255}));
  connect(ports_a[1], baseCondenser1.port_a) annotation(Line(points = {{-108, 13}, {-50, 13}, {-50, 77}}));
  connect(ports_a[2], baseCondenser1.port_a) annotation(Line(points = {{-108, 13}, {-50, 13}, {-50, 77}}));
  connect(baseCondenser2.sulfurPort_b1, boundary_Sulfur.ports[1]) annotation(Line(points = {{-8, -33}, {2, -33}, {2, -80}}));
  connect(baseCondenser1.sulfurPort_b1, boundary_Sulfur.ports[2]) annotation(Line(points = {{-2, 59}, {-2, -10.5}, {2, -10.5}, {2, -80}}));
  connect(baseCondenser1.port_b, ports_b) annotation(Line(points = {{0, 77}, {100, 77}, {100, 12}}, color = {0, 127, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {0, 89}, extent = {{-96, 1}, {96, -1}}, textString = "Блок осаждения и хранения серы", fontSize = 40), Rectangle(lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-100, 100}, {100, -100}}, radius = 3), Text(origin = {1, -7}, lineColor = {255, 0, 0}, extent = {{-87, 85}, {87, -85}}, textString = "B_CS", fontSize = 250)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Condensers;