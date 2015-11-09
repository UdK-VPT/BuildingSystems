within BuildingSystems.Buildings.Constructions.Walls;
model WallThermal1DNodes_Vis3D
  "Thermal wall model with 1D discritisation of the single layers, which can be 3D-visualised"
  extends BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;
  parameter Modelica.SIunits.Length yOpening = 0.0
    "y-position of the opening"
    annotation(Dialog(tab = "3D visualisation", group = "Opening"));
  parameter Modelica.SIunits.Length zOpening = 0.0
    "z-position of the opening"
    annotation(Dialog(tab = "3D visualisation", group = "Opening"));
  parameter Modelica.SIunits.Length widthOpening = 0.0
    "Width of the opening"
    annotation(Dialog(tab = "3D visualisation", group = "Opening"));
  parameter Modelica.SIunits.Length heightOpening = 0.0
    "Height of the opening"
    annotation(Dialog(tab = "3D visualisation", group = "Opening"));
  parameter Modelica.SIunits.Temp_K minTempVis3D
    "Minimum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
  parameter Modelica.SIunits.Temp_K maxTempVis3D
    "Maximum value of temperature scale"
    annotation(Dialog(tab = "3D visualisation", group = "Temperature scale"));
protected
  Real rVis3D, gVis3D, bVis3D;
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Group wallElementGroupVis3D(
    name="wallElGroup");
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Part1Vis3D(
    name="surf1Part1",
    length=0.001,
    width=width,
    height=zOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Part2Vis3D(
    name="surf1Part2",
    length=0.001,
    width=width,
    height=height-zOpening-heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Part3Vis3D(
    name = "surf1Part3",
    length=0.001,
    width=yOpening,
    height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface1Part4Vis3D(
    name = "surf1Part4",
    length=0.001,
    width=width-yOpening-widthOpening,height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface1Vis3D(
    name = "matSurf1",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box constructionPart1Vis3D(
    name = "conPart1",
    length=constructionData.thicknessTotal,
    width=width,
    height=zOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box constructionPart2Vis3D(
    name = "conPart2",
    length=constructionData.thicknessTotal,
    width=width,
    height=height-zOpening-heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box constructionPart3Vis3D(
    name = "conPart3",
    length=constructionData.thicknessTotal,
    width=yOpening,
    height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box constructionPart4Vis3D(
    name = "conPart4",
    length=constructionData.thicknessTotal,
    width=width-yOpening-widthOpening,
    height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialConstructionVis3D(
    name = "matCon",
    r = 0.5,
    g = 0.5,
    b = 0.5);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Part1Vis3D(
    name = "surf2Part1",
    length=0.001,
    width=width,
    height=zOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Part2Vis3D(
    name = "surf2Part2",
    length=0.001,
    width=width,
    height=height-zOpening-heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Part3Vis3D(
    name = "surf2Part3",
    length=0.001,
    width=yOpening,
    height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box surface2Part4Vis3D(
    name = "surf2Part4",
    length=0.001,
    width=width-yOpening-widthOpening,
    height=heightOpening);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialSurface2Vis3D(
    name = "matSurf2",
    r = 0.5,
    g = 0.5,
    b = 0.5);
algorithm
  when update3d.send then
    if not initDone then
      // surface side 2
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Part1Vis3D.id,materialSurface2Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Part2Vis3D.id,materialSurface2Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Part3Vis3D.id,materialSurface2Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface2Part4Vis3D.id,materialSurface2Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Part1Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Part2Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Part3Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface2Part4Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Part1Vis3D.id,0.0005,0.0,-height/2.0+zOpening/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Part2Vis3D.id,0.0005,0.0,height/2.0-(height-zOpening-heightOpening)/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Part3Vis3D.id,0.0005,-width/2.0+yOpening/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface2Part4Vis3D.id,0.0005,width/2.0-(width-yOpening-widthOpening)/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Part1Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Part2Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Part3Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface2Part4Vis3D.id, wallElementGroupVis3D.id);
      // construction
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(constructionPart1Vis3D.id,materialConstructionVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(constructionPart2Vis3D.id,materialConstructionVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(constructionPart3Vis3D.id,materialConstructionVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(constructionPart4Vis3D.id,materialConstructionVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(constructionPart1Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(constructionPart2Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(constructionPart3Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(constructionPart4Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(constructionPart1Vis3D.id,-0.5*constructionData.thicknessTotal,0.0,-height/2.0+zOpening/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(constructionPart2Vis3D.id,-0.5*constructionData.thicknessTotal,0.0,height/2.0-(height-zOpening-heightOpening)/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(constructionPart3Vis3D.id,-0.5*constructionData.thicknessTotal,-width/2.0+yOpening/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(constructionPart4Vis3D.id,-0.5*constructionData.thicknessTotal,width/2.0-(width-yOpening-widthOpening)/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(constructionPart1Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(constructionPart2Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(constructionPart3Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(constructionPart4Vis3D.id, wallElementGroupVis3D.id);
      // surface side 1
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Part1Vis3D.id,materialSurface1Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Part2Vis3D.id,materialSurface1Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Part3Vis3D.id,materialSurface1Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(surface1Part4Vis3D.id,materialSurface1Vis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Part1Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Part2Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Part3Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(surface1Part4Vis3D.id,0.0,0.0,90.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Part1Vis3D.id,-0.0005-constructionData.thicknessTotal,0.0,-height/2.0+zOpening/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Part2Vis3D.id,-0.0005-constructionData.thicknessTotal,0.0,height/2.0-(height-zOpening-heightOpening)/2.0,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Part3Vis3D.id,-0.0005-constructionData.thicknessTotal,-width/2.0+yOpening/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(surface1Part4Vis3D.id,-0.0005-constructionData.thicknessTotal,width/2.0-(width-yOpening-widthOpening)/2.0,-height/2.0+heightOpening/2.0+zOpening,update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Part1Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Part2Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Part3Vis3D.id, wallElementGroupVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.linkToObject(surface1Part4Vis3D.id, wallElementGroupVis3D.id);
      // wall
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(wallElementGroupVis3D.id, 0.0, -90.0+angleDegTil, -90.0-angleDegAzi, update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(wallElementGroupVis3D.id, xVis3D, yVis3D, zVis3D, update3d.frame);
      initDone := true;
    end if;
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_2.heatPort[1,1].T,minTempVis3D,maxTempVis3D);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface2Vis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(toSurfacePort_1.heatPort[1,1].T,minTempVis3D,maxTempVis3D);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialSurface1Vis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
  end when;
end WallThermal1DNodes_Vis3D;
