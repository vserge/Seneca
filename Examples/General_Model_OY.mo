within Seneca.Examples;

model General_Model_OY "Общая модель установки по очистке серы"
  import Modelica.Icon.Package;
  import Modelica.Fluid.Sources;
  replaceable package Medium=Seneca.Common.ACIDGas "Medium model" annotation(chaicesAllMatching=true);
  /*
                                                                                                                                                                                                                                                                                                                                                                                      Это комплексная модель установки, которая использует все наработки этой бибилиотеки
                                                                                                                                                                                                                                                                                                                                                                                      */
  Sources.MassFlowSource_T acidGas "Источник кислого газа" annotation(Placement(visible = true, transformation(origin = {-537, 161}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary airTube(nPorts = 1) "Труба" annotation(Placement(visible = true, transformation(origin = {803, 147}, extent = {{-57, -67}, {57, 67}}, rotation = 180)));
  Seneca.BlockModels.Block_FinalFurneces block_FinalFurneces1 annotation(Placement(visible = true, transformation(origin = {628, 138}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  Seneca.BlockModels.Block_Reactors block_Reactors1 annotation(Placement(visible = true, transformation(origin = {340, 12}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  Seneca.BlockModels.Block_Condensers block_Condensers1 annotation(Placement(visible = true, transformation(origin = {72, 154}, extent = {{-78, -78}, {78, 78}}, rotation = 0)));
  BlockModels.Block_Prep_ASIDGAS block_Prep_ASIDGAS1 annotation(Placement(visible = true, transformation(origin = {-374, 154}, extent = {{-78, -78}, {78, 78}}, rotation = 0)));
  BlockModels.Block_KlausFurneces block_KlausFurneces1 annotation(Placement(visible = true, transformation(origin = {-150, 154}, extent = {{-76, -76}, {76, 76}}, rotation = 0)));
  //Общие характеристики окружающей среды
  inner Common.System system annotation(Placement(visible = true, transformation(origin = {-550, 352}, extent = {{-38, -34}, {38, 34}}, rotation = 0)));
equation
  connect(block_Reactors1.ports_b, block_Condensers1.ports_a) annotation(Line(points = {{416, 20}, {478.875, 20}, {478.875, 50}, {479.75, 50}, {479.75, 328}, {178, 328}, {178, 329}, {-4, 329}, {-4, 162}}, color = {0, 0, 255}, thickness = 1.5, arrow = {Arrow.None, Arrow.Filled}));
  connect(block_Reactors1.ports_b, block_FinalFurneces1.port_a) annotation(Line(points = {{416, 20}, {525, 20}, {525, 132}, {493.5, 132}, {493.5, 146}, {552, 146}}, color = {0, 127, 255}));
  connect(block_Condensers1.ports_b, block_Reactors1.ports_a) annotation(Line(points = {{152, 162}, {196, 162}, {196, 54.875}, {264, 54.875}, {264, 20}}, color = {0, 0, 255}, pattern = LinePattern.Dash, thickness = 1.5, arrow = {Arrow.None, Arrow.Filled}));
  connect(block_Reactors1.sulfurPort_b1, block_Condensers1.sulfurPorts_a1[1]) annotation(Line(points = {{416, -41}, {150, -41}, {150, 86}, {70, 86}}, color = {255, 204, 102}, thickness = 1));
  connect(block_FinalFurneces1.port_b, airTube.ports[1]) annotation(Line(points = {{705, 146}, {724, 146}, {724, 147}, {746, 147}}, color = {0, 127, 255}));
  connect(block_KlausFurneces1.port_b, block_Condensers1.ports_a) annotation(Line(points = {{-74, 162}, {-4, 162}}, color = {0, 127, 255}));
  connect(block_Prep_ASIDGAS1.port_b, block_KlausFurneces1.port_a) annotation(Line(points = {{-294, 162}, {-226, 162}}, color = {0, 127, 255}));
  connect(acidGas.ports[1], block_Prep_ASIDGAS1.port_a) annotation(Line(points = {{-488, 161}, {-462, 161}, {-462, 162}, {-452, 162}}, color = {0, 127, 255}));
  annotation(Icon(coordinateSystem(extent = {{-600, -400}, {800, 400}})), Diagram(coordinateSystem(extent = {{-600, -400}, {800, 400}})), experiment(StartTime = 0, StopTime = 10, Interval = 2, Tolerance = 1e-6));
end General_Model_OY;