within Seneca.Tests;

model test_DrumBoiler "Полная модель бойлера барабана, включая испаритель и дополнительные компоненты"
 // extends Modelica.Icons.Example;
  import Cv = Modelica.SIunits.Conversions;
  parameter Boolean use_inputs = false "true - позволяет использовать порты ввода/вывода модели вместо внутренних тестовых данных";
  Seneca.Common.EquilibriumDrumBoiler evaporator(m_D = 300e3, cp_D = 500, V_t = 100, V_l_start = 67, redeclare package Medium = Modelica.Media.Water.StandardWater, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p_start = 100000) annotation(Placement(transformation(extent = {{-46, -30}, {-26, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow furnace annotation(Placement(transformation(origin = {-36, -53}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.FixedBoundary sink(nPorts = 1, p = Cv.from_bar(0.5), redeclare package Medium = Modelica.Media.Water.StandardWaterOnePhase, T = 500) annotation(Placement(transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(Placement(transformation(origin = {30, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(Placement(transformation(origin = {-3, -1}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(Placement(transformation(extent = {{10, 18}, {30, 38}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI controller(T = 120, k = 10, initType = Modelica.Blocks.Types.Init.InitialState) annotation(Placement(transformation(extent = {{-49, 23}, {-63, 37}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_h pump(nPorts = 1, h = 5e5, redeclare package Medium = Modelica.Media.Water.StandardWater, use_m_flow_in = true) annotation(Placement(transformation(extent = {{-80, -30}, {-60, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-22, 20}, {-42, 40}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant levelSetPoint(k = 67) annotation(Placement(transformation(extent = {{-38, 48}, {-24, 62}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput T_S "steam temperature" annotation(Placement(transformation(extent = {{100, 48}, {112, 60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput p_S "steam pressure" annotation(Placement(transformation(extent = {{100, 22}, {112, 34}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qm_S "steam flow rate" annotation(Placement(transformation(extent = {{100, -2}, {112, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput V_l "liquid volume inside drum" annotation(Placement(transformation(extent = {{100, 74}, {112, 86}}, rotation = 0)));
  Modelica.Blocks.Math.Gain MW2W(k = 1e6) annotation(Placement(transformation(extent = {{-54, -75.5}, {-44, -64.5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain Pa2bar(k = 1e-5) annotation(Placement(transformation(extent = {{37, 23}, {47, 33}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.FromKelvin K2degC annotation(Placement(transformation(extent = {{38, 49}, {48, 59}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin = 0, uMax = 500) annotation(Placement(transformation(origin = {-78, 30}, extent = {{-7, 7}, {7, -7}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveLinear SteamValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 9000000, m_flow_nominal = 180) annotation(Placement(transformation(extent = {{50, -10}, {70, -30}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(Placement(transformation(extent = {{-90, 70}, {-70, 90}})));
  Modelica.Blocks.Sources.TimeTable q_F_Tab(table = [0, 0; 3600, 400; 7210, 400]) if not use_inputs annotation(Placement(transformation(extent = {{-90, -80}, {-70, -60}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable Y_Valve_Tab(table = [0, 0; 900, 1; 7210, 1]) if not use_inputs annotation(Placement(transformation(extent = {{30, -80}, {50, -60}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput q_F(unit = "MW") if use_inputs "fuel flow rate" annotation(Placement(visible = true, transformation(extent = {{-112, -54}, {-100, -42}}, rotation = 0), iconTransformation(extent = {{-112, -56}, {-100, -44}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Y_Valve if use_inputs "valve opening" annotation(Placement(transformation(extent = {{-112, -96}, {-100, -84}})));
equation
  connect(q_F, MW2W.u) annotation(Line(points = {{-106, -48}, {-62, -48}, {-62, -70}, {-55, -70}}, color = {0, 0, 127}));
  connect(Y_Valve, SteamValve.opening) annotation(Line(points = {{-106, -90}, {60, -90}, {60, -28}}, color = {0, 0, 127}));
  connect(furnace.port, evaporator.heatPort) annotation(Line(points = {{-36, -43}, {-36, -30}}, color = {191, 0, 0}));
  connect(controller.u, feedback.y) annotation(Line(points = {{-47.6, 30}, {-41, 30}}, color = {0, 0, 127}));
  connect(massFlowRate.m_flow, qm_S) annotation(Line(points = {{30, -9}, {30, 4}, {106, 4}}, color = {0, 0, 127}));
  connect(evaporator.V, V_l) annotation(Line(points = {{-32, -9}, {-32, 16}, {-4, 16}, {-4, 80}, {106, 80}}, color = {0, 0, 127}));
  connect(MW2W.y, furnace.Q_flow) annotation(Line(points = {{-43.5, -70}, {-36, -70}, {-36, -63}}, color = {0, 0, 127}));
  connect(pressure.p, Pa2bar.u) annotation(Line(points = {{31, 28}, {36, 28}}, color = {0, 0, 127}));
  connect(Pa2bar.y, p_S) annotation(Line(points = {{47.5, 28}, {106, 28}}, color = {0, 0, 127}));
  connect(K2degC.Celsius, T_S) annotation(Line(points = {{48.5, 54}, {106, 54}}, color = {0, 0, 127}));
  connect(controller.y, limiter.u) annotation(Line(points = {{-63.7, 30}, {-69.6, 30}}, color = {0, 0, 127}));
  connect(limiter.y, pump.m_flow_in) annotation(Line(points = {{-85.7, 30}, {-90, 30}, {-90, -12}, {-80, -12}}, color = {0, 0, 127}));
  connect(temperature.T, K2degC.Kelvin) annotation(Line(points = {{4, -1}, {4, -1}, {8, -1}, {8, 54}, {37, 54}}, color = {0, 0, 127}));
  connect(pressure.port, massFlowRate.port_a) annotation(Line(points = {{20, 18}, {20, -20}}, color = {0, 127, 255}));
  connect(pump.ports[1], evaporator.port_a) annotation(Line(points = {{-60, -20}, {-46, -20}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, SteamValve.port_a) annotation(Line(points = {{40, -20}, {50, -20}}, color = {0, 127, 255}));
  connect(SteamValve.port_b, sink.ports[1]) annotation(Line(points = {{70, -20}, {75, -20}, {80, -20}}, color = {0, 127, 255}));
  connect(evaporator.port_b, massFlowRate.port_a) annotation(Line(points = {{-26, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(temperature.port, massFlowRate.port_a) annotation(Line(points = {{-3, -11}, {-3, -20}, {20, -20}}, color = {0, 127, 255}, smooth = Smooth.None));
  connect(q_F_Tab.y, MW2W.u) annotation(Line(points = {{-69, -70}, {-55, -70}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(Y_Valve_Tab.y, SteamValve.opening) annotation(Line(points = {{51, -70}, {60, -70}, {60, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(evaporator.V, feedback.u2) annotation(Line(points = {{-32, -9}, {-32, 22}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(levelSetPoint.y, feedback.u1) annotation(Line(points = {{-23.3, 55}, {-16, 55}, {-16, 30}, {-24, 30}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-151, 165}, {138, 102}}, lineColor = {0, 0, 255}, textString = "%name"), Text(extent = {{-79, 67}, {67, 21}}, lineColor = {0, 0, 0}, textString = "drum"), Text(extent = {{-90, -14}, {88, -64}}, lineColor = {0, 0, 0}, textString = "boiler")}), experiment(StopTime = 5400), Documentation(info = "<html>

<img src=\"modelica://Modelica/Resources/Images/Fluid/Examples/DrumBoiler.png\" border=\"1\"
   alt=\"DrumBoiler.png\">
</html>"));
end test_DrumBoiler;