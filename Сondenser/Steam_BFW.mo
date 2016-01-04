model Steam_BFW
  extends Gas_Flow;
  extends BFW_Pipes;
  //extends Pipe;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(extent = {{-40, 20}, {-20, -20}}, lineColor = {0, 0, 255}), Line(points = {{-30, -20}, {-30, -50}}, color = {0, 0, 255}), Line(points = {{-30, 20}, {-30, 50}}, color = {0, 0, 255})}));
end Steam_BFW;