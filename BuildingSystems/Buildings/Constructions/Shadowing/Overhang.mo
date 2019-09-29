within BuildingSystems.Buildings.Constructions.Shadowing;
model Overhang
  "Model of a horizontal overhang"
  extends BuildingSystems.Buildings.BaseClasses.ShadowingElementGeneral;
  parameter Modelica.SIunits.Length depthOH = 0.0
    "Depth of the overhang";
  parameter Modelica.SIunits.Length heightOH = 0.0
    "Height of the overhang";
equation
  SC = min(1.0,max(0.0,(heightOH+height_internal)/height_internal*(1.0 - depthOH/(heightOH+height_internal)
       * Modelica.Math.tan(Modelica.Constants.pi/180.0*radiationPort_in.angleDegHeightSun)/Modelica.Math.cos(Modelica.Constants.pi/180.0*(radiationPort_in.angleDegAziSun - angleDegAzi)))
       * (0.5 + 0.5*Modelica.Math.tanh(10000.0*radiationPort_in.angleDegHeightSun))));

 annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
   iconTransformation(extent={{-10,-70},{-30,-50}})),
   defaultComponentName="overhang",Icon(graphics={
   Polygon(points={{-40,92},{-80,52},{0,52},{40,92},{-40,92}},lineColor={
   0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
   Text(extent={{20,-78},{136,-142}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
<p>
This is a model of a horizontal overhang.
</p>
</html>", revisions="<html>
<ul>
<li>
September 29, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Overhang;
