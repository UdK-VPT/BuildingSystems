within BuildingSystems.Technologies.ElectricalStorages;
model BatterySimple
  extends BaseClasses.Battery;

equation
  der(EAva) = PChargeEff - PLoadEff + k*(h2 - h1);
  der(EBou) = -k*(h2 - h1) - fDis * E;

  PChargeEff = BuildingSystems.Utilities.Math.Functions.smoothLimit(
               0.5*(1.0-Modelica.Math.tanh(100000.0*(SOC-1.0)))*PNet*etaCharge,
               0.0,
               PCharge_max,
               0.001);

  PLoadEff = BuildingSystems.Utilities.Math.Functions.smoothLimit(
             -0.5*(1.0+Modelica.Math.tanh(100000.0*(SOC-1.0*SOC_min)))*PNet/etaLoad,
             0.0,
             PLoad_max,
             0.001);

  PGrid = 0.5*(1.0-Modelica.Math.tanh(100000.0*(PNet)))*(PNet + PLoadEff*etaLoad)+
          0.5*(1.0+Modelica.Math.tanh(100000.0*(PNet)))*(PNet - PChargeEff/etaCharge);
          
    annotation (Documentation(info="<html>
  <p>
  Model for an eletrical battery based on the Kinetic Battery Model (KiBaM) of Manwell and McGowan
  (J. Manwell, J. McGowan, B.-G. E.I., S. W., and L. A., Evaluation of battery models
   for wind/hybrid power system simulation, in Proceedings of the 5th European Wind
   Energy Association Conference (EWEC 94), 1994, pp. 1182-1187.).
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  June 22, 2018, by Christoph Banhardt:<br/>
  Created BatterySimple from BaseClasses.Battery.
  </li>
  <li>
  November 11, 2017, by Christoph Nytsch-Geusen:<br/>
  Loss factor to bound energy storage shifted and plausible
  limitations of PChargeEff and PLoadEff added.
  </li>
  <li>
  May 31, 2017, by Christoph Nytsch-Geusen:<br/>
  Integration of the Kinetic Battery Model.
  </li>
  <li>
  June 6, 2016, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end BatterySimple;
