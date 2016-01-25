within Seneca.Examples;

model General_Model_OY "Общая модель установки по очистке серы"
  import Modelica.Icon.Package;
  import Modelica.Fluid.Sources;
  /*
                                                                                                                                                                                                                                                                                                                                                                        Это комплексная модель установки, которая использует все наработки этой бибилиотеки
                                                                                                                                                                                                                                                                                                                                                                        */
  Sources.MassFlowSource_T acidGas "Источник кислого газа" annotation(Placement(visible = true, transformation(origin = {-537, 161}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Sources.FixedBoundary airTube(nPorts = 1) "Труба" annotation(Placement(visible = true, transformation(origin = {633, 169}, extent = {{-57, -67}, {57, 67}}, rotation = 180)));
  BlockModels.Block_FinalFurneces block_FinalFurneces1 annotation(Placement(visible = true, transformation(origin = {400, 158}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  BlockModels.Block_Reactors block_Reactors1 annotation(Placement(visible = true, transformation(origin = {462, -312}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  BlockModels.Block_Condensers block_Condensers1 annotation(Placement(visible = true, transformation(origin = {138, -132}, extent = {{-78, -78}, {78, 78}}, rotation = 0)));
  BlockModels.Block_Prep_ASIDGAS block_Prep_ASIDGAS1 annotation(Placement(visible = true, transformation(origin = {-374, 154}, extent = {{-78, -78}, {78, 78}}, rotation = 0)));
  BlockModels.Block_KlausFurneces block_KlausFurneces1 annotation(Placement(visible = true, transformation(origin = {-150, 154}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  //Общие характеристики окружающей среды
  inner Common.System system annotation(Placement(visible = true, transformation(origin = {-550, 352}, extent = {{-38, -34}, {38, 34}}, rotation = 0)));
equation
  connect(block_KlausFurneces1.port_b, block_Condensers1.ports_a) annotation(Line(points = {{-74, 162}, {58, 162}, {58, -100}, {58, -100}}, color = {0, 127, 255}));
  connect(block_Prep_ASIDGAS1.port_b, block_KlausFurneces1.port_a) annotation(Line(points = {{-294, 162}, {-226, 162}}, color = {0, 127, 255}));
  connect(acidGas.ports[1], block_Prep_ASIDGAS1.port_a) annotation(Line(points = {{-488, 161}, {-462, 161}, {-462, 162}, {-452, 162}}, color = {0, 127, 255}));
  connect(block_Condensers1.ports_b, block_Reactors1.ports_a) annotation(Line(points = {{218, -124}, {408, -124}, {408, 125.75}, {386, 125.75}, {386, -304}}, color = {0, 0, 255}, pattern = LinePattern.Dash, thickness = 1.5, arrow = {Arrow.None, Arrow.Filled}));
  connect(block_Reactors1.ports_b, block_Condensers1.ports_a) annotation(Line(points = {{538, -304}, {269.75, -304}, {269.75, 164}, {269.5, 164}, {269.5, 196}, {321, 196}, {321, -20}, {324, -20}, {324, -21}, {62, -21}, {62, -124}}, color = {0, 0, 255}, thickness = 1.5, arrow = {Arrow.None, Arrow.Filled}));
  connect(block_Reactors1.ports_b, block_FinalFurneces1.port_a) annotation(Line(points = {{538, -304}, {287, -304}, {287, 166}, {324, 166}}, color = {0, 127, 255}));
  connect(block_FinalFurneces1.port_b, airTube.ports[1]) annotation(Line(points = {{477, 166}, {578, 166}, {578, 184}, {572, 184}}, color = {0, 127, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-600, -400}, {700, 400}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 10, Interval = 2, Tolerance = 1e-6));
end General_Model_OY;