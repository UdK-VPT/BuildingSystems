within BuildingSystems.Technologies.DistrictHeatingNetworks.BoundaryConditions;
model Kusuda0D

  parameter Modelica.SIunits.Temperature Tmean "Mean annual temperature";
  parameter Modelica.SIunits.TemperatureDifference A
    "Annual temperature amplitude";
  parameter Modelica.SIunits.Length z "Depth";
  parameter Modelica.SIunits.Time t0 "Time shift";
  parameter Modelica.SIunits.ThermalDiffusivity alpha = 8.2e-7
    "Ground thermal diffusivity";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  prescribedTemperature.T = Tmean + A*exp(-z*sqrt(Modelica.Constants.pi/(60*60*24*365*alpha)))*cos(2*Modelica.Constants.pi/(60*60*24*365)*(time-t0-z/2*sqrt((365*60*60*24)/Modelica.Constants.pi/alpha)));
  connect(prescribedTemperature.port, port) annotation (Line(
      points={{40,0},{90,0}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-100,50},{100,-30}},
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
The kusuda model describes the temperature on the ground as a function of the depth <code>z</code> and time.
</p>
<p>
To determine the temperature it is necessary to have information about the weather: mean annual temperature (<code>Tmean</code>) and annual temperature amplitude (<code>A</code>) as well as information about the ground thermal diffusivity <code>alpha</code>. Furthermore the equation is tunned with a time shift parameter <code>t0</code> which correponds to the day at which the ambient temperature has its lower value.
</p>
<h4>References</h4>
<p>
Earth temperature and thermal diffusivity at selected stations in the united states, Kusuda, T. & Achenbach P. R., 1965
</p>
</html>"));
end Kusuda0D;
