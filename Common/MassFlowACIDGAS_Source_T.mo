within Seneca.Common;

model MassFlowACIDGAS_Source_T
  extends Modelica.Fluid.Sources.MassFlowSource_T(redeclare package Medium = Seneca.Common.ACIDGas);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end MassFlowACIDGAS_Source_T;