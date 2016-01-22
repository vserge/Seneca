within Seneca.Reactor;

function calc_reactor
  input Integer v_a;
  input Integer v_b;

  external "C" mlfSumm(v_a, v_b) annotation(IncludeDirectory = "modelica://Seneca.Reactors.lib_summ/src", Include = "#include \"lib_summ.c\"");
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end calc_reactor;