within Seneca.Common;
model FluidPort_FUEL "Это модель источника газа для горения в печи дожига"
  extends Modelica.Fluid.Interfaces.FluidPort;
  parameter Real C3H8_m "Массовая доля Пропана";
  parameter Real C3H8_v "Объемная доля Пропана";
  // Энетальпию пропана зафиксировать как внутренний параметр
  // Для будущего, чтобы моделировать топливо любого вида, можно рассматривать теплоту сгорания как входной параметр
  annotation(defaultComponentName = "port_AIR", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {-8, 9}, lineColor = {16, 182, 255}, fillColor = {26, 26, 26}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-30, 29}, {24, -21}}, endAngle = 360), Text(origin = {-11, 48}, lineColor = {26, 26, 26}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-21, 6}, {21, -6}}, textString = "%name")}));
end FluidPort_FUEL;