within BuildingSystems.Buildings.BaseClasses;
partial model SurfaceGeneral
  "Generic surface model"
  Buildings.Interfaces.SurfaceToConstructionPort toConstructionPort
    "Port to the construction"
    annotation (Placement(transformation(extent={{-16,-10},{4,10}}), iconTransformation(extent={{-16,-10},{4,10}})));
  Modelica.SIunits.Area A
    "Surface area";
equation
  toConstructionPort.A = A;

  annotation (defaultComponentName = "surface",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
    graphics={Rectangle(extent={{-6,80},{6,-80}},
    lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid)}));
end SurfaceGeneral;
