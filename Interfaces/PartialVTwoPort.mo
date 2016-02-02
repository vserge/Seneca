within Seneca.Interfaces;

partial model PartialVTwoPort "Partial component with two vertical ports/Частичная модель двух вертикальных портов"
  import Modelica.Constants;
  outer Modelica.Fluid.System system "System wide properties/Глобальные характеристики системы";
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium in the component" annotation(choicesAllMatching = true);
  parameter Boolean allowFlowReversal = system.allowFlowReversal "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(Dialog(tab = "Assumptions"), Evaluate = true);
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium, m_flow(min = if allowFlowReversal then -Constants.inf else 0)) "Fluid connector a (positive design flow direction is from port_a to port_b)" annotation(Placement(visible = true, transformation(extent = {{-10, 90}, {10, 110}}, rotation = 0), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium = Medium, m_flow(max = if allowFlowReversal then +Constants.inf else 0)) "Fluid connector b (positive design flow direction is from port_a to port_b)" annotation(Placement(visible = true, transformation(extent = {{10, -110}, {-10, -90}}, rotation = 0), iconTransformation(extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  // Model structure, e.g., used for visualization
protected
  parameter Boolean port_a_exposesState = false "= true if port_a exposes the state of a fluid volume";
  parameter Boolean port_b_exposesState = false "= true if port_b.p exposes the state of a fluid volume";
  parameter Boolean showDesignFlowDirection = true "= false to hide the arrow in the model icon";
  annotation(Documentation(info = "<html>
<p>
Эта частичная модель определяет интерфейс для компонентов с двумя портами, расположенными вертикально.
Обработка направления потока и реверсирования потока предопределена на основе параметра <code><b>allowFlowReversal</b></code>.
Компонент может транспортировать жидкость и может иметь внутреннюю память для данной жидкости<code><b>Medium</b></code>.
</p>
<p>
Расширяющая модель, прямой доступ к внутренним хорактристикам массы или энергии через port_a или port_b обеспечивает посредством 
 переопределения защищенные параметров <code><b>port_a_exposesState</b></code> и <code><b>port_b_exposesState</b></code> соотвественно.
Это визуализируется в значках порта, для улучшения понимание жидких базовых схем.
</p>
</html>"), Icon(graphics = {Line(origin = {-80, 21}, points = {{0, 41}, {0, -39}}, color = {0, 128, 255}, thickness = 1, visible = showDesignFlowDirection), Polygon(origin = {-80.04, -29.87}, lineColor = {0, 128, 255}, smooth = Smooth.None, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid, points = {{-19.9647, 9.86997}, {0.0353107, -10.13}, {20.0353, 9.86997}, {-19.9647, 9.86997}}, visible = showDesignFlowDirection), Polygon(origin = {-80, -26.83}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-12, 6.8254}, {0, -7.1746}, {12, 6.8254}, {-12, 6.8254}})}, visible = showDesignFlowDirection), Diagram);
end PartialVTwoPort;