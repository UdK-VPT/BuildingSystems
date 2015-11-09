within BuildingSystems.Utilities.Visualisation3D.Examples;
model BuildingVis3D
  extends Modelica.Icons.Example;
  extends Visualisation3D.ModelVis3D(updateInterval= 0.1);

  parameter Modelica.SIunits.Length width_stripe_groundplate = 2.0;
  parameter Modelica.SIunits.Length thickness_groundplate = 0.4;
  parameter Modelica.SIunits.Length thickness_walls = 0.3;
  parameter Modelica.SIunits.Length length_inside = 7.0;
  parameter Modelica.SIunits.Length width_inside = 4.0;
  parameter Modelica.SIunits.Length height_inside = 2.5;
  parameter Modelica.SIunits.Length thickness_roof = 0.4;
  parameter Modelica.SIunits.Length overhang_roof = 0.5;
  parameter Modelica.SIunits.Length height_windowsill = 0.1;
  parameter Modelica.SIunits.Length height_window = 2.0;
  parameter Modelica.SIunits.Length width_window = 3.0;

  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Group buildingElementGroupVis3D(name=
        "buildElGroup");

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D groundplate(
    length=2*width_stripe_groundplate + 2*thickness_walls + length_inside,
    width=2*width_stripe_groundplate + 2*thickness_walls + width_inside,
    height=thickness_groundplate,
    xVis3D=0.0,
    yVis3D=0.0,
    zVis3D=0.0,
    r=0.5,
    g=0.5,
    b=0.5,
    updateInterval=updateInterval) "groundplate";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall1(
    length=length_inside + 2*thickness_walls,
    width=thickness_walls,
    height=height_inside,
    xVis3D=-0.5*(width_inside + thickness_walls),
    yVis3D=0.0,
    zVis3D=0.5*(height_inside + thickness_groundplate),
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall1";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall2_windowsill(
    length=length_inside + 2*thickness_walls,
    width=thickness_walls,
    height=height_windowsill,
    xVis3D=0.5*(width_inside + thickness_walls),
    yVis3D=0.0,
    zVis3D=0.5*(height_windowsill + thickness_groundplate),
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall2 window sill";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall2_windowlintel(
    length=length_inside + 2*thickness_walls,
    width=thickness_walls,
    height=height_inside - height_windowsill - height_window,
    xVis3D=0.5*(width_inside + thickness_walls),
    yVis3D=0.0,
    zVis3D=0.5*(thickness_groundplate + height_inside - height_windowsill -
        height_window) + height_windowsill + height_window,
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall2 window lintel";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall2_column1(
    length=(length_inside - 2*width_window)/2,
    width=thickness_walls,
    height=height_window,
    xVis3D=0.5*(width_inside + thickness_walls),
    yVis3D=0.0,
    zVis3D=0.5*(thickness_groundplate + height_window) + height_windowsill,
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall2 column1";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall2_column2(
    length=(length_inside - 2*width_window)/4,
    width=thickness_walls,
    height=height_window,
    xVis3D=0.5*(width_inside + thickness_walls),
    yVis3D=-0.5*length_inside + 0.5*(length_inside - 2*width_window)/4,
    zVis3D=0.5*(thickness_groundplate + height_window) + height_windowsill,
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall2 column2";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall2_column3(
    length=(length_inside - 2*width_window)/4,
    width=thickness_walls,
    height=height_window,
    xVis3D=0.5*(width_inside + thickness_walls),
    yVis3D=0.5*length_inside - 0.5*(length_inside - 2*width_window)/4,
    zVis3D=0.5*(thickness_groundplate + height_window) + height_windowsill,
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall2 column3";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall3(
    length=thickness_walls,
    width=width_inside + 2*thickness_walls,
    height=height_inside,
    xVis3D=0.0,
    yVis3D=0.5*(length_inside + thickness_walls),
    zVis3D=0.5*(height_inside + thickness_groundplate),
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall3";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall4(
    length=thickness_walls,
    width=width_inside + 2*thickness_walls,
    height=height_inside,
    xVis3D=0.0,
    yVis3D=-0.5*(length_inside + thickness_walls),
    zVis3D=0.5*(height_inside + thickness_groundplate),
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "wall4";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D roof(
    length=2*overhang_roof + 2*thickness_walls + length_inside,
    width=2*overhang_roof + 2*thickness_walls + width_inside,
    height=thickness_groundplate,
    xVis3D=0.0,
    yVis3D=0.0,
    zVis3D=height_inside + 0.5*thickness_groundplate,
    r=255.0/255.0,
    g=211.0/255.0,
    b=155.0/255.0,
    updateInterval=updateInterval) "roof";

algorithm
  when update3d.send then
    if not initDone then
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        groundplate.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(wall1.shapeVis3D.id,
        buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        wall2_windowsill.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        wall2_windowlintel.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        wall2_column1.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        wall2_column2.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(
        wall2_column3.shapeVis3D.id, buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(wall3.shapeVis3D.id,
        buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(wall4.shapeVis3D.id,
        buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(roof.shapeVis3D.id,
        buildingElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(
        buildingElementGroupVis3D.id,
        xAngleVis3D,
        yAngleVis3D,
        zAngleVis3D,
        update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(
        buildingElementGroupVis3D.id,
        xVis3D,
        yVis3D,
        zVis3D,
        update3d.frame);
      initDone := true;
    end if;
  end when;
  annotation(experiment(StartTime=0.0, StopTime=100.0),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-20},{0,80}}),graphics));
end BuildingVis3D;
