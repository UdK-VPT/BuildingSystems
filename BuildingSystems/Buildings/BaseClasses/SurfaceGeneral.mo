within BuildingSystems.Buildings.BaseClasses;
partial model SurfaceGeneral
  "Generic surface model"
  Buildings.Interfaces.SurfaceToConstructionPort toConstructionPort
    "Port to the construction"
    annotation (Placement(transformation(extent={{-16,-10},{4,10}}), iconTransformation(extent={{-16,-10},{4,10}})));
  Modelica.Units.SI.Area ASur
    "Surface area";
equation
  toConstructionPort.A = ASur;

  annotation (defaultComponentName = "sur",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
    graphics={Rectangle(extent={{-6,80},{6,-80}},
    lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Text(extent={{-47,13},{47,-13}}, lineColor={0,0,255},fillColor={230,230,230},
    fillPattern = FillPattern.Solid,textString = "%name",origin={-19,45},rotation=90)}),
Documentation(info="<html>
<p>
This is partial model description of a surface.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceGeneral;
