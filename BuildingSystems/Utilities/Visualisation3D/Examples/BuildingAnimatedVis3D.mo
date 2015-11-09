within BuildingSystems.Utilities.Visualisation3D.Examples;
model BuildingAnimatedVis3D
  extends BuildingVis3D;
  Modelica.SIunits.Length z(start = 0.0);
algorithm
  when update3d.send then
    BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(
      roof.shapeVis3D.id,
      0.0,
      0.0,
      z,
      update3d.frame);
  end when;

equation
  z = height_inside+0.5*thickness_groundplate + 2.0 + 2.0*Modelica.Math.sin(0.2*time);
  annotation(experiment(StartTime=0.0, StopTime=100.0),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-20},{0,80}}),graphics));
end BuildingAnimatedVis3D;
