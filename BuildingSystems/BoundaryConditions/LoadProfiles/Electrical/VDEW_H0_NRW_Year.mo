within BuildingSystems.BoundaryConditions.LoadProfiles.Electrical;
block VDEW_H0_NRW_Year
  "Standardized electrical load profile H0 (VDEW) in W for 2016 (period 1.1.2016 midnight to 31.12.2016 midnight) for a yearly demand of 1000 kWh"
  extends Modelica.Blocks.Interfaces.SO;
  VDEW_H0_NRW_Jan2016 vDEW_H0_NRW_Jan2016
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  VDEW_H0_NRW_Feb2016 vDEW_H0_NRW_Feb2016
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  VDEW_H0_NRW_Mar2016 vDEW_H0_NRW_Mar2016
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  VDEW_H0_NRW_Apr2016 vDEW_H0_NRW_Apr2016
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  VDEW_H0_NRW_May2016 vDEW_H0_NRW_May2016
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  VDEW_H0_NRW_Jun2016 vDEW_H0_NRW_Jun2016
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  VDEW_H0_NRW_Jul2016 vDEW_H0_NRW_Jul2016
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  VDEW_H0_NRW_Aug2016 vDEW_H0_NRW_Aug2016
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  VDEW_H0_NRW_Sep2016 vDEW_H0_NRW_Sep2016
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  VDEW_H0_NRW_Oct2016 vDEW_H0_NRW_Oct2016
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  VDEW_H0_NRW_Nov2016 vDEW_H0_NRW_Nov2016
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  VDEW_H0_NRW_Dec2016 vDEW_H0_NRW_Dec2016
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Sources.RealExpression realExpression(
    y = vDEW_H0_NRW_Jan2016.y + vDEW_H0_NRW_Feb2016.y
        + vDEW_H0_NRW_Mar2016.y + vDEW_H0_NRW_Apr2016.y
        + vDEW_H0_NRW_May2016.y + vDEW_H0_NRW_Jun2016.y
        + vDEW_H0_NRW_Jul2016.y + vDEW_H0_NRW_Aug2016.y
        + vDEW_H0_NRW_Sep2016.y + vDEW_H0_NRW_Oct2016.y
        + vDEW_H0_NRW_Nov2016.y + vDEW_H0_NRW_Dec2016.y)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(realExpression.y, y)
    annotation (Line(points={{81,0},{92,0},{92,0},{110,0}}, color={0,0,127}));

    annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={
            Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
            Polygon(
              points={{90,-70},{68,-62},{68,-78},{90,-70}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-48,70},{2,-50}},
              lineColor={255,255,255},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},
                  {52,-20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}})}),
Documentation(info="<html>
<p>
This block generates an output of the yearly electricity profile in W of a private household
based on a standardized load profile H0 (VDEW) for the year 2016
for a yearly demand of 1000 kWh.
</p>
</html>",
revisions="<html>
<ul>
<li>
July 11, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end VDEW_H0_NRW_Year;
