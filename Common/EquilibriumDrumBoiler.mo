within Seneca.Common;
/*
Модель взята из примера Modelica.Fluid.Examples.DrumBoiler и доработана с учетом потребностей задачи построения модели по очистке серы
*/
model EquilibriumDrumBoiler
  "Простейший испаритель с двумя состояними, см. Astroem, Bell: Drum-boiler dynamics, Automatica 36, 2000, pp.363-378"
  extends Modelica.Fluid.Interfaces.PartialTwoPort(
    final port_a_exposesState=true,
    final port_b_exposesState=true,
    redeclare replaceable package Medium =
        Modelica.Media.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium);
  import Modelica.Constants;
  import Modelica.Fluid.Types;

  parameter SI.Mass m_D "Масса оболочки испарителя (барабана)";
  parameter Medium.SpecificHeatCapacity cp_D "удельная теплоемкость металла испарителя (барабана)";
  parameter SI.Volume V_t "Общий объем внутри испарителя";
  parameter Medium.AbsolutePressure p_start=system.p_start "Начальное значение давления" annotation(Dialog(tab = "Initialization"));
  parameter SI.Volume V_l_start=V_t/2 "Начальное значение объема жидкости в испарителе volumeStart " annotation(Dialog(tab = "Initialization"));

  // Assumptions - Ограничения
  parameter Boolean allowFlowReversal = system.allowFlowReversal
    "Возможность обратного тока, false ограничено исходя из проектного направления (port_a -> port_b)"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);
  parameter Types.Dynamics energyDynamics=system.energyDynamics
    "Определение энергетического баланса"
    annotation(Evaluate=true, Dialog(tab = "Assumptions", group="Dynamics"));
  parameter Types.Dynamics massDynamics=system.massDynamics
    "Определение массового баланса"
    annotation(Evaluate=true, Dialog(tab = "Assumptions", group="Dynamics"));

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort "Порт подведения тепла"
  annotation (Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=
           0)));
  Modelica.Blocks.Interfaces.RealOutput V "Объем жидкости"
  annotation (Placement(transformation(
        origin={40,110},
        extent={{-10,-10},{10,10}},
        rotation=90)));

  Medium.SaturationProperties sat
    "Вектор состояния для вычисления свойств насыщенности пара";
  Medium.AbsolutePressure p(start=p_start, stateSelect=StateSelect.prefer)
    "давление внутри испарителя";
  Medium.Temperature T "температура внутри испарителя";
  SI.Volume V_v "объем жидкости в парообразом состоянии";
  SI.Volume V_l(start=V_l_start, stateSelect=StateSelect.prefer)
    "объем жидкости в жидком состоянии";
  Medium.SpecificEnthalpy h_v=Medium.dewEnthalpy(sat)
    "удельная энтальпия пара";
  Medium.SpecificEnthalpy h_l=Medium.bubbleEnthalpy(sat)
    "удельная энтальпия жидкости";
  Medium.Density rho_v=Medium.dewDensity(sat) "плотность парообразной фазы";
  Medium.Density rho_l=Medium.bubbleDensity(sat) "плотность жидкой фазы";
  SI.Mass m "Общая масса испарителя";
  SI.Energy U "внутренняя энергия";
  Medium.Temperature T_D=heatPort.T "температура испарителя (барабана)";
  SI.HeatFlowRate q_F=heatPort.Q_flow "уровень потока тепла от теплоисточника";
  Medium.SpecificEnthalpy h_W=inStream(port_a.h_outflow)
    "Энтальпия подачи воды (удельная энтальпия на выходе из порта питательной воды, когда масса втекает к бойлер)";
  Medium.SpecificEnthalpy h_S=inStream(port_b.h_outflow)
    "энтальпия пара (удельная энтальпия прямо перед паровом портом, когда масса вытекает из бойлера)";
  SI.MassFlowRate qm_W=port_a.m_flow "скорость потока воды";
  SI.MassFlowRate qm_S=port_b.m_flow "скокрость потока пара";
