within Seneca.BlockModels;

model Block_Prep_ASIDGAS
  Common.System system annotation(Placement(visible = true, transformation(origin = {-178, 178}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //Разделитель жидкости и газа (брызгоуловитель)
  /*
           Здесь должен быть датчик уровня жидкости нужно его вытащить из модели model PartialLumpedVessel
          */
  //Датчики
  Modelica.Fluid.Sources.MassFlowSource_T boundary annotation(Placement(visible = true, transformation(origin = {-173, 113}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  // Трубопроводы
  // Трубопровод от ввода в установку и до брызгоуловителя
  //Нагреватель кислого газа используем объем с нагревателем
  //Блок сбора кислой воды
  Modelica.Fluid.Vessels.ClosedVolume vassel_L2_T511_0 "Бак кислой воды" annotation(Placement(visible = true, transformation(origin = {-82, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_SAG_C501_0 annotation(Placement(visible = true, transformation(origin = {-136, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_C501_BSW_0 annotation(Placement(visible = true, transformation(origin = {-82, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume vassel_L2_T511_0 "Бак кислой воды" annotation(Placement(visible = true, transformation(origin = {-84, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_C501_T501_0 annotation(Placement(visible = true, transformation(origin = {-36, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1 annotation(Placement(visible = true, transformation(origin = {-82, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1 annotation(Placement(visible = true, transformation(origin = {180, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_T501_TC_0 annotation(Placement(visible = true, transformation(origin = {32, 112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort TC_0(allowFlowReversal = false) "Датчик температуры Кислого газа после нагревателя" annotation(Placement(visible = true, transformation(origin = {66, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_MPS "Поток пара среднего давления с регулировкой" annotation(Placement(visible = true, transformation(origin = {-4, 158}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_T501_BMFT_0 annotation(Placement(visible = true, transformation(origin = {96, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort temperature annotation(Placement(visible = true, transformation(origin = {180, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2 annotation(Placement(visible = true, transformation(origin = {124, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 360)));
  Pipes.BasePipe pipe_L2_BMFT_TC_0 annotation(Placement(visible = true, transformation(origin = {154, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe Gas_Heater(use_HeatTransfer = true, roughness = 66, allowFlowReversal = false, length = 1, diameter = 1) "Нагреватель кислого газа от пара среднего давления" annotation(Placement(visible = true, transformation(origin = {-4, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Gas_Heater.port_b, pipe_L2_T501_TC_0.port_a) annotation(Line(points = {{6, 80}, {22, 80}, {22, 112}, {22, 112}}, color = {0, 127, 255}));
  connect(pipe_L2_C501_T501_0.port_b, Gas_Heater.port_a) annotation(Line(points = {{-26, 108}, {-14, 108}, {-14, 80}, {-14, 80}}, color = {0, 127, 255}));
  connect(valveLinear2.port_b, pipe_L2_BMFT_TC_0.port_a) annotation(Line(points = {{134, 108}, {144, 108}}, color = {0, 127, 255}));
  connect(pipe_L2_BMFT_TC_0.port_b, temperature.port_a) annotation(Line(points = {{164, 108}, {165, 108}, {165, 110}, {166, 110}, {166, 112}, {168, 112}, {168, 110}, {170, 110}}, color = {0, 127, 255}));
  connect(pipe_L2_T501_BMFT_0.port_b, valveLinear2.port_a) annotation(Line(points = {{106, 108}, {114, 108}}, color = {0, 127, 255}));
  connect(temperature.T, realValue1.numberPort) annotation(Line(points = {{180, 121}, {168, 121}, {168, 132.5}, {168.5, 132.5}, {168.5, 134}}, color = {0, 0, 127}));
  connect(TC_0.port_b, pipe_L2_T501_BMFT_0.port_a) annotation(Line(points = {{76, 110}, {81, 110}, {81, 108}, {86, 108}}, color = {0, 127, 255}));
  connect(TC_0.T, prescribedHeatFlow_MFS.Q_flow) annotation(Line(points = {{66, 121}, {-14, 121}, {-14, 158}, {-14, 158}}, color = {0, 0, 127}));
  connect(pipe_L2_T501_TC_0.port_b, TC_0.port_a) annotation(Line(points = {{42, 112}, {56, 112}, {56, 110}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, vassel_L2_T511_0.ports[2]) annotation(Line(points = {{-82, 44}, {-84, 44}, {-84, 14}, {-84, 14}}, color = {0, 127, 255}));
  connect(pipe_L2_C501_BSW_0.port_b, valveLinear1.port_a) annotation(Line(points = {{-82, 70}, {-82, 70}, {-82, 64}, {-82, 64}}, color = {0, 127, 255}));
  connect(vassel_L2_C501_0.ports[3], pipe_L2_C501_T501_0.port_a) annotation(Line(points = {{-84, 104}, {-55, 104}, {-55, 108}, {-46, 108}}, color = {0, 127, 255}));
  connect(vassel_L2_C501_0.ports[2], pipe_L2_C501_BSW_0.port_a) annotation(Line(points = {{-84, 104}, {-84, 97}, {-82, 97}, {-82, 90}}, color = {0, 127, 255}));
  connect(pipe_L2_SAG_C501_0.port_b, vassel_L2_C501_0.ports[1]) annotation(Line(points = {{-126, 114}, {-84, 114}, {-84, 104}}, color = {0, 127, 255}));
  connect(boundary.ports[5], Gas_Heater.port_a) annotation(Line(points = {{-162, 113}, {-162, 123}, {-154, 123}, {-154, 114}, {-146, 114}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow_MPS.port, pipe_L2_SAG_C501_0.port_a) annotation(Line(points = {{-162, 113}, {-162, 123}, {-154, 123}, {-154, 114}, {-146, 114}}, color = {0, 127, 255}));
  // Соединение от ввода в установку до трубопровода
  // Соединение от трубопровода до брызгоуловителя
  // Соединение от брызгоуловителя до нагревателя
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Block_Prep_ASIDGAS;