within Seneca.Common;

connector SulfurPort_a "Общий порт ввода серы"
  import Modelica.Fuild.Interfaces.FuildPort;
  extends Modelica.Fluid.Interfaces.FluidPort;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {-50, 49}, fillColor = {255, 204, 102}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{148, -147}, {-48, 49}}, endAngle = 360)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {-10, 10}, fillColor = {255, 204, 102}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{70, -70}, {-50, 50}}, endAngle = 360), Text(origin = {0, 79}, lineColor = {255, 204, 102}, lineThickness = 0.5, extent = {{-98, 19}, {98, -19}}, textString = "%name", fontSize = 150, textStyle = {TextStyle.Bold})}));
end SulfurPort_a;