within BuildingSystems.Buildings.Constructions.Windows;
model Window_Vis3D
  "Simplified model of a window, which can be 3D-visualised"
  extends BuildingSystems.Buildings.Constructions.Windows.Window;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;
  parameter Modelica.SIunits.Temp_K minTempVis3D
    "Minimum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
  parameter Modelica.SIunits.Temp_K maxTempVis3D
    "Maximum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
  Real rVis3D, gVis3D, bVis3D;
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Group windowElementGroupVis3D(
    name = "windElGroup");
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Vis3D(
    name = "surf1",
    length=0.001,
    width=width,
    height=height);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface1Vis3D(
    name = "matSurf1",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box paneVis3D(
    name = "pane",
    length=thicknessPane,
    width=width,
    height=height);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialPaneVis3D(
    name = "matPane",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Vis3D(
    name = "surf2",
    length=0.001,
    width=width,
    height=height);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface2Vis3D(
    name = "matSurf2",
    r = 0.5,
    g = 0.5,
    b = 0.5);
algorithm
  when update3d.send then
    if not initDone then
      // surface side 2
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Vis3D.id,materialSurface2Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Vis3D.id,0.0005,0.0,0.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Vis3D.id, windowElementGroupVis3D.id);
      // pane
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(paneVis3D.id,materialPaneVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(paneVis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(paneVis3D.id,-0.5*thicknessPane,0.0,0.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(paneVis3D.id, windowElementGroupVis3D.id);
      // surface side 1
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Vis3D.id,materialSurface1Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Vis3D.id,-0.0005-thicknessPane,0.0,0.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Vis3D.id, windowElementGroupVis3D.id);
      // frame
      // window
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(windowElementGroupVis3D.id, 0.0, -90.0+angleDegTil, 0.0, update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(windowElementGroupVis3D.id, 0.0,0.0, -90.0-angleDegAzi, update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(windowElementGroupVis3D.id, xVis3D, yVis3D, zVis3D, update3d.frame);
      initDone := true;
    end if;
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_2.heatPort[1,1].T,minTempVis3D,maxTempVis3D);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface2Vis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_1.heatPort[1,1].T,minTempVis3D,maxTempVis3D);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface1Vis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
  end when;
end Window_Vis3D;
