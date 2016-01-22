within Seneca.Reactor;

model test_summ
  Integer t1 = 10;
  Integer t2 = 11;
equation
  calc_reactor(t1, t2);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end test_summ;