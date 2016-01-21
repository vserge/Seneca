within Seneca.BlockModels;

model Block_Prep_ASIDGAS
  import Modelica.Fluid.Interfaces;
  //Общие данные
  Interfaces.FluidPort_a port_a annotation(Placement(visible = true, transformation(origin = {-584, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.FluidPort_b port_b annotation(Placement(visible = true, transformation(origin = {586, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Common.System system annotation(Placement(visible = true, transformation(origin = {-541, 332}, extent = {{-49, -38}, {49, 38}}, rotation = 0)));
  //Датчики
  // Трубопроводы
  // Трубопровод от ввода в установку и до брызгоуловителя
  //Нагреватель кислого газа используем объем с нагревателем
  //Блок сбора кислой воды
  Pipes.BasePipe pipe_L2_SAG_C501_0 annotation(Placement(visible = true, transformation(origin = {-527, 43}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vassel_L2_T501_0(V = 5.76, nPorts = 3, use_portsData = true, use_Re = false) "Брызгоуловитель" annotation(Placement(visible = true, transformation(origin = {-338, 34}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
  //Разделитель жидкости и газа (брызгоуловитель)
  /*
                                                            Здесь должен быть датчик уровня жидкости нужно его вытащить из модели model PartialLumpedVessel
                                                          */
  Modelica.Fluid.Valves.ValveLinear valveLinear1 annotation(Placement(visible = true, transformation(origin = {-495, -231}, extent = {{-31, -31}, {31, 31}}, rotation = -90)));
  Pipes.BasePipe pipe_L2_C501_T501_0 annotation(Placement(visible = true, transformation(origin = {-155, -39}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_C501_BSW_0 annotation(Placement(visible = true, transformation(origin = {-498, -122}, extent = {{-36, -36}, {36, 36}}, rotation = -90)));
  Pipes.BasePipe pipe_L2_T501_TC_0 annotation(Placement(visible = true, transformation(origin = {280, -38}, extent = {{-54, -54}, {54, 54}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort TC_0(allowFlowReversal = false) "Датчик температуры Кислого газа после нагревателя" annotation(Placement(visible = true, transformation(origin = {466, -27}, extent = {{-50, -55}, {50, 55}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe Gas_Heater(use_HeatTransfer = true, roughness = 66, allowFlowReversal = false, length = 1, diameter = 1) "Нагреватель кислого газа от пара среднего давления" annotation(Placement(visible = true, transformation(origin = {68, -38}, extent = {{-84, -84}, {84, 84}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_MPS(T_ref = 468) "Поток пара среднего давления с регулировкой" annotation(Placement(visible = true, transformation(origin = {-12, 200}, extent = {{-58, -58}, {58, 58}}, rotation = 0)));
  // Здесь Блок кислой воды
  Modelica.Fluid.Vessels.ClosedVolume vassel_L2_T511_0(nPorts = 1, use_Re = false, use_HeatTransfer = false) "Бак кислой воды" annotation(Placement(visible = true, transformation(origin = {-326, -276}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
equation
  // Соединение от границы блока (ввод в установку) до трубопровода к брызгоулавителю
  connect(port_a, pipe_L2_SAG_C501_0.port_a) annotation(Line(points = {{-584, 42}, {-583.5, 42}, {-583.5, 42}, {-571, 42}, {-571, 43}, {-578.5, 43}, {-578.5, 43}, {-558, 43}}));
  // Соединение от трубопровода до брызгоуловителя
  connect(pipe_L2_SAG_C501_0.port_b, vassel_L2_T501_0.ports[1]) annotation(Line(points = {{-496, 43}, {-362, 43}, {-362, -38}, {-362, -38}}, color = {0, 127, 255}));
  // Соединение от брызгоуловителя к блоку кислой воды
  connect(vassel_L2_T501_0.ports[2], pipe_L2_C501_BSW_0.port_a) annotation(Line(points = {{-338, -38}, {-498, -38}, {-498, -86}}, color = {0, 127, 255}));
  // Соединение от брызгоуловителя до нагревателя
  connect(vassel_L2_T501_0.ports[3], pipe_L2_C501_T501_0.port_a) annotation(Line(points = {{-338, -38}, {-204, -38}, {-204, -39}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow_MPS.port, Gas_Heater.heatPorts[1]) annotation(Line(points = {{46, 200}, {69, 200}, {69, -1}}, color = {191, 0, 0}));
  connect(pipe_L2_C501_T501_0.port_b, Gas_Heater.port_a) annotation(Line(points = {{-106, -39}, {-19, -39}, {-19, -38}, {-16, -38}}, color = {0, 127, 255}));
  connect(Gas_Heater.port_b, pipe_L2_T501_TC_0.port_a) annotation(Line(points = {{152, -38}, {226, -38}}, color = {0, 127, 255}));
  connect(pipe_L2_T501_TC_0.port_b, TC_0.port_a) annotation(Line(points = {{334, -38}, {334, -27}, {416, -27}}, color = {0, 127, 255}));
  connect(pipe_L2_C501_BSW_0.port_b, valveLinear1.port_a) annotation(Line(points = {{-498, -158}, {-495, -158}, {-495, -200}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, vassel_L2_T501_0.ports[1]) annotation(Line(points = {{-495, -262}, {-494, -262}, {-494, -366}}, color = {0, 127, 255}));
  // Соединение от датчика температуры к границе блока
  connect(TC_0.port_b, port_b) annotation(Line(points = {{586, 46}, {516, 46}, {516, -27}}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-92, 91}, extent = {{190, 1}, {-8, -1}}, textString = "Блок подготовки кислого газа", fontSize = 40), Rectangle(lineThickness = 2, borderPattern = BorderPattern.Engraved, extent = {{-100, 98}, {100, -98}}, radius = 2), Text(origin = {-8, -3}, lineColor = {255, 0, 0}, extent = {{-70, 79}, {96, -77}}, textString = "B_PAG", fontSize = 200)}), Diagram(coordinateSystem(extent = {{-600, -400}, {600, 400}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Prep_ASIDGAS;