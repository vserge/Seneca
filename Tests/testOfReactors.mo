within Seneca.Tests;

model testOfReactors
  parameter Types.ModelStructure pipeModelStructure = Modelica.Fluid.Types.ModelStructure.av_vb;
  BlockModels.Block_Reactors block_Reactors1 annotation(Placement(visible = true, transformation(origin = {-2.84217e-14, 30}, extent = {{-48, -48}, {48, 48}}, rotation = 0)));
  Common.MassFlowACIDGAS_Source_T massFlowACIDGAS_Source_T1(nPorts = 1, redeclare package Medium = Medium, p = 5.0e5, T = 300);
  annotation(Placement(visible = true, transformation(origin = {-94, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end testOfReactors;