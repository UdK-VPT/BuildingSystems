within BuildingSystems.Technologies.DistrictHeatingNetworks.BoundaryConditions;
model GroundTemperature0D
  "Model that computes the ground temperature at a choosen depth "

  parameter Modelica.SIunits.Temperature Tmean "Mean annual temperature";
  parameter Modelica.SIunits.TemperatureDifference A
    "Annual temperature amplitude";
  parameter Modelica.SIunits.Length z "Depth";
  parameter Modelica.SIunits.Time t0 "Time shift";
  parameter Modelica.SIunits.ThermalDiffusivity alpha = 8.2e-7
    "Ground thermal diffusivity";
  parameter Integer m=3 "Number of collected heat flows";

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

equation
  prescribedTemperature.T = Tmean + A*exp(-z*sqrt(Modelica.Constants.pi/(60*60*24*365*alpha)))*cos(2*Modelica.Constants.pi/(60*60*24*365)*(time-t0-z/2*sqrt((365*60*60*24)/Modelica.Constants.pi/alpha)));
  connect(prescribedTemperature.port, thermalCollector.port_b) annotation (Line(
      points={{20,0},{40,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_a, port) annotation (Line(
      points={{60,0},{90,0}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
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
To determine the temperature it is necessary to have information about the weather: mean annual temperature (<code>Tmean</code>) and annual temperature amplitude (<code>A</code>) as well as information about the ground thermal diffusivity <code>alpha</code>. Furthermore the equation is tunned with a time shift parameter <code>t0</code> which correponds to the day at which the ambient temperature has its lower value.
</p>
<h4>References</h4>
<p>
Earth temperature and thermal diffusivity at selected stations in the United States; Kusuda, T. and Achenbach P. R., 1965
</p>
</html>"));
end GroundTemperature0D;
