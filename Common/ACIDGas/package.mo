within Seneca.Common;

package ACIDGas "Определение проектной смеси для установки по очистке серы"
  extends MixtureGasNasa(mediumName = "ACIDGas", data = {Common.SingleGasesData.H2S, Common.SingleGasesData.SO2, Common.SingleGasesData.H2O, Common.SingleGasesData.O2, Common.SingleGasesData.N2, Common.SingleGasesData.H2, Common.SingleGasesData.CO, Common.SingleGasesData.CO2, Common.SingleGasesData.COS, Common.SingleGasesData.CS2, Common.SingleGasesData.CH4, Common.SingleGasesData.C2H6, Common.SingleGasesData.C3H8, Common.SingleGasesData.C4H10_isobutane, Common.SingleGasesData.C4H10_n_butane, Common.SingleGasesData.C5H12_i_pentane, Common.SingleGasesData.NC3H12, Common.SingleGasesData.NH3, Common.SingleGasesData.S, Common.SingleGasesData.S2, Common.SingleGasesData.S3, Common.SingleGasesData.S4, Common.SingleGasesData.S5, Common.SingleGasesData.S6, Common.SingleGasesData.S7, Common.SingleGasesData.S8}, fluidConstants = {Common.FluidData.H2S, Common.FluidData.SO2, Common.FluidData.H2O, Common.FluidData.O2, Common.FluidData.N2, Common.FluidData.H2, Common.FluidData.CO, Common.FluidData.CO2, Common.FluidData.COS, Common.FluidData.CS2, Common.FluidData.CH4, Common.FluidData.C2H6, Common.FluidData.C3H8, Common.FluidData.C4H10_isobutane, Common.FluidData.C4H10_n_butane, Common.FluidData.C5H12_i_pentane, Common.FluidData.NC3H12, Common.FluidData.NH3, Common.FluidData.S, Common.FluidData.S2, Common.FluidData.S3, Common.FluidData.S4, Common.FluidData.S5, Common.FluidData.S6, Common.FluidData.S7, Common.FluidData.S8}, substanceNames = {"H2S", "SO2,", "H2O", "O2", "N2", "H2", "CO", "CO2", "COS", "CS2", "CH4", "C2H6", "C3H8", "C4H10_isobutane", "C4H10_n_butane", "C5H12_i_pentane", "NH3", "S", "S2", "S3", "S4", "S5", "S6", "S7", "S8"}, reference_X = {0.0, 0.0, 0.0, 0.232, 0.768, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0});
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