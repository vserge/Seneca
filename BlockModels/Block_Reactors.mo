within Seneca.BlockModels;

model Block_Reactors
  Pipes.BasePipe basePipe1 annotation(Placement(visible = true, transformation(origin = {-471, 257}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Block_GasHeater block_GasHeater2 annotation(Placement(visible = true, transformation(origin = {-314, 248}, extent = {{-61, -61}, {61, 61}}, rotation = 0)));
  Pipes.BasePipe basePipe3 annotation(Placement(visible = true, transformation(origin = {-172, 254}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Reactor.BaseReactor baseReactor1 annotation(Placement(visible = true, transformation(origin = {199, 211}, extent = {{-105, -105}, {105, 105}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b annotation(Placement(visible = true, transformation(origin = {598, 6}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPorts_a ports_a annotation(Placement(visible = true, transformation(origin = {-596, 0}, extent = {{-10, -40}, {10, 40}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -40}, {10, 40}}, rotation = 0)));
  Valve.valves_4ways valves_4ways2 annotation(Placement(visible = true, transformation(origin = {387, 3}, extent = {{-73, -73}, {73, 73}}, rotation = 0)));
  Pipes.BasePipe basePipe2 annotation(Placement(visible = true, transformation(origin = {-514, -234}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Block_GasHeater block_GasHeater1 annotation(Placement(visible = true, transformation(origin = {-369, -239}, extent = {{-61, -61}, {61, 61}}, rotation = 0)));
  Pipes.BasePipe basePipe4 annotation(Placement(visible = true, transformation(origin = {-236, -228}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Valve.valves_4ways valves_4ways1 annotation(Placement(visible = true, transformation(origin = {-44, 40}, extent = {{-68, -68}, {68, 68}}, rotation = 0)));
  Reactor.BaseReactor baseReactor2 annotation(Placement(visible = true, transformation(origin = {176, -168}, extent = {{-105, -105}, {105, 105}}, rotation = 0)));
equation
  connect(valves_4ways1.port_b1, baseReactor2.port_a) annotation(Line(points = {{-44, -29}, {176, -29}, {176, -63}}, color = {0, 127, 255}));
  connect(basePipe4.port_b, valves_4ways1.port_a) annotation(Line(points = {{-187, -228}, {-112, -228}, {-112, 40}}, color = {0, 127, 255}));
  connect(valves_4ways1.port_b, baseReactor1.port_a) annotation(Line(points = {{24, 40}, {61.5, 40}, {61.5, 316}, {61, 316}, {61, 372}, {199, 372}, {199, 316}}, color = {0, 127, 255}));
  connect(basePipe3.port_b, valves_4ways1.port_a1) annotation(Line(points = {{-123, 254}, {-44, 254}, {-44, 107}}, color = {0, 127, 255}));
  connect(block_GasHeater1.port_b, basePipe4.port_a) annotation(Line(points = {{-308, -233}, {-285, -233}, {-285, -228}}, color = {0, 127, 255}));
  connect(basePipe2.port_b, block_GasHeater1.port_a) annotation(Line(points = {{-465, -234}, {-430, -234}, {-430, -233}}, color = {0, 127, 255}));
  connect(basePipe2.port_a, ports_a) annotation(Line(points = {{-563, -234}, {-596, -234}, {-596, 0}}, color = {0, 127, 255}));
  connect(basePipe1.port_a, ports_a) annotation(Line(points = {{-520, 257}, {-520, 138.5}, {-522, 138.5}, {-522, 140}, {-596, 140}, {-596, 0}}, color = {0, 0, 255}, thickness = 1));
  connect(block_GasHeater2.port_b, basePipe3.port_a) annotation(Line(points = {{-253, 254}, {-221, 254}}, color = {0, 127, 255}));
  connect(basePipe1.port_b, block_GasHeater2.port_a) annotation(Line(points = {{-422, 257}, {-375, 257}, {-375, 254}}, color = {0, 127, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {0, 85}, extent = {{-98, 3}, {100, -3}}, textString = "Блок реакторов", fontSize = 40), Text(lineColor = {255, 0, 0}, extent = {{-98, 98}, {98, -98}}, textString = "Р", fontSize = 500), Rectangle(origin = {1, -1}, lineThickness = 3, borderPattern = BorderPattern.Engraved, extent = {{-101, 101}, {99, -99}}, radius = 2)}), Diagram(coordinateSystem(extent = {{-600, -400}, {600, 400}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Reactors;