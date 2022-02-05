within BuildingSystems.Technologies.ElectricalStorages;
model BatteryComplex
  extends BaseClasses.Battery;
  final parameter Real p(unit="1") = batteryData.p
    "Peukert coefficient";
  Modelica.Units.SI.Power PLoadAva
    "Discharging power using available electrons in EAva";
  Modelica.Units.SI.Power PLoadBou
    "Discharging power forcing electro-chemical reaction in EBou";
  Modelica.Units.SI.Energy E_current(displayUnit="kWh")
    "Current energy content at actual discharge rate";
  Modelica.Units.SI.Energy E_max(displayUnit="kWh") = t_loadMax/t_loadNominal*(
    t_loadMax/t_loadNominal)^p*E_nominal
    "Maximum energy content at 100hr discharge rate";

  constant Modelica.Units.SI.Time t_loadNominal=20.0*3600.0
    "Nominal discharge time at rated capacity";
  constant Modelica.Units.SI.Time t_loadMax=100.0*3600.0
    "Nominal discharge time at rated capacity";

equation
  der(EAva) = PChargeEff - E_nominal/E_current * PLoadAva + k*(h2 - h1);
  der(EBou) = -k*(h2 - h1) - E_nominal/E_current * PLoadBou;

  E_current = BuildingSystems.Utilities.Math.Functions.smoothLimit(
              t_loadNominal*(E_nominal/t_loadNominal/PLoadEff)^p*PLoadEff,
              0.0,
              E_max,
              0.001);
  PLoadBou = BuildingSystems.Utilities.Math.Functions.smoothLimit(
               0.5*(1.0-Modelica.Math.tanh(100000.0*(SOC_min-SOC)))*(-PNet/etaLoad - PLoadAva)+fDis*E,
               0.0,
               PLoad_max,
               0.001);
  PLoadAva = 0.5*(1.0-Modelica.Math.tanh(100000.0*(SOC_min-SOC)))*
               BuildingSystems.Utilities.Math.Functions.smoothLimit(
               -0.5*(1.0+Modelica.Math.tanh(100000.0*(EAva)))*PNet/etaLoad,
               0.0,
               PLoad_max,
               0.001);
  PLoadEff = BuildingSystems.Utilities.Math.Functions.smoothLimit(
               PLoadBou + PLoadAva,
               0.0,
               PLoad_max,
               0.001);

    annotation (Documentation(info="<html>
  <p>
  Extended model for an eletrical battery based on the Kinetic Battery Model (KiBaM) of Manwell and McGowan
  (J. Manwell, J. McGowan, B.-G. E.I., S. W., and L. A.), Battery capacity varies with current draw, nominal capacity is equal to a 20hrs discharge rate.
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  June 22, 2018, by Christoph Banhardt:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end BatteryComplex;
