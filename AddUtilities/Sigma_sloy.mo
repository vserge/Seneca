function Sigma_sloy "Функция расчета толщины вязкого подслоя для турбулентного потока"
  import SI=Modelica.SIunits;
  import MC=Modelica.Constants;
  // ReynoldsNumber
  import Modelica.Fluid.Pipes.BaseClasses.CharacteristicNumbers.ReynoldsNumber;

  input SI.Velocity v "Mean velocity of fluid flow";
  input SI.Density rho "Fluid density";
  input SI.DynamicViscosity mu "Dynamic (absolute) viscosity";
  input SI.Length D "Characteristic dimension (hydraulic diameter of pipes)";
 
  /*
Enum index              Трубы                                 Δэкв, мм   
SteelWholeNew           Стальные цельнотянутые новые            0,02—0,05 
SteelWholeOld           То же, неновые (бывшие в эксплуатации)  0,15—0,3 
SteelWeldedNew          Стальные сварные новые                  0,04—0,1 
CastIronNew             Чугунные новые                          0,25—1 
CastIronSteelOld        Чугунные и стальные сварные неновые     0,8—1,5 
AsbestosCementNew       Асбестоцементные новые                  0,05-0,1 
AsbestosCementOld       То же, неновые                          0,6 
ConcreteIronConcrete            Бетонные и железобетонные               0,3—0,8 
  */
  
  type Pipes_types = enumeration(SteelWholeNew, SteelWholeOld, SteelWeldedNew, CastIronNew, CastIronSteelOld, AsbestosCementNew, AsbestosCementOld, ConcreteIronConcrete) "выбор типы трубы для рассчета коэффициента";
  Real DeltaEcv[Pipes_types] = {0.05, 0.3, 0.1, 1, 1.5, 0.1, 0.6, 0.8};
  Real RN = Modelica.Fluid.Pipes.BaseClasses.CharacteristicNumbers.ReynoldsNumber(v,rho,mu,D) "Вычисление числа Рейнольдса";
  Real Lyamda = 63/RN "Значение по умолчанию для ламинарного потока"; 
  output Real Sigma "толщины вязкого подслоя для турбулентного потока";
  
  equation
  // нужно определить как выбирать типы труб при вызове функции
   Lyamda=RN*(DeltaEcv[Pipe_types]/D);
  
   //sigma=(30*D)/(RN*sqrt(Lyamda);

  annotation(Icon, Diagram);
end Sigma_sloy;