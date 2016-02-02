within Seneca.Tests;

model test_Medium
replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase
    constrainedby Modelica.Media.Interfaces.PartialMedium;
      
  Modelica.Fluid.Sources.FixedBoundary boundary(nPorts = 1)  annotation(Placement(visible = true, transformation(origin = {-72, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveIncompressible valveIncompressible1 annotation(Placement(visible = true, transformation(origin = {6, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe annotation(Placement(visible = true, transformation(origin = {-32, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1 annotation(Placement(visible = true, transformation(origin = {46, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundary1(nPorts = 1) annotation(Placement(visible = true, transformation(origin = {80, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10.0, offset = 1, startTime = 3)  annotation(Placement(visible = true, transformation(origin = {-22, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, valveIncompressible1.opening) annotation(Line(points = {{-10, 62}, {6, 62}, {6, 28}, {6, 28}}, color = {0, 0, 127}));
  connect(pipe1.port_b, boundary1.ports[1]) annotation(Line(points = {{56, 20}, {70, 20}, {70, 18}, {70, 18}}, color = {0, 127, 255}));
  connect(valveIncompressible1.port_b, pipe1.port_a) annotation(Line(points = {{16, 20}, {36, 20}, {36, 20}, {36, 20}}, color = {0, 127, 255}));
  connect(pipe.port_b, valveIncompressible1.port_a) annotation(Line(points = {{-22, 18}, {-4, 18}, {-4, 20}, {-4, 20}}, color = {0, 127, 255}));
  connect(boundary.ports[1], pipe.port_a) annotation(Line(points = {{-62, 18}, {-44, 18}, {-44, 18}, {-42, 18}, {-42, 18}}, color = {0, 127, 255}));
  annotation(Icon, Diagram);
end test_Medium;