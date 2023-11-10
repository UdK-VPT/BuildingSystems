within BuildingSystems.Buildings.BaseClasses;
model ShadowingElementEnvironmentGeneral
  "Abstract model class of a shadowing element of the building's environment"
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}),
      iconTransformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    annotation (Placement(transformation(extent={{30,-10},{50,10}}),
      iconTransformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Interfaces.RealInput SC(min = 0.0, max = 1.0)
    "Shading coefficient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-70}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-90})));
  parameter Boolean maskIrrDif = true
    "True: the shading coefficient is applied to diffuse irradiation"
    annotation(HideResult = true,Dialog(tab = "Advanced", group = "Shading Mask"));
equation
  if maskIrrDif then
    radiationPort_out.IrrDif = SC * radiationPort_in.IrrDif;
  else
    radiationPort_out.IrrDif = radiationPort_in.IrrDif;
  end if;
  radiationPort_out.IrrDir = SC * radiationPort_in.IrrDir;
  radiationPort_out.angleDegInc = radiationPort_in.angleDegInc;
  radiationPort_out.angleDegAziSun = radiationPort_in.angleDegAziSun;
  radiationPort_out.angleDegHeightSun = radiationPort_in.angleDegHeightSun;

annotation (
  Icon(graphics={Rectangle(extent={{-40,80},{40,-80}}, lineColor={0,0,0})}),
Documentation(info="<html>
<p>
This is an abstract model of a shadowing element of the building's environment.
</p>
</html>", revisions="<html>
<ul>
<li>
October 3, 2023 by Philippe Pinçon:<br/>
First implementation.
</li>
</ul>
</html>"));
end ShadowingElementEnvironmentGeneral;
