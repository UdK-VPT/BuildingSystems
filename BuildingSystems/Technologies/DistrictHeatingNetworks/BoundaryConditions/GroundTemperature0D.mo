within BuildingSystems.Technologies.DistrictHeatingNetworks.BoundaryConditions;
model GroundTemperature0D
  "Model that computes the ground temperature at a choosen depth "

  parameter Modelica.Units.SI.Temperature Tmean "Mean annual temperature";
  parameter Modelica.Units.SI.TemperatureDifference A
    "Annual temperature amplitude";
  parameter Modelica.Units.SI.Length z "Depth";
  parameter Modelica.Units.SI.Time t0 "Time shift";
  parameter Modelica.Units.SI.ThermalDiffusivity alpha=8.2e-7
    "Ground thermal diffusivity";
  parameter Boolean use_geo = false "Set to true to use geothermal grade, false geo = 0";
  parameter Real geo( unit="K/m") = 0.03 "Geothermal grade" annotation(Dialog(enable=use_geo));
  parameter Integer m=3 "Number of collected heat  flows";

  BuildingSystems.Interfaces.HeatPorts port[m]    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,0}), iconTransformation(
        extent={{-30,-10},{30,10}},
        rotation=90,
        origin={90,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature    prescribedTemperature annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(m=m) annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,0})));
protected
parameter Real geo_intern( unit="K/m") = if use_geo then geo else 0;

equation
  prescribedTemperature.T = Tmean + A*exp(-z*sqrt(Modelica.Constants.pi/(60*60*24*365*alpha)))*cos(2*Modelica.Constants.pi/(60*60*24*365)*(time-t0-z/2*sqrt((365)/Modelica.Constants.pi/(60*60*24*alpha)))) + z*geo_intern;
  connect(prescribedTemperature.port, thermalCollector.port_b) annotation (Line(
      points={{20,0},{40,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_a, port) annotation (Line(
      points={{60,0},{90,0}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation ( Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-100,60},{80,-20}},
          lineColor={127,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Ground
temperature
at
depth = %z m"),     Rectangle(extent={{-100,100},{100,-100}}, lineColor={127,0,
              0})}),
    Documentation(info="<html>
<p>
The model bases on the Kusuda equations, which describes the temperature on the ground as a function of the depth <code>z</code> and time.
</p>
<p>
To determine the temperature it is necessary to have information about the weather: mean annual temperature (<code>Tmean</code>) and annual temperature amplitude (<code>A</code>) as well as information about the ground thermal diffusivity <code>alpha</code>. Furthermore the equation is tunned with a time shift parameter <code>t0</code> which correponds to the day at which the ambient temperature has its maximum value.
</p>
<h4>References</h4>
<p>
Soil thermal conductivity prediction for distrit heating pre-insulated pipeline in operation; Matjaz P., Zlatko R., Suvad B. and Iztok Z.; published in Energy 2012
</p>
<p>
Earth temperature and thermal diffusivity at selected stations in the United States; Kusuda, T. and Achenbach P. R., 1965
</p>
</html>"));
end GroundTemperature0D;
