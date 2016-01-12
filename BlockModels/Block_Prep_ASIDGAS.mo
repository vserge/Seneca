within Seneca.BlockModels;

model Block_Prep_ASIDGAS
  Common.System system annotation(Placement(visible = true, transformation(origin = {-178, 178}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary annotation(Placement(visible = true, transformation(origin = {-174, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume Vassel_L2_C501_0 "Брызгоулавитель" annotation(Placement(visible = true, transformation(origin = {-74, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe basePipe1 annotation(Placement(visible = true, transformation(origin = {-24, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe pipe annotation(Placement(visible = true, transformation(origin = {22, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe basePipe1 annotation(Placement(visible = true, transformation(origin = {-34, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe basePipe2 annotation(Placement(visible = true, transformation(origin = {78, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature annotation(Placement(visible = true, transformation(origin = {110, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealVectorInput u annotation(Placement(visible = true, transformation(origin = {210, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {210, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(Placement(visible = true, transformation(origin = {116, 146}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe basePipe3 annotation(Placement(visible = true, transformation(origin = {150, 116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(temperature.port_b, basePipe3.port_a) annotation(Line(points = {{120, 114}, {126, 114}, {126, 116}, {140, 116}}, color = {0, 127, 255}));
  connect(temperature.T, realValue1.numberPort) annotation(Line(points = {{110, 125}, {104, 125}, {104, 146}, {104, 146}}, color = {0, 0, 127}));
  connect(basePipe2.port_b, temperature.port_a) annotation(Line(points = {{88, 114}, {102, 114}, {102, 114}, {100, 114}, {100, 114}}, color = {0, 127, 255}));
  connect(pipe.port_b, basePipe2.port_a) annotation(Line(points = {{32, 114}, {68, 114}, {68, 114}, {68, 114}}, color = {0, 127, 255}));
  connect(basePipe1.port_b, pipe.port_a) annotation(Line(points = {{-24, 114}, {14, 114}, {14, 114}, {12, 114}, {12, 114}}, color = {0, 127, 255}));
  connect(Vassel_L2_C501_0.ports[3], basePipe1.port_a) annotation(Line(points = {{-74, 104}, {-44, 104}, {-44, 114}}, color = {0, 127, 255}));
  connect(basePipe1.port_b, Vassel_L2_C501_0.ports[1]) annotation(Line(points = {{-118, 114}, {-78, 114}, {-78, 104}, {-78, 104}}, color = {0, 127, 255}));
  connect(boundary.ports[5], basePipe1.port_a) annotation(Line(points = {{-164, 112}, {-150, 112}, {-150, 114}, {-138, 114}}, color = {0, 127, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Prep_ASIDGAS;