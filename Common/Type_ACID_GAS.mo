within Seneca.Common;
record Type_ACID_GAS
  parameter Real O2_m(start = 0.21) "Массовая доля кислорода";
  parameter Real O2_v "Объемная доля кислорода";
  parameter Real N2_m(start = 0.79) "Массовая доля азота";
  parameter Real N2_v "Объемная доля азота";
  parameter Real T_AIR "Температура воздуха";
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Type_ACID_GAS;