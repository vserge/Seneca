model Condenser_block
  Condenser_II condenser_II1 annotation(Placement(visible = true, transformation(origin = {-14, -3.55271e-15}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  ABO aBO1 annotation(Placement(visible = true, transformation(origin = {-10, 66}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Condenser_III condenser_III1 annotation(Placement(visible = true, transformation(origin = {52, 0}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  Sulfur_Seal sulfur_Seal1 annotation(Placement(visible = true, transformation(origin = {62, -94}, extent = {{-36, -36}, {36, 36}}, rotation = 0)));
  Condenser_I condenser_I1 annotation(Placement(visible = true, transformation(origin = {-84, -4}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
equation
  connect(condenser_III1.out_sulfur, sulfur_Seal1.in_seal) annotation(Line(points = {{62, -26}, {62, -26}, {62, -66}, {62, -66}}, color = {0, 0, 255}));
  connect(condenser_II1.out_condenser_II, condenser_III1.in_condenser_III) annotation(Line(points = {{4, 0}, {30, 0}}, color = {0, 0, 255}));
  connect(condenser_II1.out_BFW, aBO1.in_ABO) annotation(Line(points = {{-14, 10}, {-14, 10}, {-14, 42}, {-36, 42}, {-36, 66}, {-28, 66}, {-28, 66}}, color = {0, 0, 255}));
  connect(condenser_I1.out_condenser_I, condenser_II1.in_condenser_II) annotation(Line(points = {{-57, 0}, {-32, 0}, {-32, 0}, {-32, 0}}, color = {0, 0, 255}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Condenser_block;