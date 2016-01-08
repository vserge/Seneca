within Seneca.Common;

model FluidPort_ACIDGAS
  extends Modelica.Fluid.Interfaces.FluidPort;
  parameter Real H2S_m "Массовая доля Сероводорода";
  parameter Real H2S_v "Объемная доля Сероводорода";
  parameter Real SO2_m "Массовая доля Оксида серы";
  parameter Real SO2_v "Объемная доля Оксида серы";
  parameter Real H2O_m "Массовая доля Воды";
  parameter Real H2O_v "Объемная доля Воды";
  parameter Real O2_m "Массовая доля Кислорода";
  parameter Real O2_v "Объемная доля Кислорода";
  parameter Real N2_m "Массовая доля Азота";
  parameter Real N2_v "Объемная доля Азота";
  parameter Real H2_m "Массовая доля Водорода";
  parameter Real H2_v "Объемная доля Водорода";
  parameter Real CO_m "Массовая доля Угарного газа";
  parameter Real CO_v "Объемная доля Угарного газа";
  parameter Real CO2_m "Массовая доля Углекислого газа";
  parameter Real CO2_v "Объемная доля Углекислого газа";
  parameter Real COS_m "Массовая доля Тиокарбонил";
  parameter Real COS_v "Объемная доля Тиокарбонил";
  parameter Real CS2_m "Массовая доля Сероуглерод";
  parameter Real CS2_v "Объемная доля Сероуглерод";
  parameter Real CH4_m "Массовая доля Метана";
  parameter Real CH4_v "Объемная доля Метана";
  parameter Real C2H6_m "Массовая доля Этана";
  parameter Real C2H6_v "Объемная доля Этана";
  parameter Real CS2_m "Массовая доля Сероуглерод";
  parameter Real CS2_v "Объемная доля Сероуглерод";
  parameter Real T_ACID "Температура кислого газа";
  /* stream Medium.MassFraction Xi_outflow[Medium.nXi] "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0";
                                              Этот вектор должен быть приязан ко всех характеристикам перечисленным выше

                                              Вектор теплоемкости
                                              stream Medium.ExtraProperty C_outflow[Medium.nC] "Properties c_i/m close to the connection point if m_flow < 0";
                                              должен быть заполнен!!!

                                                */
  annotation(defaultComponentName = "port_ACID_GAS", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(lineColor = {255, 0, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{30, -30}, {-30, 30}}, endAngle = 360)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Ellipse(origin = {-12, 27}, lineColor = {255, 2, 0}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-22, 23}, {34, -33}}, endAngle = 360), Text(origin = {-5, 62}, extent = {{-29, 12}, {29, -12}}, textString = "%name")}));
end FluidPort_ACIDGAS;