within BuildingSystems.Utilities.Visualisation3D;
model CylinderVis3D
  extends ModelVis3D;
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Cylinder shapeVis3D(
    name="shape",
    diameter=diameter,
    length=length);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialVis3D(
    name="material",
    r=r,
    g=g,
    b=b);
  parameter Modelica.SIunits.Length diameter = 1.0;
  parameter Modelica.SIunits.Length length = 1.0;
  parameter Real r = 0.5;
  parameter Real g = 0.5;
  parameter Real b = 0.5;

algorithm
  when update3d.send then
    if not initDone then
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(
        shapeVis3D.id, materialVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(
        shapeVis3D.id,
        xVis3D,
        yVis3D,
        zVis3D,
        update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
        shapeVis3D.id,
        xAngleVis3D,
        yAngleVis3D,
        zAngleVis3D,
        update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.scale(
        shapeVis3D.id,
        xScaleVis3D,
        yScaleVis3D,
        zScaleVis3D,
        update3d.frame);
      initDone := true;
    end if;
  end when;
end CylinderVis3D;
