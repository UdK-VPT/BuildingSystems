within BuildingSystems.Fluid.Sources.Validation;
model Boundary "Validation model for boundary with different media"
  extends Modelica.Icons.Example;

 BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouWat(
   redeclare package Medium = BuildingSystems.Media.Water)
   "Boundary with water"
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
 BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouProGly(
    redeclare package Medium = Media.Antifreeze.PropyleneGlycolWater(property_T=293.15, X_a=0.40))
    "Boundary with propylene glycol"
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));

  BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouMoiAir(
    redeclare package Medium = BuildingSystems.Media.Air)
    "Boundary with moist air"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouMoiAirCO2(
    redeclare package Medium = BuildingSystems.Media.Air(extraPropertiesNames={"CO2"}))
    "Boundary with moist air"
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
 BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouProFluGas(
   redeclare package Medium =
        Modelica.Media.IdealGases.MixtureGases.FlueGasSixComponents)
    "Boundary with flue gas"
    annotation (Placement(transformation(extent={{20,0},{40,20}})));

  BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouNatGas(
    redeclare package Medium =
        Modelica.Media.IdealGases.MixtureGases.SimpleNaturalGas)
   "Boundary with natural gas"
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));

  BuildingSystems.Fluid.Sources.Validation.BaseClasses.BoundarySystem bouNatGasFix(
    redeclare package Medium =
        Modelica.Media.IdealGases.MixtureGases.SimpleNaturalGasFixedComposition)
    "Boundary with natural gas"
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));

    annotation (Documentation(info="<html>
<p>
Validation model for <a href=\"modelica://BuildingSystems.Fluid.Sources.Boundary_pT\">
BuildingSystems.Fluid.Sources.Boundary_pT</a>
for different media.
</p>
</html>", revisions="<html>
<ul>
<li>
September 13, 2019 by Michael Wetter:<br/>
First implementation.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1205\">IBPSA, #1205</a>.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Fluid/Sources/Validation/Boundary.mos"
        "Simulate and plot"),
experiment(
      StopTime=1,
      Tolerance=1e-06));
end Boundary;
