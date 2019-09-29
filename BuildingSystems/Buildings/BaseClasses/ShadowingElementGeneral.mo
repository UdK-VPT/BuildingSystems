within BuildingSystems.Buildings.BaseClasses;
partial model ShadowingElementGeneral
  "Abstract model class of a shadowing element"
  extends BuildingSystems.Buildings.BaseClasses.BuildingElement;
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}),
      iconTransformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    annotation (Placement(transformation(extent={{30,-10},{50,10}}),
      iconTransformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Interfaces.RealOutput SC(min = 0.0, max = 1.0)
    "Shading coefficient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-70}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-90})));
equation
  radiationPort_out.IrrDif = radiationPort_in.IrrDif;
  radiationPort_out.IrrDir = SC * radiationPort_in.IrrDir;
  radiationPort_out.angleDegInc = radiationPort_in.angleDegInc;
  radiationPort_out.angleDegAziSun = radiationPort_in.angleDegAziSun;
  radiationPort_out.angleDegHeightSun = radiationPort_in.angleDegHeightSun;

annotation(
  Icon(graphics={Rectangle(extent={{-40,80},{40,-80}}, lineColor={0,0,0})}),
Documentation(info="<html>
<p>
This is an abstract model of a shadowing element.
</p>
</html>", revisions="<html>
<ul>
<li>
September 16, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ShadowingElementGeneral;
