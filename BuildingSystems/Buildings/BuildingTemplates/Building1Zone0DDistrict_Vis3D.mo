within BuildingSystems.Buildings.BuildingTemplates;

model Building1Zone0DDistrict_Vis3D
  "Simplified low-order building for district simulation with 3D visualization"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D;
  parameter Real min_q_flow_heatingVis3D = 0.0;
  parameter Real max_q_flow_heatingVis3D = 200;

protected
  Real rVis3D, gVis3D, bVis3D;
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Box buildingVis3D(name = "building", length=length,width=width,height=heightSto*nSto);
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Material materialBuildingVis3D(name = "matBuilding",  r = 0.5, g = 0.5, b = 0.5);

  algorithm
  when update3d.send then
    if not initDone then
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.setObjectMaterial(buildingVis3D.id,materialBuildingVis3D.id);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.rotate(buildingVis3D.id, xAngleVis3D, yAngleVis3D, zAngleVis3D, update3d.frame);
      BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(buildingVis3D.id, xVis3D, yVis3D, 0.5*heightSto*nSto, update3d.frame);
      initDone := true;
    end if;
    (rVis3D,gVis3D,bVis3D) := BuildingSystems.Utilities.Visualisation3D.Modelica3D.RGB(q_flow_heating,min_q_flow_heatingVis3D,max_q_flow_heatingVis3D);
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.setMaterialColor(materialBuildingVis3D.id,rVis3D,gVis3D,bVis3D,update3d.frame);
  end when;
end Building1Zone0DDistrict_Vis3D;
