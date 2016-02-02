within Seneca.BlockModels;

model Block_Prep_ASIDGAS
  import Modelica.Fluid.Interfaces;
  import SI=Modelica.SIunits;
  import Modelica.Media.IdealGases.MixtureGases.SimpleNaturalGas;
   //extends Modelica.Media.IdealGases.Common.MixtureGasNasa (redeclare package Medium = Seneca.Common.ACIDGas2);
   //redeclare package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
   /* Используем из примера определение потока воздуха для горелки */
 //  redeclare replaceable package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater constrainedby Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(choicesAllMatching = true);
    package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater;
/*   redeclare package Medium1 = Modelica.Media.IdealGases.MixtureGases.CombustionAir
    "Medium model";
  Medium1.BaseProperties medium1(
    p(start=1.e5,
      fixed=true,
      stateSelect=StateSelect.prefer),
    T(start=300,
      fixed=true,
      stateSelect=StateSelect.prefer),
    X(start={0.8,0.2}));
  Real m1(quantity=Medium1.mediumName, start=1.0);
  SI.InternalEnergy U1;
  Medium1.SpecificHeatCapacity cp1=Medium1.specificHeatCapacityCp(medium1.state);
  Medium1.DynamicViscosity eta1=Medium1.dynamicViscosity(medium1.state);
  Medium1.ThermalConductivity lambda1=Medium1.thermalConductivity(medium1.state);
   */
   
   
   
 //  package Medium=Seneca.Common.ACIDGas2;
  Interfaces.FluidPort_a port_a (redeclare package Medium = Medium)  "Порт ввода газа" annotation(Placement(visible = true, transformation(origin = {-584, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Interfaces.FluidPort_b port_b    annotation(Placement(visible = true, transformation(origin = {586, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Common.System system annotation(Placement(visible = true, transformation(origin = {-541, 332}, extent = {{-49, -38}, {49, 38}}, rotation = 0)));
  //Датчики
  // Трубопроводы
  // Трубопровод от ввода в установку и до брызгоуловителя
  //Нагреватель кислого газа используем объем с нагревателем
  //Блок сбора кислой воды
//  Pipes.BasePipe pipe_L2_SAG_C501_0   annotation(Placement(visible = true, transformation(origin = {-527, 43}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
 // Modelica.Fluid.Vessels.ClosedVolume vassel_L2_T501_0 ( V = 5.76, nPorts = 3, use_portsData = true, use_Re = false) "Брызгоуловитель" annotation(Placement(visible = true, transformation(origin = {-338, 34}, extent = {{-72, -72}, {72, 72}}, rotation = 0)));
  //Разделитель жидкости и газа (брызгоуловитель)
  /*
                                                                                                                                                                                                                                            Здесь должен быть датчик уровня жидкости нужно его вытащить из модели model PartialLumpedVessel
                                                                                                                                                                                                                                          */
 /*  Modelica.Fluid.Valves.ValveLinear valveLinear1  annotation(Placement(visible = true, transformation(origin = {-495, -231}, extent = {{-31, -31}, {31, 31}}, rotation = -90)));
  Pipes.BasePipe pipe_L2_C501_T501_0   annotation(Placement(visible = true, transformation(origin = {-155, -39}, extent = {{-49, -49}, {49, 49}}, rotation = 0)));
  Pipes.BasePipe pipe_L2_C501_BSW_0    annotation(Placement(visible = true, transformation(origin = {-498, -122}, extent = {{-36, -36}, {36, 36}}, rotation = -90)));
  Pipes.BasePipe pipe_L2_T501_TC_0  annotation(Placement(visible = true, transformation(origin = {280, -38}, extent = {{-54, -54}, {54, 54}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort TC_0(allowFlowReversal = false) "Датчик температуры Кислого газа после нагревателя" annotation(Placement(visible = true, transformation(origin = {466, -27}, extent = {{-50, -55}, {50, 55}}, rotation = 0)));
  Modelica.Fluid.Pipes.DynamicPipe Gas_Heater(use_HeatTransfer = true, roughness = 66, allowFlowReversal = false, length = 1, diameter = 1) "Нагреватель кислого газа от пара среднего давления" annotation(Placement(visible = true, transformation(origin = {68, -38}, extent = {{-84, -84}, {84, 84}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow_MPS(T_ref = 468) "Поток пара среднего давления с регулировкой" annotation(Placement(visible = true, transformation(origin = {-12, 200}, extent = {{-58, -58}, {58, 58}}, rotation = 0)));
  Modelica.Blocks.Logical.Less less1 annotation(Placement(visible = true, transformation(origin = {379, 141}, extent = {{-37, -35}, {37, 35}}, rotation = 0)));
  Modelica.Blocks.Logical.Switch switch1 annotation(Placement(visible = true, transformation(origin = {513, 239}, extent = {{-41, -41}, {41, 41}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 190)  annotation(Placement(visible = true, transformation(origin = {270, 78}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {203, 193}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(Placement(visible = true, transformation(origin = {130, 126}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundary annotation(Placement(visible = true, transformation(origin = {-369, -281}, extent = {{-47, -39}, {47, 39}}, rotation = 0)));
equation
  connect(valveLinear1.port_b, boundary.ports[1]) annotation(Line(points = {{-494, -262}, {-316, -262}, {-316, -266}, {-322, -266}, {-322, -280}}, color = {0, 127, 255}));
  connect(const1.y, add1.u2) annotation(Line(points = {{160, 126}, {168, 126}, {168, 176}, {170, 176}}, color = {0, 0, 127}));
  connect(add1.y, prescribedHeatFlow_MPS.Q_flow) annotation(Line(points = {{232, 194}, {-78, 194}, {-78, 200}, {-70, 200}}, color = {0, 0, 127}));
  connect(switch1.y, add1.u1) annotation(Line(points = {{558, 240}, {170, 240}, {170, 210}, {170, 210}}, color = {0, 0, 127}));
  connect(const.y, less1.u2) annotation(Line(points = {{300, 78}, {330, 78}, {330, 112}, {334, 112}}, color = {0, 0, 127}));
  connect(TC_0.T, switch1.u1) annotation(Line(points = {{466, 34}, {462, 34}, {462, 272}, {464, 272}}, color = {0, 0, 127}));
  connect(less1.y, switch1.u2) annotation(Line(points = {{420, 142}, {460, 142}, {460, 240}, {464, 240}}, color = {255, 0, 255}));
  connect(TC_0.T, less1.u1) annotation(Line(points = {{466, 34}, {174, 34}, {174, 141}, {335, 141}}, color = {0, 0, 127}));
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
  // Соединение от датчика температуры к границе блока
  connect(TC_0.port_b, port_b) annotation(Line(points = {{586, 46}, {516, 46}, {516, -27}}));
  */
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Text(origin = {-92, 91}, extent = {{190, 1}, {-8, -1}}, textString = "Блок подготовки кислого газа", fontSize = 40), Rectangle(lineThickness = 2, borderPattern = BorderPattern.Engraved, extent = {{-100, 98}, {100, -98}}, radius = 2), Text(origin = {-8, -3}, lineColor = {255, 0, 0}, extent = {{-70, 79}, {96, -77}}, textString = "B_PAG", fontSize = 200)}), Diagram(coordinateSystem(extent = {{-600, -400}, {600, 400}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end Block_Prep_ASIDGAS;