/*outer Modelica.Fluid.Components.FluidOptions fluidOptions
"Определение глобальных параметров потока";*/
equation
// Уравнение баланса
  m = rho_v*V_v + rho_l*V_l + m_D "Общаяя масса";
  U = rho_v*V_v*h_v + rho_l*V_l*h_l - p*V_t + m_D*cp_D*T_D "Общая энергия";
  if massDynamics == Types.Dynamics.SteadyState then
    0 = qm_W + qm_S "Массовый баланс устойчивого состояния";
  else
    der(m) = qm_W + qm_S "Баланс массы в динамическом состоянии";
  end if;
  if energyDynamics == Types.Dynamics.SteadyState then
    0 = q_F + port_a.m_flow*actualStream(port_a.h_outflow)
            + port_b.m_flow*actualStream(port_b.h_outflow)
      "Энергетический баланс устойчивого состояния";
  else
    der(U) = q_F
            + port_a.m_flow*actualStream(port_a.h_outflow)
            + port_b.m_flow*actualStream(port_b.h_outflow)
      "Энергетический баланс в динамическом состоянии";
  end if;
  V_t = V_l + V_v;

// Свойства влажной жидкости и пара
  sat.psat = p;
  sat.Tsat = T;
  sat.Tsat = Medium.saturationTemperature(p);

// идеальная теплопередача между металлом и водой
  T_D = T;

// граничные условия в портах
  port_a.p = p;
  port_a.h_outflow = h_l;
  port_b.p = p;
  port_b.h_outflow = h_v;

// Объем жидкости
  V = V_l;

// Проверка, что двухфазное равновесие фактически возможно
  assert(p < Medium.fluidConstants[1].criticalPressure - 10000,
    "Модель испарителя требует докритического давления");
initial equation
// Начальные условия
  // Примечание: p представляет энергию так как она зависит от  T_sat
  if energyDynamics == Types.Dynamics.FixedInitial then
    p = p_start;
  elseif energyDynamics == Types.Dynamics.SteadyStateInitial then
    der(p) = 0;
  end if;

  if massDynamics == Types.Dynamics.FixedInitial then
    V_l = V_l_start;
  elseif energyDynamics == Types.Dynamics.SteadyStateInitial then
    der(V_l) = 0;
  end if;

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,64},{100,-64}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Backward,
          fillColor={135,135,135}),
        Rectangle(
          extent={{-100,-44},{100,44}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,255,255}),
        Rectangle(
          extent=DynamicSelect({{-100,-44},{100,44}},
                               {{-100,-44},{(-100 + 200*V_l/V_t),44}}),
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255}),
        Ellipse(
          extent={{18,0},{48,-29}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-1,29},{29,0}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{43,31},{73,2}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-31,1},{-1,-28}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{50,15},{80,-14}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-72,25},{-42,-4}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{71,-11},{101,-40}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{72,28},{102,-1}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{71,40},{101,11}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{0,-64},{0,-100}}, color={191,0,0}),
        Line(points={{40,100},{40,64}},   color={0,0,127}),
        Ellipse(
          extent={{58,-11},{88,-40}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{71,1},{101,-28}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),
    Documentation(revisions="<html>
<ul>
<li><i>Jan 2016</i>
by Serge Volkov:<br>
 Adapt model for sulfur project</li>
<li><i>Dec 2008</i>
by R&uuml;diger Franke:<br>
 Adapt initialization to new Types.Dynamics</li>
<li><i>2 Nov 2005</i>
by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
 Initialization options fixed</li>
<li><i>6 Sep 2005</i><br>
Model by Ruediger Franke<br>
See Franke, Rode, Krueger: On-line Optimization of Drum Boiler Startup, 3rd International Modelica Conference, Linkoping, 2003.<br>
Modified after the 45th Design Meeting</li>
</ul>
</html>",     info="<html>
<p>
Модель простого испарителя с двумя состояниями. Модель принимает двухфазное равновесие в компоненте; влажный пар выходит из парового выхода.</p>
<p>
References: Astroem, Bell: Drum-boiler dynamics, Automatica 36, 2000, pp.363-378</p>
</html>"));
end EquilibriumDrumBoiler;