within Seneca.Condenser;

class Condenser
//  extends Condenser_pipes;
  extends Gas_Flow;
  // extends Pipe;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-90, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{70, 0}, {90, 0}}, color = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}), Line(points = {{-96, 0}, {-70, 0}}, color = {0, 0, 255}), Line(points = {{50, -30}, {50, -50}}, color = {0, 0, 255}), Line(points = {{60, 30}, {60, 60}}, color = {0, 0, 255})}));
end Condenser;