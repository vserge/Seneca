within Seneca.Tests;

model test_summ
  Real t1 = 10;
  Real t2 = 11;
  Real res;
equation
  res = calc_reactor(t1, t2);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02));
end test_summ;