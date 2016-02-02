within Seneca.Interfaces;

model PartialTwoPort
  import Modelica.Icons;
 // extends Modelica.Icons.Model;
  extends Modelica.Fluid.Interfaces.PartialTwoPort annotation(IconMap(extent = {{-100, -100}, {100, 100}}, primitivesVisible = false), DiagramMap(extent = {{-100, -100}, {0, 0}}, primitivesVisible = true));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end PartialTwoPort;