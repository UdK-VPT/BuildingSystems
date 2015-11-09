within BuildingSystems.Buildings.Constructions.Walls;
model WallThermal3D_Vis3D
  "Thermal wall model with 3D, which can be 3D-visualised"
  extends BuildingSystems.Buildings.Constructions.Walls.WallThermal3D;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;
  parameter Modelica.SIunits.Temp_K minTempVis3D
    "Minimum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
  parameter Modelica.SIunits.Temp_K maxTempVis3D
    "Maximum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
protected
  Real rVis3D, gVis3D, bVis3D;
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Group wallElementGroupVis3D(
    name = "wallElGroup");
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Vis3D[nY,nZ](
    each name = "surf1",
    each length=0.001,
    width = {{lengthSegY[j] *0.98 for k in 1:nZ} for j in 1:nY},
    height = {{lengthSegZ[k] *0.98 for k in 1:nZ} for j in 1:nY});
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface1Vis3D[nY,nZ](
    each name = "matSurf1",
    each r = 0.5,
    each g = 0.5,
    each b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box constructionVis3D(
    name = "con",
    length=constructionData.thicknessTotal,
    width=width,
    height=height);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialConstructionVis3D(
    name = "matCon",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Vis3D[nY,nZ](
    each name = "surf2",
    each length=0.001,
    width= {{lengthSegY[j] *0.98 for k in 1:nZ} for j in 1:nY},
    height = {{lengthSegZ[k] *0.98 for k in 1:nZ} for j in 1:nY});
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface2Vis3D[nY,nZ](
    each name = "matSurf2",
    each r = 0.5,
    each g = 0.5,
    each b = 0.5);

algorithm
  when update3d.send then
    if not initDone then
      // surface side 2
      for j in 1:nY loop
        for k in 1:nZ loop
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Vis3D[j,k].id,materialSurface2Vis3D[j,k].id);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Vis3D[j,k].id,0.0,0.0,90.0,update3d.frame);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Vis3D[j,k].id,0.0005,-0.5*width+0.5*lengthSegY[j]+sum(lengthSegY[1:j-1]),-0.5*height+0.5*lengthSegZ[k]+sum(lengthSegZ[1:k-1]),update3d.frame);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Vis3D[j,k].id, wallElementGroupVis3D.id);
        end for;
      end for;
      // construction
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(constructionVis3D.id,materialConstructionVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(constructionVis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(constructionVis3D.id,-0.5*constructionData.thicknessTotal,0.0,0.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(constructionVis3D.id, wallElementGroupVis3D.id);
      // surface side 1
      for j in 1:nY loop
        for k in 1:nZ loop
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Vis3D[j,k].id,materialSurface1Vis3D[j,k].id);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Vis3D[j,k].id,0.0,0.0,90.0,update3d.frame);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Vis3D[j,k].id,-0.0005-constructionData.thicknessTotal,-0.5*width+0.5*lengthSegY[j]+sum(lengthSegY[1:j-1]),-0.5*height+0.5*lengthSegZ[k]+sum(lengthSegZ[1:k-1]),update3d.frame);
          BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Vis3D[j,k].id, wallElementGroupVis3D.id);
        end for;
      end for;
      // wall
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(wallElementGroupVis3D.id, 0.0, -90.0+angleDegTil, -90.0-angleDegAzi, update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(wallElementGroupVis3D.id, xVis3D, yVis3D, zVis3D, update3d.frame);
      initDone := true;
    end if;
    for j in 1:nY loop
      for k in 1:nZ loop
        (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_2.heatPort[j,k].T,minTempVis3D,maxTempVis3D);
        BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface2Vis3D[j,k].id,rVis3D,gVis3D,bVis3D,update3d.frame);
        (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_1.heatPort[j,k].T,minTempVis3D,maxTempVis3D);
        BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface1Vis3D[j,k].id,rVis3D,gVis3D,bVis3D,update3d.frame);
      end for;
    end for;
  end when;
end WallThermal3D_Vis3D;
