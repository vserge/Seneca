within Seneca.Common;

model FluidPort_AIR "Это модель источника воздуха для печей, реакторов и других элементов"
  extends Modelica.Fluid.Interfaces.FluidPort;
  annotation(defaultComponentName = "port_AIR_GAS", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {0, 1}, lineColor = {16, 182, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{40, -39}, {-40, 39}}, endAngle = 360)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {-6, 11}, lineColor = {16, 182, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-32, 29}, {32, -29}}, endAngle = 360), Text(origin = {-15, 58}, extent = {{-21, 6}, {41, -18}}, textString = "%name")}));
end FluidPort_AIR;