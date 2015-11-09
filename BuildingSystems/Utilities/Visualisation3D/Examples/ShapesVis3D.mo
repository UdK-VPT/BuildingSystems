within BuildingSystems.Utilities.Visualisation3D.Examples;
model ShapesVis3D
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Time updateInterval = 0.1; // update intervall for 3D visualisation
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Update3D update3d(
      updateInterval=updateInterval);

  Modelica.SIunits.Length x(start = 0.0);
  Modelica.SIunits.Length y(start = 0.0);
  Modelica.SIunits.Length z(start = 0.0);

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D box1(
    length=0.4,
    width=0.4,
    height=0.4,
    xVis3D=0.0,
    yVis3D=0.0,
    zVis3D=0.0,
    r=1.0,
    g=0.0,
    b=0.0,
    updateInterval=updateInterval) "Moving box";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D box2(
    length=0.4,
    width=0.4,
    height=0.4,
    xVis3D=0.0,
    yVis3D=0.0,
    zVis3D=0.0,
    updateInterval=updateInterval) "Changing color box";

  BuildingSystems.Utilities.Visualisation3D.SphereVis3D sphere(
    diameter=0.5,
    xVis3D=1.5,
    yVis3D=0.0,
    zVis3D=0.0,
    updateInterval=updateInterval) "Dynamic scaled sphere";

  BuildingSystems.Utilities.Visualisation3D.ConeVis3D cone(
    diameter=0.5,
    length=1.0,
    xVis3D=3.0,
    yVis3D=3.0,
    zVis3D=0.0,
    r=0.0,
    g=0.0,
    b=1.0,
    updateInterval=updateInterval) "Rotating cone";

  BuildingSystems.Utilities.Visualisation3D.CylinderVis3D cylinder(
    diameter=0.5,
    length=2.0,
    xVis3D=-2.0,
    yVis3D=2.0,
    zVis3D=0.0,
    r=0.0,
    g=0.0,
    b=1.0,
    updateInterval=updateInterval) "Rotating cone";

  //~ BuildingSystems.Utilities.Visualisation3D.TextVis3D text(
    //~ info="You can see " + String(7) + " Modelica 3D objects !",
    //~ xVis3D = -2.0, yVis3D = 0.0, zVis3D = 1.5,
    //~ xAngleVis3D = 90.0, yAngleVis3D = 0.0, zAngleVis3D = 0.0,
    //~ xScaleVis3D = 0.5, yScaleVis3D = 0.5, zScaleVis3D = 0.5,
    //~ r = 1.0, g = 0.0, b = 0.0,
    //~ updateInterval = updateInterval) "Dynamic scaled text";

  BuildingSystems.Utilities.Visualisation3D.PlaneVis3D plane(
    length=1.0,
    xVis3D=0.0,
    yVis3D=0.0,
    zVis3D=-2.0,
    xAngleVis3D=45.0,
    yAngleVis3D=0.0,
    zAngleVis3D=0.0,
    r=0.0,
    g=1.0,
    b=0.0,
    updateInterval=updateInterval) "Rotating plane";
algorithm
  when update3d.send then
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(
      box1.shapeVis3D.id,
      0.5*x,
      0.5*y,
      0.5*z,
      update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
      box2.shapeVis3D.id,
      90*x,
      90*y,
      90*z,
      update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(
      box2.materialVis3D.id,
      x,
      y,
      z,
      update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.scale(
      sphere.shapeVis3D.id,
      x,
      x,
      x,
      update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
      cone.shapeVis3D.id,
      50*x,
      50*x,
      50*x,
      update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
      cylinder.shapeVis3D.id,
      100*x,
      100*x,
      0.0,
      update3d.frame);
    //~ BuildingSystems.Utilities.Visualisation3D.Modelica3D.scale(text.shapeVis3D.id, 0.3*(1.0+x), 0.3*(1.0+x), 0.3*(1.0+x), update3d.frame);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
      plane.shapeVis3D.id,
      50.0*x,
      30*y,
      10.0*z,
      update3d.frame);
  end when;

equation
  x = Modelica.Math.sin(0.1*time);
  y = 0.5 * x;
  z = x + y;
  annotation(experiment(StartTime=0.0, StopTime=100.0),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-20},{0,80}}),graphics));
end ShapesVis3D;
