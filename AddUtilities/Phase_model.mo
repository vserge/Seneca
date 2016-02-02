model Phase_model "Это тестовая модель для сбора всех функций в одном месте"
import SI=Modelica.SIunits;

record DE "Структура данных для коэффициентов Δэкв, мм"
  String tag "Уникальная обривиатура для трубы";
  String name "Уникальное определение труб";
  Real c "Значение коэффициента";
end DE;

  function Sygma_sloy "Функция расчета толщины вязкого подслоя для турбулентного потока"
  import SI=Modelica.SIunits;
  import MC=Modelica.Constants;
  // ReynoldsNumber
  import Modelica.Fluid.Pipes.BaseClasses.CharacteristicNumbers.ReynoldsNumber;

  input SI.Velocity v "Mean velocity of fluid flow";
  input SI.Density rho "Fluid density";
  input SI.DynamicViscosity mu "Dynamic (absolute) viscosity";
  input SI.Length D "Characteristic dimension (hydraulic diameter of pipes)";
  output Real Sigma "толщины вязкого подслоя для турбулентного потока";
 
 protected
  /*
Enum index              Трубы                                 Δэкв, мм   
SteelWholeNew           Стальные цельнотянутые новые            0,02—0,05 
SteelWholeOld           Стальные цельнотянутые, неновые (бывшие в эксплуатации)  0,15—0,3 
SteelWeldedNew          Стальные сварные новые                  0,04—0,1 
CastIronNew             Чугунные новые                          0,25—1 
CastIronSteelOld        Чугунные и стальные сварные неновые     0,8—1,5 
AsbestosCementNew       Асбестоцементные новые                  0,05-0,1 
AsbestosCementOld       То же, неновые                          0,6 
ConcreteIronConcrete    Бетонные и железобетонные               0,3—0,8 
  */
   
  DE[8] DeltaEcv = {DE(tag="SteelWholeNew",name="Стальные цельнотянутые новые",c=0.05),
    DE(tag="SteelWholeOld",name="Стальные цельнотянутые, неновые (бывшие в эксплуатации)",c=0.3),
    DE(tag="SteelWeldedNew",name="Стальные сварные новые",c=0.1),
    DE(tag="CastIronNew",name="Чугунные новые",c=1),
    DE(tag="CastIronSteelOld",name="Чугунные и стальные сварные неновые",c=1.5),
    DE(tag="AsbestosCementNew",name="Асбестоцементные новые",c=0.1),
    DE(tag="AsbestosCementOld",name="Асбестоцементные неновые",c=0.6),
    DE(tag="ConcreteIronConcrete",name="Бетонные и железобетонные",c=0.8)};
  
  Real RN = Modelica.Fluid.Pipes.BaseClasses.CharacteristicNumbers.ReynoldsNumber(v,rho,mu,D) "Вычисление числа Рейнольдса";
  Real Lyamda = 63/RN "Значение по умолчанию для ламинарного потока"; 
  
  algorithm
  // нужно определить как выбирать типы труб при вызове функции
  
//  Boolean[:] b : = {r.tag == "SteelWeldedNew" for r in DeltaEcv};
 // Integer i := Modelica.Math.BooleanVectors.firstTrueIndex(b);
  Lyamda :=RN*(0.1/D);
   //print ("Число Рейнольдса"+String(RN));
   //sigma=(30*D)/(RN*sqrt(Lyamda);
    Sigma := Lyamda/RN;

  annotation(Icon, Diagram);
end Sygma_sloy;

function Phase_state "Функция определения диаграммы состояний бинарных веществ"
  import SI=Modelica.SIunits;
  import MC=Modelica.Constants;
   
  input Real mu0[2] "стандартное значение химического потенциала i-го компонента";
  //Modelica.Constants.R R "R=8.314472 - Molar gas constant - Универсальная газовая постоянная";
    input Real omega[2] "Cобственный объем атома i-го компонента";
  input Real deltaH[2] "скрытые теплоты перехода жидкость−твердое тело в чистых компонентах";
  input SI.ThermodynamicTemperature Ti[2] "температуры плавления чистых компонентов";
  input Boolean use_deltaH=false "=true функция будет проводить расчет q[i] на основе скрытые теплоты перехода жидкость−твердое тело в чистых компонентах" annotation(Dialog(enable = true, tab = "General", group = "Parameters"));

  output Real q[2] "Коэффициенты уравнения зависящие от химических потенциалов компонентов вещества в твердой и жидкой фазах";

  protected
  SI.ThermodynamicTemperature T = 1 "Температура системы";
  Real x "мольная доля первого компонента";
  Real W "Аналог энергии смешения в обобщенной решеточной модели";
  Real lamda=omega[1]/omega[2] "";
  
  algorithm
   for i in {1, 2} loop
    q[i] := if use_deltaH then deltaH[i]/(MC.R*T)  else 0;
    end for;
   // omega[1] := grad(mu0[1]);
  
  annotation(Icon, Diagram, Documentation(info="<html>
 <p> Реализация данной функции основана на статье \"Термодинамика бинарных растворов эвтектического типа с промежуточными фазами постоянного состава\", Автор М.А. Захаров, Новгородский государственный университет им. Ярослава Мудрого,
173003 Великий Новгород, Россия E-mail: theorphy@novsu.ac.ru, напечатнанной в журнале \"Физика твердого тела, 2007, том 49, вып. 12\"
<p> Для рассматриваемого типа диаграмм существенно то, что из-за отсутствия растворимости компонентов в твердом состоянии их химические потенциалы в твердых фазах не зависят от состава (концентраций)и, следовательно, совпадают с соответствующими стандартными значениями, т. е. μ1sol = μ10sol и μ2sol = μ20sol.
<br>Учитывая химическое равновесие в двухфазной и трехвазной системе, т.е. в твердой и жидкой фазах легко получить концентрационные зависимости правой и левой ветвей ликвидуса диаграммы бинарной системы с простой эвтектикой в рамках обобщенной решеточной модели.
  </html>"));
end Phase_state;

  SI.Velocity v = 1 "Mean velocity of fluid flow";
  SI.Density rho = 999.8 "Fluid density";
  SI.DynamicViscosity mu = 1.787 "Dynamic (absolute) viscosity";
  SI.Length D = 1 "Characteristic dimension (hydraulic diameter of pipes)"; 

Real Res "Результат";
Real Res_2[2] "Результат 2";

 equation
 
   Res = Sygma_sloy(v,rho,mu,D);
   print ("Level of Sygma = "+String(Res));
  // Res = Phase_state ();
  Res_2 = Phase_state({1.0,2.0},{0.4,0.2},{1.0,0.0},{21.1,22.3});
  

  annotation(Icon, Diagram);
end Phase_model;