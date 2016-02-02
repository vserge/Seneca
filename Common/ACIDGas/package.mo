within Seneca.Common;

package ACIDGas "Определение проектной смеси для установки по очистке серы"
  //import Modelica.Icons;
  extends Modelica.Icons.MaterialPropertiesPackage;

  import Modelica.Media.IdealGases.Common.MixtureGasNasa;
  import SGD=Modelica.Media.IdealGases.Common.SingleGasesData;
  import FD=Modelica.Media.IdealGases.Common.FluidData;
 // redeclare replaceable package Medium=Modelica.Media.IdealGases.Common.MixtureGasNasa (mediumName = "ACIDGas", data = {SGD.H2S, SGD.SO2, SGD.H2O, SGD.O2, SGD.N2, SGD.H2, SGD.CO, SGD.CO2, SGD.COS, SGD.CS2, SGD.CH4, SGD.C2H6, SGD.C3H8, SGD.C4H10_isobutane, SGD.C4H10_n_butane, SGD.C5H12_i_pentane, SGD.NC3H12, SGD.NH3, SGD.S, SGD.S2, SGD.S3, SGD.S4, SGD.S5, SGD.S6, SGD.S7, SGD.S8}, fluidConstants = {FD.H2S, FD.SO2, FD.H2O, FD.O2, FD.N2, FD.H2, FD.CO, FD.CO2, FD.COS, FD.CS2, FD.CH4, FD.C2H6, FD.C3H8, FD.C4H10_isobutane, FD.C4H10_n_butane, FD.C5H12_i_pentane, FD.NC3H12, FD.NH3, FD.S, FD.S2, FD.S3, FD.S4, FD.S5, FD.S6, FD.S7, FD.S8}, substanceNames = {"H2S", "SO2,", "H2O", "O2", "N2", "H2", "CO", "CO2", "COS", "CS2", "CH4", "C2H6", "C3H8", "C4H10_isobutane", "C4H10_n_butane", "C5H12_i_pentane", "NH3", "S", "S2", "S3", "S4", "S5", "S6", "S7", "S8"}, reference_X = {0.0, 0.0, 0.0, 0.232, 0.768, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, excludeEnthalpyOfFormation = false);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), Documentation(info = "<html>
<p>
Настоящая модель описывает все компоненты кислого газа на всех устройствах установки, который подается на установку.
H2S, SO2, H2O, O2, N2, H2, CO, CO2, COS, CS2, CH4, C2H6, C3H8, iC4H10, nC4H10, iC5H12, NH3, S, S2, S3, S4, S5, S6, S7, S8
<br>
<b>Примечание:</b> Вещество MDEA и S1 не описаны, так как по ним не были найдены термодинамические свойства.


Весь этот поток контролируется и анализируется на все устройствах опытной установки
</p>
</html>"));
end ACIDGas;