within Seneca.Condenser;

model Sulfur_Seal "Серозатвор для вывода серы в серохранилище"
  import Modelica.Fluid.Pipes.StaticPipe;
  extends Modelica.Fluid.Pipes.StaticPipe annotation(IconMap(primitivesVisible = false));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(fillColor = {255, 204, 102}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, 44}, {100, -44}})}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Sulfur_Seal;