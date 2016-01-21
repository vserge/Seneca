within Seneca;

package Furnaces "Библиотека моделей печей (Версия 0.0.1)/Library of Sulfur Furnaces models (version 0.0.1)"
  extends Modelica.Icons.Package;

  class KlausFurnace "Печь Клауса"
    /*
                                                                                                                                                                                                                                  Для моделирования печи Клауса приняты следующие допущения:
                                                                                                                                                                                                                                  - Ввиду низких давлений газовая смесь принимается идеальным газом
                                                                                                                                                                                                                                  - Условия стационарного состояния (часть условий неизменны во времени)
                                                                                                                                                                                                                                  - Адиабатические условия, поскольку печь Клауса полностью изолирована от внешней среды стенкой и теплообменником 
                                                                                                                                                                                                                                  - Камера сгорания работает как plug flow reactor, поскольку число Пекле для печи больше 500
                                                                                                                                                                                                                                  - Игнорируется радиальная дисперсия, поскольку в пламени действуют турбулентные потоки
                                                                                                                                                                                                                                  - Для расчета изменения давления по изменению объема используется уравнение Гагена-Пуазейля
                                                                                                                                                                                                                                  */
    // Переменные уравнения Гагена-Пуазейля
    /* - Начиная с этой метки VSTART и до VEND метки временно закоментировано Волковым Сергеем

                                                                                                                                                                                                                                  	Real Cin "концентрация компонента на входе";
                                                                                                                                                                                                                                  	Real Fin "мольный расход компонента на входе;
                                                                                                                                                                                                                                  	Real Fout "мольный расход компонента на выходе";
                                                                                                                                                                                                                                  	Real Pr "измененное давление при реакции";
                                                                                                                                                                                                                                  	Real Pin "давление в печи на входе";
                                                                                                                                                                                                                                  	Real Tin "температура газовой смеси на входе";
                                                                                                                                                                                                                                  	Real Tr "температура печи при реакции";
                                                                                                                                                                                                                                  */
    //Расчетные характеристики
    //	Integer N "Количество слоев, на которые делим печ по длине";
    // VEND
    /*
                                                                                                                                                                                                                                  	Для моделирования печи Клауса приняты следующие допущения:
                                                                                                                                                                                                                                  	- Ввиду низких давлений газовая смесь принимается идеальным газом
                                                                                                                                                                                                                                  	- Условия стационарного состояния (часть условий неизменны во времени)
                                                                                                                                                                                                                                  	- Адиабатические условия, поскольку печь Клауса полностью изолирована от внешней среды стенкой и теплообменником 
                                                                                                                                                                                                                                  	- Камера сгорания работает как plug flow reactor, поскольку число Пекле для печи больше 500
                                                                                                                                                                                                                                  	- Игнорируется радиальная дисперсия, поскольку в пламени действуют турбулентные потоки
                                                                                                                                                                                                                                  	- Для расчета изменения давления по изменению объема используется уравнение Гагена-Пуазейля:
                                                                                                                                                                                                                                  	*/
    parameter Modelica.SIunits.Temperature Tsf = 400 "Уточнить температура фиксированная или зависит от состава";
    parameter ThermoSysPro.Units.PressureLossCoefficient Kf = 0.05 "Потери давления газа на выходе";
    parameter ThermoSysPro.Units.PressureLossCoefficient Ke = 1e4 "Коэффициент потери давления водяного пара";
    parameter Real etacomb = 1 "Эффективность сжигания (От 0 от 1)";
    parameter Modelica.SIunits.Power Wloss = 1e5 "Потери температуры";
    parameter Integer mode = 0 "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
    Modelica.SIunits.MassFlowRate Qea(start = 400) "Массовый расход воздуха на входе";
    Modelica.SIunits.AbsolutePressure Pea(start = 1e5) "Давление воздуха на входе";
    Modelica.SIunits.Temperature Tea(start = 400) "Температура воздуха на входе";
    Modelica.SIunits.SpecificEnthalpy Hea(start = 50e3) "Удельная энтальпия воздуха на входе";
    Modelica.SIunits.SpecificEnthalpy Hrair(start = 10e3) "Стандартная удельная энтальпия воздуха";
    Real XeaCO2(start = 0) "Массовая доля CO2 на входе";
    Real XeaH2O(start = 0.1) "Массовая доля H2O на входе";
    Real XeaO2(start = 0.21) "Массовая доля O2 на входе";
    Real XeaSO2(start = 0) "Масовая доля SO2 на входе";
    Real XeaN2(start = 0.79) "Массовая доля N2 на входе";
    Modelica.SIunits.MassFlowRate Qcomb(start = 5) "Массовый расход кислого газа";
    Modelica.SIunits.Temperature Tcomb(start = 300) "Температура кислого газа";
    Modelica.SIunits.SpecificEnthalpy Hcomb(start = 10e3) "Удельная энтальпия кислого газа";
    Modelica.SIunits.SpecificEnthalpy Hrcomb(start = 10e3) "Стандартная удельная энтальпия кислого газа";
    Real XCcomb(start = 0) "Массовая доля углерода-- является исходным переменным параметром, необходимо задать как переменные функции";
    Real XHcomb(start = 0) "Массовая доля водорода";
    Real XOcomb(start = 0) "Массовая доля кислорода";
    Real XScomb(start = 0) "Массовая доля серы";
    Real RCOcomb(start = 0) "Фракция углерода образующая CO";
    Real RH2comb(start = 0.056) "Фракция H2S распадющаяся на H2 и S";
    Real RCOScomb(start = 0) "Фракция входящего углерода образующая COS";
    Real RCS2(start = 0) "Фракция входящих углеводородов образующих CS2";
    Real RS(start = 0) "Фракция входящего H2S образующая эелементарную S";
    Real AH2S(start = 0) "Мольная доля H2S в кислом газе на входе -- Является переменным исходным параметром ";
    Real PCIcomb(start = 5e7) "Fuel PCI (J/kg)";
    Modelica.SIunits.SpecificHeatCapacity Cpcomb(start = 2000) "Удельная теплоемкость кислого газа";
    Modelica.SIunits.MassFlowRate Qe(start = 100) "Массовый расход водяного пара";
    Modelica.SIunits.AbsolutePressure Pee(start = 50e5) "Давление водяного пара на входе";
    Modelica.SIunits.AbsolutePressure Pse(start = 50e5) "Давление водяного пара на выходе";
    ThermoSysPro.Units.DifferentialPressure deltaPe(start = 1e5) "Потери давления водяного пара";
    Modelica.SIunits.Temperature Tse(start = 500) "Температура водяного пара на выходе";
    Modelica.SIunits.SpecificEnthalpy Hee(start = 400e3) "Удельная энтальпия водяного пара на входе";
    Modelica.SIunits.SpecificEnthalpy Hse(start = 400e3) "Удельная энтальпия водяного пара на выходе";
    Modelica.SIunits.Density rhoe(start = 998) "Средняя плотность водяного пара";
    Modelica.SIunits.MassFlowRate Qsf(start = 400) "Мольный расход технологического газа на выходе";
    Modelica.SIunits.AbsolutePressure Psf(start = 1e5) "Давление технологического газа на выходе";
    Modelica.SIunits.Temperature Tf(start = 1500) "Температура технологического газа после сгорания";
    Modelica.SIunits.SpecificEnthalpy Hsf(start = 50e3) "Удельная энтальпия технологического газа на выходе";
    Modelica.SIunits.SpecificEnthalpy Hf(start = 100e3) "Удельная энтальпия технологического газа после сгорания";
    Modelica.SIunits.SpecificEnthalpy Hrfum(start = 10e3) "Стандартная удельная энтальпия технологического газа";
    ThermoSysPro.Units.DifferentialPressure deltaPf(start = 1e3) "Потери давления в печи Клауса";
    Modelica.SIunits.Density rhof(start = 0.05) "Плотность технологического газа";
    Real XsfCO2(start = 0.2) "Массовая доля CO2 на выходе -- будут отличаться для кислого газа";
    Real XsfH2O(start = 0.15) "Массовая доля H2O на выходе -- будут отличаться на выходе";
    Real XsfO2(start = 0) "Массовая доля O2 на выходе";
    Real XsfSO2(start = 0) "Массовая доля SO2 на выходе";
    Real XsfH2S(start = 0) "Массовая доля H2S на выходе";
    Real XsfCO(start = 0) "Массовая доля CO на выходе";
    Real XsfCH4(start = 0) "Массовая доля CH4 на выходе";
    Real XsfN2(start = 0) "Массовая доля N2 на выходе";
    Real XsfS2(start = 0) "Массовая доля S2 на выходе";
    Real XsfH2(start = 0) "Массовая доля H2 на выходе";
    Real XsfCS2(start = 0) "Массовая доля CS2 на выходе";
    Real XsfCOS(start = 0) "Массовая доля COS на выходе";
    Modelica.SIunits.Power Wfuel(start = 5e8) "Fuel available power PCI??";
    Modelica.SIunits.Power Wtot(start = 5e8) "Сумма входящей энергии";
    Modelica.SIunits.Power Wboil(start = 5e9) "Энергия переданная теплообменнику";
    Real eta_boil(start = 90) "Эффективность теплообменника (%) ";
    Real exc(start = 1) "Соотношение воздуха при сжигании - необходимо задать как переменный параметр, меньше единицы";
    Real exc_air(start = 0.1) "Процент избытка воздуха";
    ThermoSysPro.Combustion.Connectors.FuelInlet Cfuel annotation(Placement(transformation(extent = {{-10, -90}, {10, -70}}, rotation = 0)));
    ThermoSysPro.FlueGases.Connectors.FlueGasesInlet Cair annotation(Placement(transformation(extent = {{-110, -72}, {-90, -52}}, rotation = 0)));
    ThermoSysPro.FlueGases.Connectors.FlueGasesOutlet Cfg annotation(Placement(transformation(extent = {{90, -72}, {110, -52}}, rotation = 0)));
    ThermoSysPro.WaterSteam.Connectors.FluidInlet Cws1 annotation(Placement(transformation(extent = {{-110, 50}, {-90, 70}}, rotation = 0)));
    ThermoSysPro.WaterSteam.Connectors.FluidOutlet Cws2 annotation(Placement(transformation(extent = {{90, 50}, {110, 70}}, rotation = 0)));
    ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pros annotation(Placement(transformation(extent = {{-100, 84}, {-80, 104}}, rotation = 0)));
    ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph prom annotation(Placement(transformation(extent = {{80, 84}, {100, 104}}, rotation = 0)));
  protected
    constant Real amC = 12.01115 "Атомная масса углерода";
    constant Real amH = 1.00797 "Атомная масса водорода";
    constant Real amO = 15.9994 "Атомная масса кислорода";
    constant Real amS = 32.064 "Атомная масса серы";
    constant Real amN = 14.0067 "Атомная масса азота";
    constant Real amH2S = amS + 2 * amH "Мол. масса сероводорода";
    constant Real CH4 = amC + 4 * amH "Мол. масса метана";
    constant Real amCO2 = amC + 2 * amO "Мол. масса углекислого газа";
    constant Real amCO = amC + amO "Мол. масса угарного газа";
    constant Real amCS2 = amC + 2 * amS "Мол. масса сероуглерода";
    constant Real amCOS = amC + amO + amS "Мол. масса тиокарбонила";
    constant Real amH2O = 2 * amH + amO "Мол. масса воды";
    constant Real amSO2 = amS + 2 * amO "Мол масса оксида серы(2)";
    constant Real teps = 1e-6 "Малое число??";
    parameter Real eps = 1.e-0 "Малое число уравнения потери давления??";
    Real XeaO2c(start = 0.21) "Промежуточная переменная для расчета массовой доли O2";
  equation
    /* Воздух на входе */
    Qea = Cair.Q;
    Pea = Cair.P;
    Tea = Cair.T;
    XeaCO2 = Cair.Xco2;
    XeaH2O = Cair.Xh2o;
    XeaO2 = Cair.Xo2;
    XeaSO2 = Cair.Xso2;
    XeaN2 = Cair.XN2;
    /* Кислый газ на входе */
    Qcomb = Cacidgas.Q;
    Tcomb = Cacidgas.T;
    XCcomb = Cacidgas.Xc;
    XHcomb = Cacidgas.Xh;
    XOcomb = Cacidgas.Xo;
    XScomb = Cacidgas.Xs;
    PCIcomb = Cfuel.LHV;
    Cpcomb = Cacidgas.cp;
    /* Тех. газ на выходе */
    Qsf = Cfg.Q;
    Psf = Cfg.P;
    Tsf = Cfg.T;
    XsfCO2 = Cfg.Xco2;
    XsfH2O = Cfg.Xh2o;
    XsfO2 = Cfg.Xo2;
    XsfSO2 = Cfg.Xso2;
    //XsfH2S = f//
    //XsfCO = f//
    //XsfCH4 = f//
    //XsfN2 = f//
    //XsfS2 = f//
    //XsfH2 = f//
    //XsfCS2 = f//
    //XsfCOS = f//
    /* Водяной пар на входе */
    Hee = Cws1.h;
    Pee = Cws1.P;
    Qe = Cws1.Q;
    /* Водяной пар на выходе */
    Cws2.h = Hse;
    Cws2.P = Pse;
    Cws2.Q = Qe;
    /* Обратное течение */
    0 = if Qe > 0 then Cws1.h - Cws1.h_vol else Cws2.h - Cws2.h_vol;
    /* Уравнение баланса массы для технологического газа */
    Qsf = Qea + Qcomb;
    /* Содержание CO2 в составе тех. газа */
    XsfCO2 * Qsf = Qea * XeaCO2 + Qcomb * XCcomb * amCO2 / amC;
    /* Содержание H2O в составе тех. газа */
    XsfH2O * Qsf = Qea * XeaH2O + Qcomb * XHcomb * (amH2O / 2) / amH;
    /* Содержание O2 в составе тех. газа */
    XsfO2 * Qsf = Qea * XeaO2c - Qcomb * amO * (2 * XCcomb / amC + 0.5 * XHcomb / amH + 2 * XScomb / amS) + Qcomb * XOcomb;
    /* Содержание SO2 в составе тех. газа */
    XsfSO2 * Qsf = Qea * XeaSO2 + Qcomb * XScomb * amSO2 / amS;
    /* Содержание H2S в составе тех. газа */
    /* Содержание CO в составе тех. газа */
    /* Содержание CH4 в составе тех. газа */
    /* Содержание N2 в составе тех. газа */
    /* Содержание S2 в составе тех. газа */
    /* Содержание H2 в составе тех. газа */
    /* Содержание CS2 в составе тех. газа */
    /* Содержание COS в составе тех. газа */
    /* Соотношение воздуха для сжигания */
    exc = Qea * (1 - XeaH2O) / (Qcomb * amO * (2 * XCcomb / amC + 0.5 * XHcomb / amH + 2 * XScomb / amS - XOcomb / amO) / (XeaO2c / (1 - XeaH2O)));
    /* Избыток воздуха */
    exc_air = (exc - 1) * 100;
    /* Потери давления тех. газа */
    Pea - Psf = deltaPf;
    deltaPf = Kf * ThermoSysPro.Functions.ThermoSquare(Qsf, eps) / rhof;
    /* Потери давления водяного пара */
    Pee - Pse = deltaPe;
    deltaPe = Ke * ThermoSysPro.Functions.ThermoSquare(Qe, eps) / rhoe;
    /* Удельная энтальпия кислого газа на входе */
    Hcomb = Cpcomb * Tcomb;
    /* Уравнение энергетического баланса для тех. газа */
    0 = Qsf * (Hf - Hrfum) + Wloss - (Qcomb * (Hcomb - Hrcomb + PCIcomb * etacomb) + Qea * (Hea - Hrair));
    /* Энергия кислого газа */
    Wacidgas = Qcomb * PCIcomb;
    /* Сумма входящей энергии */
    Wtot = Qcomb * (Hcomb - Hrcomb + PCIcomb * etacomb) + Qea * (Hea - Hrair);
    /* Энергия отданная теплоносителю */
    Wboil = Wtot - Qsf * (Hsf - Hrfum) - Wloss;
    /* Удельная энтальпия водяного пара на выходе */
    Hse = Wboil / Qe + Hee;
    /* Эффективность теплообменника */
    eta_boil = 100 * Wboil / Wfuel;
    /* Удельная энтальпия воздуха на входе */
    Hea = ThermoSysPro.Properties.FlueGases.FlueGases_h(Pea, Tea, XeaCO2, XeaH2O, XeaO2c, XeaSO2);
    /* Температура тех. газа после сгорания */
    // Изменение TechGas_T на TechGas_h приводит к дифференцируемой функции
    Hf = ThermoSysPro.Properties.FlueGases.FlueGases_h(Pea, Tf, XsfCO2, XsfH2O, XsfO2, XsfSO2);
    /* Удельная энтальпия тех. газа на выходе */
    Hsf = ThermoSysPro.Properties.FlueGases.FlueGases_h(Psf, Tsf, XsfCO2, XsfH2O, XsfO2, XsfSO2);
    /* Плотность тех. газа */
    rhof = ThermoSysPro.Properties.FlueGases.FlueGases_rho(Pea, (Tea + Tf) / 2, XsfCO2, XsfH2O, XsfO2, XsfSO2);
    0 = if XeaO2 > teps then XeaO2c - XeaO2 else XeaO2c - teps;
    /* Стандартные удельные энтальпии */
    Hrair = 2501.569e3 * XeaH2O;
    Hrcomb = 0;
    Hrfum = 2501.569e3 * XsfH2O;
    /* Термодинамические свойства водяного пара */
    prom = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph((Pee + Pse) / 2, (Hee + Hse) / 2, mode);
    rhoe = prom.d;
    pros = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pse, Hse, mode);
    Tse = pros.T;
    annotation(Diagram(graphics = {Rectangle(extent = {{-100, 80}, {100, -80}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{0, -42}, {12, -46}, {22, -34}, {26, -20}, {24, -6}, {22, 2}, {18, 12}, {14, 22}, {12, 30}, {10, 36}, {6, 54}, {2, 44}, {-2, 36}, {-6, 24}, {-6, 20}, {-8, 16}, {-10, 24}, {-12, 26}, {-14, 22}, {-18, 14}, {-20, 8}, {-24, 0}, {-26, -10}, {-28, -20}, {-28, -28}, {-22, -36}, {-18, -42}, {-8, -48}, {0, -42}}, lineColor = {255, 0, 128}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-8, -22}, {-6, -18}, {-2, -16}, {2, -16}, {6, -18}, {8, -20}, {10, -26}, {10, -30}, {8, -28}, {6, -24}, {4, -20}, {-2, -20}, {-4, -22}, {-8, -26}, {-10, -28}, {-10, -28}, {-8, -22}}, lineColor = {127, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}), Icon(graphics = {Rectangle(extent = {{-100, 80}, {100, -80}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-2, -42}, {10, -46}, {20, -34}, {24, -20}, {22, -6}, {20, 2}, {16, 12}, {12, 22}, {10, 30}, {8, 36}, {4, 54}, {0, 44}, {-4, 36}, {-8, 24}, {-8, 20}, {-10, 16}, {-12, 24}, {-14, 26}, {-16, 22}, {-20, 14}, {-22, 8}, {-26, 0}, {-28, -10}, {-30, -20}, {-30, -28}, {-24, -36}, {-20, -42}, {-10, -48}, {-2, -42}}, lineColor = {255, 0, 128}, fillColor = {255, 128, 0}, fillPattern = FillPattern.Solid), Polygon(points = {{-10, -24}, {-8, -20}, {-4, -18}, {0, -18}, {4, -20}, {6, -22}, {8, -28}, {8, -32}, {6, -30}, {4, -26}, {2, -22}, {-4, -22}, {-6, -24}, {-10, -28}, {-12, -30}, {-12, -30}, {-10, -24}}, lineColor = {127, 0, 0}, fillColor = {127, 0, 0}, fillPattern = FillPattern.Solid)}), Documentation(revisions = "<html>
  	<u><p><b>Authors</u> : </p></b>
  	<ul style='margin-top:0cm' type=disc>
  	<li>
  	    Osipov/Volkov/Kormakov </li>
  	</html>
  	", info = "<html>
  	<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
  	</HTML>
  	<html>
  	<p><b>ThermoSysPro Version 2.0</b></p>
  	</HTML>
  	"));
  end KlausFurnace;

  class FinalFurnace "Печь дожига"
  end FinalFurnace;
  annotation(vserion = "0.0.1", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})));
end Furnaces;