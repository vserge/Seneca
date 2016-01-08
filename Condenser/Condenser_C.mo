within Seneca.Condenser;
model Condenser_C
  extends Gas_Flow;
  annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, 40}, {70, -40}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{30, 80}, {30, 40}}, color = {0, 0, 255}), Line(points = {{30, -80}, {30, -40}}, color = {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-70, -40}, {70, 40}}, lineColor = {0, 0, 255}), Line(points = {{30, 80}, {30, 40}}, color = {0, 0, 255}), Line(points = {{30, -80}, {30, -40}}, color = {0, 0, 255})}));
end Condenser_C;