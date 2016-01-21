within Seneca.Common;

class DataRecord
  extends Modelica.Media.IdealGases.Common.DataRecord;
  /*
                                                                                                                                                                          Базовый класс DataRecord содержит следующие определения:
                                                                                                                                                                            String name "Наименование газа";
                                                                                                                                                                            SI.MolarMass MM "Молярная масса";
                                                                                                                                                                            SI.SpecificEnthalpy Hf "Энтальпия формирования в 298.15K";
                                                                                                                                                                            SI.SpecificEnthalpy H0 "H0(298.15K) - H0(0K)";
                                                                                                                                                                            SI.Temperature Tlimit "Температурный предел между низкими и высокими наборами данных";
                                                                                                                                                                            Real alow[7] "Коэффициенты низкой температуры a";
                                                                                                                                                                            Real blow[2] "Константы низкой температуры b";
                                                                                                                                                                            Real ahigh[7] "Коэффициенты высокой температуры a";
                                                                                                                                                                            Real bhigh[2] "Константы высокой температуры b";
                                                                                                                                                                            SI.SpecificHeatCapacity R "Газовая постоянная";
                                                                                                                                                                            
                                                                                                                                                                            Для моделирования процесса производства серы необходим расширенный набор параметров в соответствии со справочником
                                                                                                                                                                            Malcolm W. Chase, Jr.: Journal of Physical and Chemical Reference Data Monograph No.9
                                                                                                                                                                            NIST-JANAF Thermochemical Tables Fourth Edition Part I, AI-Co  
                                                                                                                                                                            Однако не все коэффеициенты удалось найти в этом справочнике
                                                                                                                                                                          */
  Real mu_a[7] "Коэффициент для расчета химических потенциалов для определенных коэффициентов";
  SI.Temperature Tlow "Нижняя температурная граница для расчета химических потенциалов";
  SI.Temperature THigh "Верхняя температурная граница для расчета химических потенциалов";
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end DataRecord;