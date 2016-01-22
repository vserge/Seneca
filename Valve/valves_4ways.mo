within Seneca.Valve;

model valves_4ways
  import Modelica.Fluid.Types.CvTypes;
  import Modelica.Fluid.Valves.BaseClasses;
  extends Modelica.Fluid.Interfaces.PartialTwoPortTransport(dp_start = dp_nominal, m_flow_small = if system.use_eps_Re then system.eps_m_flow * m_flow_nominal else system.m_flow_small, m_flow_start = m_flow_nominals);
  parameter Modelica.Fluid.Types.CvTypes CvData = Modelica.Fluid.Types.CvTypes.OpPoint "Выбор коэффициента расхода" annotation(Dialog(group = "Коэффициент расхода"));
  parameter SI.Area Av(fixed = if CvData == Modelica.Fluid.Types.CvTypes.Av then true else false, start = m_flow_nominal / sqrt(rho_nominal * dp_nominal) * valveCharacteristic(opening_nominal)) "Av (metric) flow coefficient" annotation(Dialog(group = "Flow Coefficient", enable = CvData == Modelica.Fluid.Types.CvTypes.Av));
  parameter Real Kv = 0 "Kv (metric) flow coefficient [m3/h]" annotation(Dialog(group = "Flow Coefficient", enable = CvData == Modelica.Fluid.Types.CvTypes.Kv));
  parameter Real Cv = 0 "Cv (US) flow coefficient [USG/min]" annotation(Dialog(group = "Flow Coefficient", enable = CvData == Modelica.Fluid.Types.CvTypes.Cv));
  parameter SI.Pressure dp_nominal "Nominal pressure drop" annotation(Dialog(group = "Nominal operating point"));
  parameter Medium.MassFlowRate m_flow_nominal "Nominal mass flowrate" annotation(Dialog(group = "Nominal operating point"));
  parameter Medium.Density rho_nominal = Medium.density_pTX(Medium.p_default, Medium.T_default, Medium.X_default) "Nominal inlet density" annotation(Dialog(group = "Nominal operating point", enable = CvData == Modelica.Fluid.Types.CvTypes.OpPoint));
  parameter Real opening_nominal(min = 0, max = 1) = 1 "Nominal opening" annotation(Dialog(group = "Nominal operating point", enable = CvData == Modelica.Fluid.Types.CvTypes.OpPoint));
  parameter Boolean filteredOpening = false "= true, if opening is filtered with a 2nd order CriticalDamping filter" annotation(Dialog(group = "Filtered opening"), choices(checkBox = true));
  parameter Modelica.SIunits.Time riseTime = 1 "Rise time of the filter (time to reach 99.6 % of an opening step)" annotation(Dialog(group = "Filtered opening", enable = filteredOpening));
  parameter Real leakageOpening(min = 0, max = 1) = 1e-3 "The opening signal is limited by leakageOpening (to improve the numerics)" annotation(Dialog(group = "Filtered opening", enable = filteredOpening));
  parameter Boolean checkValve = false "Reverse flow stopped" annotation(Dialog(tab = "Assumptions"));
  replaceable function valveCharacteristic = Modelica.Fluid.Valves.BaseClasses.ValveCharacteristics.linear constrainedby Modelica.Fluid.Valves.BaseClasses.ValveCharacteristics.baseFun "Inherent flow characteristic" annotation(choicesAllMatching = true);
  constant SI.Area Kv2Av = 27.7e-6 "Conversion factor";
  constant SI.Area Cv2Av = 24.0e-6 "Conversion factor";
  Modelica.Fluid.Interfaces.FluidPort_a port_a1 annotation(Placement(visible = true, transformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-85, 85}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1 annotation(Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter SI.Pressure dp_small = if system.use_eps_Re then dp_nominal / m_flow_nominal * m_flow_small else system.dp_small "Regularisation of zero flow" annotation(Dialog(tab = "Advanced"));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Line(points = {{-100, 60}, {100, -60}, {100, 60}, {-100, -60}, {-100, 60}}), Line(origin = {0, -6.943e-05}, points = {{-60, 100}, {60, -99.9999}, {-60, -99.9999}, {60, 100}, {-60, 100}}), Rectangle(origin = {0, 10}, extent = {{-40, 30}, {40, -50}}), Text(origin = {2, -8}, lineColor = {0, 0, 255}, extent = {{-40, 38}, {36, -32}}, textString = "M", fontSize = 300, textStyle = {TextStyle.Bold})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end valves_4ways;