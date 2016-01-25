within Seneca.Reactor;

function calc_reactor
  input Integer v_a;
  input Integer v_b;
  output Integer v_out;

  external "C" v_out = _mlfSumm(v_a, v_b) annotation(IncludeDirectory = "modelica://shared_train/src", Include = "#include \"lib_summ.c\"");
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end calc_reactor;