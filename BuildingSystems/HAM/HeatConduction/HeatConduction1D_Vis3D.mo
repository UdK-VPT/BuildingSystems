within BuildingSystems.HAM.HeatConduction;
model HeatConduction1D_Vis3D
  "Model for 1D heat conduction, which can be 3D-visualised"
  extends BuildingSystems.HAM.HeatConduction.HeatConduction1D;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;

  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box boxVis3D(
    name = "box",
    length=lengthX,
    width=lengthY,
    height=lengthZ);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialVis3D(
    name = "material",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  parameter Modelica.SIunits.Temp_K minTempVis3D
    "Minimum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
  parameter Modelica.SIunits.Temp_K maxTempVis3D
    "Maximum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
protected
  Real rVis3D, gVis3D, bVis3D;

algorithm
  when update3d.send then
    if not initDone then
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(boxVis3D.id,materialVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(boxVis3D.id, xAngleVis3D,yAngleVis3D,zAngleVis3D,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(boxVis3D.id,xVis3D,yVis3D,zVis3D,update3d.frame);
      initDone := true;
    end if;
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(T,minTempVis3D,maxTempVis3D);
     BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialVis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
  end when;
end HeatConduction1D_Vis3D;
