within Seneca.Condenser;

model BaseCondenser
  import Modelica.Fluid.Types.ModelStructure;
  import Modelica.Fluid.Pipes.BaseClasses;
  import Modelica.SIunits;
  import Modelica.Constants;
  // extending PartialStraightPipe
  extends Modelica.Fluid.Pipes.BaseClasses.PartialStraightPipe(final port_a_exposesState = modelStructure == ModelStructure.av_b or modelStructure == ModelStructure.av_vb, final port_b_exposesState = modelStructure == ModelStructure.a_vb or modelStructure == ModelStructure.av_vb);
  Common.SulfurPort_b sulfurPort_b1 annotation(Placement(visible = true, transformation(origin = {90, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  replaceable model HeatTransfer = Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.IdealFlowHeatTransfer constrainedby Modelica.Fluid.Pipes.BaseClasses.HeatTransfer.PartialFlowHeatTransfer "Теплообмен между стенками конденсатора и газом" annotation(Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* Для расчета толщины вязкого полслоя в соответствии с http://studopedia.ru/2_122985_gidravlicheski-gladkie-i-sherohovatie-trubi.html
                                                                                                           введем параметр, которые необходимо будет определить для материала, из которого сделан конденсатор (точнее внутренняя поверхность
                                                                                                           
                                                                                                           При этом для эквивалентной шероковатости принимается значение по умолчанию как для новых стальных сварных труб (максимальный уровень)
                                                                                                           */
  parameter Real delta_ekv(start = 0.1, unit = "mm") "Эквивалентная шероховатость" annotation(Dialog(tab = "Ограничение", group = "Вязкость потока"));
  parameter SI.Length D "Характеристика размерности (гидравлический диаметр трубы или отверстие)" annotation(Dialog(tab = "Ограничение", group = "Вязкость потока"));
  parameter SI.Diameter diameter "Диаметр конденсатора" annotation(Dialog(group = "Геометрия", enable = isCircular));
  Real Re_skin_layer "Число Рейнольдска для вязкого подслоя";
  Real Re_main_layer "Число Рейнольдска для основного центрального слоя";
  /*
                                                                              расчетные переменные, которые ввел Андрей Кругликов. Перенесены из его модели
                                                                              Зона два
                                                                              */
  // extends Pipe;
  // Объявление потока
  //Gas_Flow fl = in_condenser_II.mf;
  //Gas_Flow F[n, k];
  SIunits.Temperature T0 = Medium.T "Температура на входе в конденсатор (первая зона)";
  SIunits.Pressure P0 = Medium.P "Давление на входе в конденсатор (первая зона)";
  parameter Real v "Скорость потока на входа в конденсатор";
  parameter Real Tf = 120;
  parameter Real Th = 120;
  //deg C
  constant Real a = 0.036 * 4184 / 3600;
  //J/(hmK)
  constant Real Cp_h20 = 1.02 * 1000;
  constant Real Cp_so2 = 0.66 * 1000;
  constant Real Cp_h20 = 1.9 * 1000;
  constant Real Cp_n2 = 1.04 * 1000;
  constant Real Cp_h2 = 14.2 * 1000;
  constant Real Cp_co = 1.04 * 1000;
  constant Real Cp_co2 = 0.91 * 1000;
  constant Real Cp_cos = 45 / 60 * 1000;
  constant Real Cp_cs2 = 49 / 72 * 1000;
  constant Real Cp_s = 627;
  //J/kgK энатальпии для соединений (перерарботать на стандартную базу
  constant Real H_h20 = -241.82 / 18;
  constant Real H_so2 = -296.9 / 64;
  constant Real H_h2s = -20.9 / 34;
  constant Real H_s = 278.8 / 32;
  constant Real H_co = -110.5 / 28;
  constant Real H_co2 = -393.5 / 44;
  constant Real H_cs2 = 116.7 / 76;
  constant Real H_n2 = 0;
  constant Real H_h2 = 0;
  constant Real H_cos = -141.7 / 60;
  //J/kg
  constant Real Cp = 0.294 * 4184;
  //J/(kgK)
  constant Real dense = 0.77;
  //kg/m^3
  parameter Real L = 6100 "Полная длина конденсатора";
  //mm
  parameter Real D = 5 / 100000;
  //m^2/s
  parameter Real DT = 1 / 1000000;
  //
  parameter Real DP = 1 / 1000000;
  //
  parameter Real dL = 10;
  parameter Integer n = 610;
  parameter Real R = 1300;
  parameter Real dR = 10;
  parameter Integer k = 130;
  Vector jg[n, k];
  Vector jd[n, k, 10];
  Vector i[n, k, 10];
  Vector J[n, k];
  Vector jf[n, k];
  Real q1[n, k];
  Real M[n, k];
  Real Mf;
  Real T_out;
  /*
                                                                              расчетные переменные, которые ввел Андрей Кругликов. Перенесены из его модели
                                                                              Зона три
                                                                              */
  Integer n = 610;
  Integer k = 130;
  Real j[n, k, 10] = in_condenser_III.J;
  // закоментированно, так как не все части объединили в один класс
  //SIunits.Temperature T0 = Medium.T "Температура в центральной части конденсатора";
  //SIunits.Pressure P0 = Medium.P "Давление в ";
  Real q[i, j];
  Real u;
  Real Q "Количество тепла, которое отводится от рубашки конденсатора";
  Real M "Количество серы, которое высаживается";
  constant Real plq = 1791.3;
  constant Real pv = 0.862;
  constant Real uv = 8.163 / 10000;
  parameter Real l = 1.9;
  parameter Real h = 1.45;
  parameter Real w = 1;
  final constant SI.Acceleration g = Constants.g_n "Ускорение свободного падения 9.8 m/c";
  parameter Integer n = 10;
  Real jf;
  Modelica.Fluid.Interfaces.HeatPorts_a heatPorts_a annotation(Placement(visible = true, transformation(origin = {8.88178e-16, 55}, extent = {{-10, -7}, {10, 7}}, rotation = 0), iconTransformation(origin = {-1, 54}, extent = {{-11, -10}, {11, 10}}, rotation = 0)));
equation
  connect(HeatTransfer.heatPorts[1], heatPorts_a) annotation(Line(points = {{-50, 27}, {0, 27}, {0, 50}, {0, 50}}, color = {127, 0, 0}));
  //Первая зона конденсатора. расчет колчества осажденной серы и оставшегося газа
  //Вторая зона конденсатора. расчет колчества осажденной серы и оставшегося газа
  //n=L/dL;
  q = 0;
  Mf = 0;
  T_out = 0;
  for i in 1:n loop
    for j in 1:k loop
      F.mass_flow[i, j] = fl.mass_flow / n / k;
      F.h2s[i, j] = fl.h2s / n / k;
      F.so2[i, j] = fl.so2 / n / k;
      F.h2o[i, j] = fl.h2o / n / k;
      F.o2[i, j] = fl.o2 / n / k;
      F.n2[i, j] = fl.n2 / n / k;
      F.h2[i, j] = fl.h2 / n / k;
      F.co[i, j] = fl.co / n / k;
      F.co2[i, j] = fl.co2 / n / k;
      F.cos[i, j] = fl.cos / n / k;
      F.cs2[i, j] = fl.cs2 / n / k;
      F.ch4[i, j] = fl.ch4 / n / k;
      F.c2h6[i, j] = fl.c2h6 / n / k;
      F.c3h8[i, j] = fl.c3h8 / n / k;
      F.ic4h10[i, j] = fl.ic4h10 / n / k;
      F.nc4h10[i, j] = fl.nc4h10 / n / k;
      F.ic5h12[i, j] = fl.ic5h12 / n / k;
      F.nc5h12[i, j] = fl.nc5h12 / n / k;
      F.c6[i, j] = fl.c6 / n / k;
      F.mdea[i, j] = fl.mdea / n / k;
      F.nh3[i, j] = fl.nh3 / n / k;
      F.s1[i, j] = 0;
      F.s2[i, j] = 0;
      F.s3[i, j] = 0;
      F.s4[i, j] = 0;
      F.s5[i, j] = 0;
      F.s6[i, j] = 0;
      F.s7[i, j] = 0;
      F.s8[i, j] = (fl.mass_flow * fl.s1 + fl.mass_flow * fl.s2 + fl.mass_flow * fl.s3 + fl.mass_flow * fl.s4 + fl.mass_flow * fl.s5 + fl.mass_flow * fl.s6 + fl.mass_flow * fl.s7 + fl.mass_flow * fl.s8) / fl.mass_flow / n / k;
      T[i, j] = T;
      T[i, k] = Th;
      //на границе
      P[i, j] = P;
      J.x[i, j] = 0;
      J.y[i, j] = 0;
    end for;
  end for;
  for i in 1:n - 1 loop
    for j in 1:k - 1 loop
      der(T[i, j]) = a * ((2 * T[i, j] - T[i - 1, j] - T[i + 1, j]) / dL ^ 2 + 1 / (dR * j) * (T[i, j + 1] - T[i, j]) / dR + (2 * T[i, j] - T[i, j - 1] - T[i, j + 1]) / dR ^ 2);
      for ii in i:i + 1 loop
        for jj in j:j + 1 loop
          jd.x[ii, jj, 1] = -dense * (D * (F.h2s[ii + 1, jj] - F.h2s[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 2] = -dense * (D * (F.so2[ii + 1, jj] - F.so2[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 3] = -dense * (D * (F.h2o[ii + 1, jj] - F.h2o[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 4] = -dense * (D * (F.n2[ii + 1, jj] - F.n2[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 5] = -dense * (D * (F.h2[ii + 1, jj] - F.h2[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 6] = -dense * (D * (F.co[ii + 1, jj] - F.co[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 7] = -dense * (D * (F.co2[ii + 1, jj] - F.co2[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 8] = -dense * (D * (F.cos[ii + 1, jj] - F.cos[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 9] = -dense * (D * (F.cs2[ii + 1, jj] - F.cs2[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.x[ii, jj, 10] = -dense * (D * (F.s8[ii + 1, jj] - F.s8[ii, jj]) / dL + DT / T[ii, jj] * (T[ii + 1, jj] - T[ii, jj]) / dL + DP / P[ii, jj] * (P[ii + 1, jj] - P[ii, jj]) / dL);
          jd.y[ii, jj, 1] = -dense * (D * (F.h2s[ii, jj + 1] - F.h2s[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 2] = -dense * (D * (F.so2[ii, jj + 1] - F.so2[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 3] = -dense * (D * (F.h2o[ii, jj + 1] - F.h2o[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 4] = -dense * (D * (F.n2[ii, jj + 1] - F.n2[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 5] = -dense * (D * (F.h2[ii, jj + 1] - F.h2[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 6] = -dense * (D * (F.co[ii, jj + 1] - F.co[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 7] = -dense * (D * (F.co2[ii, jj + 1] - F.co2[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 8] = -dense * (D * (F.cos[ii, jj + 1] - F.cos[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 9] = -dense * (D * (F.cs2[ii, jj + 1] - F.cs2[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jd.y[ii, jj, 10] = -dense * (D * (F.s8[ii, jj + 1] - F.s8[ii, jj]) / dR + DT / T[ii, jj] * (T[ii, jj + 1] - T[ii, jj]) / dR + DP / P[ii, jj] * (P[ii, jj + 1] - P[ii, jj]) / dR);
          jg[ii, jj] = dense * v;
        end for;
      end for;
      for ii in i:i + 1 loop
        for jj in j:j + 1 loop
          for z in 1:10 loop
            i[ii, jj, 1] = H_h2s + Cp_h2s * (T0 - T[ii, jj]);
            i[ii, jj, 2] = H_so2 + Cp_so2 * (T0 - T[ii, jj]);
            i[ii, jj, 3] = H_h2o + Cp_h2o * (T0 - T[ii, jj]);
            i[ii, jj, 4] = H_n2 + Cp_n2 * (T0 - T[ii, jj]);
            i[ii, jj, 5] = H_h2 + Cp_h2 * (T0 - T[ii, jj]);
            i[ii, jj, 6] = H_co + Cp_co * (T0 - T[ii, jj]);
            i[ii, jj, 7] = H_co2 + Cp_co2 * (T0 - T[ii, jj]);
            i[ii, jj, 8] = H_cos + Cp_cos * (T0 - T[ii, jj]);
            i[ii, jj, 9] = H_cs2 + Cp_cs2 * (T0 - T[ii, jj]);
            i[ii, jj, 10] = H_s + Cp_s * (T0 - T[ii, jj]);
            J.x[ii, jj] = J.x[ii, jj] + (jd.x[ii, jj, z] + jg[ii, jj]) * i[ii, jj, z];
            J.y[ii, jj] = J.y[ii, jj] + jd.y[ii, jj, z] * i[ii, jj, z];
            jf.x[ii, jj, z] = jd.x[ii, jj, z] + jg[ii, jj];
            jf.y[ii, jj, z] = jd.y[ii, jj, z];
          end for;
        end for;
      end for;
      dense * Cp * der(T[i, j]) = a * ((2 * T[i, j] - T[i - 1, j] - T[i + 1, j]) / dL ^ 2 + (2 * T[i, j] - T[i, j - 1] - T[i, j + 1]) / dR ^ 2) - ((J.x[i + 1, j] - J.x[i, j]) / dL + (J.y[i, j + 1] - J.y[i, j]) / dR);
      dense * der(F.h2s[i, j]) = -((jf.x[i + 1, j, 1] - jf.x[i, j, 1]) / dL + (jf.y[i, j + 1, 1] - jf.y[i, j, 1]) / dR);
      dense * der(F.so2[i, j]) = -((jf.x[i + 1, j, 2] - jf.x[i, j, 2]) / dL + (jf.y[i, j + 1, 2] - jf.y[i, j, 2]) / dR);
      dense * der(F.h2o[i, j]) = -((jf.x[i + 1, j, 3] - jf.x[i, j, 3]) / dL + (jf.y[i, j + 1, 3] - jf.y[i, j, 3]) / dR);
      dense * der(F.n2[i, j]) = -((jf.x[i + 1, j, 4] - jf.x[i, j, 4]) / dL + (jf.y[i, j + 1, 4] - jf.y[i, j, 4]) / dR);
      dense * der(F.h2[i, j]) = -((jf.x[i + 1, j, 5] - jf.x[i, j, 5]) / dL + (jf.y[i, j + 1, 5] - jf.y[i, j, 5]) / dR);
      dense * der(F.co[i, j]) = -((jf.x[i + 1, j, 6] - jf.x[i, j, 6]) / dL + (jf.y[i, j + 1, 6] - jf.y[i, j, 6]) / dR);
      dense * der(F.co2[i, j]) = -((jf.x[i + 1, j, 7] - jf.x[i, j, 7]) / dL + (jf.y[i, j + 1, 7] - jf.y[i, j, 7]) / dR);
      dense * der(F.cos[i, j]) = -((jf.x[i + 1, j, 8] - jf.x[i, j, 8]) / dL + (jf.y[i, j + 1, 8] - jf.y[i, j, 8]) / dR);
      dense * der(F.cs2[i, j]) = -((jf.x[i + 1, j, 9] - jf.x[i, j, 9]) / dL + (jf.y[i, j + 1, 9] - jf.y[i, j, 9]) / dR);
      dense * der(F.s8[i, j]) = -((jf.x[i + 1, j, 10] - jf.x[i, j, 10]) / dL + (jf.y[i, j + 1, 10] - jf.y[i, j, 10]) / dR);
      q1[i, j] = jf.y[i, j, 10] * r;
      q = q + q1[i, j];
      der(M[i, j]) = 2 * pi * R * L * jf.y[i, j, 10];
      Mf = Mf + M[i, j];
      T_out = T_out + T[i, j];
    end for;
  end for;
  T_out = T_out / n / k;
  der(Q) = q * 2 * pi * L * R;
  Qf = Q + Cp * (Tf - T0);
  out_condenser_II.T = T_out;
  out_condenser_II.P = P0;
  fl.h2s = fl.mass_flow * fl.h2s / (fl.mass_flow - Mf);
  fl.so2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.h2o = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.o2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.n2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.h2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.co = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.co2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.cos = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.cs2 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.ch4 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.c2h6 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.c3h8 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.ic4h10 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.nc4h10 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.ic5h12 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.nc5h12 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.c6 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.mdea = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.nh3 = fl.mass_flow * fl.so2 / (fl.mass_flow - Mf);
  fl.s1 = 0;
  fl.s2 = 0;
  fl.s3 = 0;
  fl.s4 = 0;
  fl.s5 = 0;
  fl.s6 = 0;
  fl.s7 = 0;
  fl.s8 = (fl.s8 * fl.mass_flow - Mf) / (mass_flow - Mf);
  fl.mass_flow = fl.mass_flow - Mf;
  out_condenser_II.mf = fl;
  out_condenser_II.J = jf.x;
  Qb_flows = heatTransfer.Q_flows;
  //Третья зона конденсатора. расчет колчества осажденной серы и оставшегося газа
  Q = 0;
  jf = 0;
  for i in 1:n loop
    for j in 1:k loop
      q[i, j] = j[i, j, 10] * r;
      jf = jf + j[i, j, 10];
    end for;
  end for;
  u = g * (plq - pv) / 4 / uv * d ^ 2;
  w * h * jf - l * d * plq * u = h * l * plq * der(d);
  der(M) = l * n * d * plq * d;
  port_b.m_flow = F "Количество кислого газа, которое осталось после осаждения серы";
  sulfurPort_b1.m_flow = M "Количество серы, которое высаживается";
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(fillColor = {255, 204, 102}, fillPattern = FillPattern.Cross, extent = {{-100, 60}, {100, -60}}), Polygon(origin = {24.78, 80}, lineColor = {0, 128, 255}, fillColor = {0, 128, 255}, fillPattern = FillPattern.Solid, points = {{-14.7774, 20}, {15.2226, 0}, {-14.7774, -20}, {-14.7774, -20}, {-14.7774, 20}}), Polygon(origin = {19.76, 80}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-9.75725, 12}, {10.2428, 0}, {-9.75725, -12}, {-9.75725, 12}}), Line(origin = {-12, 80}, points = {{-50, 0}, {50, 0}}, color = {0, 128, 255}, thickness = 2, arrowSize = 6), Polygon(origin = {46.78, -86}, lineColor = {255, 204, 102}, fillColor = {255, 204, 102}, fillPattern = FillPattern.Solid, points = {{-26.7774, 18}, {15.2226, 0}, {-26.7774, -18}, {-26.7774, -18}, {-26.7774, 18}}), Polygon(origin = {29.76, -86}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-9.75725, 12}, {10.2428, 0}, {-9.75725, -12}, {-9.75725, 12}}), Line(origin = {8, -86}, points = {{-68, 0}, {50, 0}}, color = {255, 204, 102}, thickness = 2, arrowSize = 6), Text(extent = {{-100, 60}, {100, -60}}, textString = "Condenser
%name", fontSize = 100)}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2}), graphics = {Rectangle(origin = {0, 54}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-100, 6}, {100, -6}}), Rectangle(origin = {0, -56}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Forward, extent = {{-100, 6}, {100, -6}}), Line(origin = {-100, 75}, points = {{0, 5}, {0, -15}}, pattern = LinePattern.Dash, thickness = 0.5), Line(origin = {-50, 75}, points = {{0, 5}, {0, -15}}, pattern = LinePattern.Dash, thickness = 0.5), Line(origin = {50, 75}, points = {{0, 5}, {0, -15}}, pattern = LinePattern.Dash, thickness = 0.5), Line(origin = {100, 75}, points = {{0, 5}, {0, -15}}, pattern = LinePattern.Dash, thickness = 0.5), Line(origin = {-75, 76}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dot, arrow = {Arrow.Filled, Arrow.Filled}), Line(origin = {75, 76}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dot, arrow = {Arrow.Filled, Arrow.Filled}), Line(origin = {-25, 76}, points = {{-25, 0}, {75, 0}}, pattern = LinePattern.Dot, arrow = {Arrow.Filled, Arrow.Filled}), Rectangle(origin = {-75, -1}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-25, 49}, {25, -49}}), Rectangle(origin = {75, -1}, fillColor = {204, 204, 204}, fillPattern = FillPattern.Solid, lineThickness = 0, extent = {{-25, 49}, {25, -49}}), Text(origin = {59, -94}, lineColor = {0, 128, 255}, extent = {{-39, 4}, {39, -4}}, textString = "ModelStructure av_vb")}));
end BaseCondenser;