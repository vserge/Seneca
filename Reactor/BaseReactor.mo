within Seneca.Reactor;

model BaseReactor "Базовая модель реактора"
  import SI = Modelica.SIunits;
  parameter Boolean use_inputs = false "true - позволяет использовать порты ввода/вывода модели вместо внутренних тестовых данных";
  parameter Boolean cold_state_reactor = true "true - реактор работает в холодном режиме, false - реактор работает в горячем режиме";
  extends Seneca.Interfaces.PartialVTwoPort(final port_a_exposesState = true, final port_b_exposesState = true, showDesignFlowDirection = true, redeclare replaceable package Medium = Modelica.Media.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium);
  // port_s - это порт вывода жидкой серы, он работает только во втором реакторе, т.е. когда температура реактора ниже 190 градусов
  Modelica.Blocks.Interfaces.RealOutput port_t "сигнал измерения температуры" annotation(Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Common.SulfurPort_b sulfurPort_b1(redeclare replaceable package Medium = Modelica.Media.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium) if cold_state_reactor "порт вывода серы из реактора в случае если реактор работает в холодном режиме" annotation(Placement(visible = true, transformation(origin = {100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(port_a, sulfurPort_b1) annotation(Line(points = {{0, 100}, {98, 100}, {98, -70}, {100, -70}}));
  connect(port_a, port_b) annotation(Line(points = {{0, 100}, {2, 100}, {2, -100}, {0, -100}}));
  //Вызов функции из матлаба для расчета характеристик реактора
  port_t = Medium.Temperature;
  //Если реактора горячий, то port_s не используется
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, 89}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 11}, {20, -9}}), Rectangle(origin = {0, -90}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-20, 10}, {20, -10}}), Text(origin = {8, -11}, lineColor = {255, 0, 0}, extent = {{-68, 89}, {50, -67}}, textString = "%name", fontSize = 60)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, -1}, lineThickness = 1, extent = {{-80, 101}, {80, -99}}), Rectangle(origin = {1, 50}, extent = {{-81, 30}, {79, -30}}), Text(origin = {-2, 0}, extent = {{-72, 74}, {76, 24}}, textString = "Зона первого катализатора", fontSize = 40), Rectangle(origin = {1, -50}, extent = {{-81, 30}, {79, -30}}), Text(origin = {-2, -98}, extent = {{-72, 74}, {76, 24}}, textString = "Зона второго катализатора\n и отвода тепла", fontSize = 40)}));
end BaseReactor;