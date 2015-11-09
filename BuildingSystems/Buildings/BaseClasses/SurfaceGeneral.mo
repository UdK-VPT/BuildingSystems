within BuildingSystems.Buildings.BaseClasses;
partial model SurfaceGeneral
  "Generic surface model"
  parameter Integer nY = 1
    "Number of surface elements in the y dimension";
  parameter Integer nZ = 1
    "Number of surface elements in the z dimension";
  Buildings.Interfaces.SurfaceToConstructionPort toConstructionPort(
    nY=nY,
    nZ=nZ)
    "Port to the construction"
    annotation (Placement(transformation(extent={{-16,-10},{4,10}}), iconTransformation(extent={{-16,-10},{4,10}})));
  Modelica.SIunits.Area A[nY,nZ]
    "Surface area";
equation
  for j in 1:nY loop
    for k in 1:nZ loop
      toConstructionPort.A[j,k] = A[j,k];
    end for;
  end for;

  annotation (defaultComponentName = "surface",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
    graphics={Rectangle(extent={{-6,80},{6,-80}},
    lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid)}));
end SurfaceGeneral;
