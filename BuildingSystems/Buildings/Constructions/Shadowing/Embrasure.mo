within BuildingSystems.Buildings.Constructions.Shadowing;
model Embrasure
  "Model of an embrasure"
  extends BuildingSystems.Buildings.BaseClasses.BuildingElement;
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}),
      iconTransformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    annotation (Placement(transformation(extent={{30,-10},{50,10}}),
      iconTransformation(extent={{30,-10},{50,10}})));
  parameter Modelica.SIunits.Length depth = 0.0
    "Depth of the embrasure";
  Real SC(min = 0.0, max = 1.0)
    "Shading coefficient";
equation
  SC = min(1.0,max(0.0,(1.0 - depth/height_internal * Modelica.Math.tan(Modelica.Constants.pi/180.0*radiationPort_in.angleDegHeightSun)/Modelica.Math.cos(Modelica.Constants.pi/180.0*(radiationPort_in.angleDegAziSun - angleDegAzi)))*
       (1.0 - depth/width_internal * abs(Modelica.Math.tan(Modelica.Constants.pi/180.0*(radiationPort_in.angleDegAziSun - angleDegAzi))))*(0.5 + 0.5*Modelica.Math.tanh(10000.0*radiationPort_in.angleDegHeightSun))));
  radiationPort_out.IrrDif = radiationPort_in.IrrDif;
  radiationPort_out.IrrDir = SC * radiationPort_in.IrrDir;
  radiationPort_out.angleDegInc = radiationPort_in.angleDegInc;
  radiationPort_out.angleDegAziSun = radiationPort_in.angleDegAziSun;
  radiationPort_out.angleDegHeightSun = radiationPort_in.angleDegHeightSun;

annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
  iconTransformation(extent={{-10,-70},{-30,-50}})),
  defaultComponentName="embrasure",Icon(graphics={
  Polygon(points={{20,60},{40,80},{40,-80},{20,-60},{20,60}}, lineColor={0,0,0},
    fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,80},{-20,60},{20,60},{40,80},{-40,80}}, lineColor={
    0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,80},{-20,60},{-20,-60},{-40,-80},{-40,80}},
    lineColor={0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,-80},{-20,-60},{20,-60},{40,-80},{-40,-80}},
    lineColor={0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Text(extent={{20,-78},{136,-142}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
<p>
This is a model of an embrasure.
</p>
</html>", revisions="<html>
<ul>
<li>
September 16, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Embrasure;
