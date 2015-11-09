within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone1DCylinder_Vis3D
  "Strong simplified builing model with 3 thermal capacities, which can be 3D-visualised"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DCylinder;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;
  parameter Modelica.SIunits.Temp_K minTempVis3D
    "Minimal temperature value for visualisation "
    annotation(Dialog(tab = "3D visualisation", group = "Colors"));
  parameter Modelica.SIunits.Temp_K maxTempVis3D
    "Minimal temperature value for visualisation "
    annotation(Dialog(tab = "3D visualisation", group = "Colors"));
  Real rVis3D, gVis3D, bVis3D;

  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Group buildingElementGroupVis3D(name = "buildElGroup");

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D groundplate(
    length=10.0,
    width = 10.0,
    height = 0.4,
    xVis3D = 0.0, yVis3D = 0.0, zVis3D = 0.0,
    r = 0.5, g = 0.5, b = 0.5,
    updateInterval = updateInterval)
    "groundplate";

  BuildingSystems.Utilities.Visualisation3D.BoxVis3D wall_Vis3D[nSeg](
    each length = 0.1,
    width = {wall[i].width for i in 1:nSeg},
    each height = height,
    xVis3D = {circle.point[i].x + 0.5 * (circle.point[if i < nSeg then i+1 else 1].x - circle.point[i].x) for i in 1:nSeg},
    yVis3D = {circle.point[i].y + 0.5 * (circle.point[if i < nSeg then i+1 else 1].y - circle.point[i].y) for i in 1:nSeg},
    zVis3D = {0.5*groundplate.height + 0.5*wall[i].height for i in 1:nSeg},
    zAngleVis3D = {180.0 - wall[i].angleDegAzi for i in 1:nSeg},
    each r = 255.0/255.0,
    each g = 211.0/255.0,
    each b = 155.0/255.0,
    each updateInterval = updateInterval)
    "walls";

algorithm
  when update3d.send then
    if not initDone then
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(groundplate.shapeVis3D.id, buildingElementGroupVis3D.id);
      for i in 1:nSeg loop
        BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(wall_Vis3D[i].shapeVis3D.id, buildingElementGroupVis3D.id);
      end for;
      initDone := true;
    end if;
    for i in 1:nSeg loop
      (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(wall[i].construction.layer[1].T[1],minTempVis3D,maxTempVis3D);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(wall_Vis3D[i].materialVis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
    end for;
  end when;
end Building1Zone1DCylinder_Vis3D;
