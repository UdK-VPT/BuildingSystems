within BuildingSystems.Utilities.Visualisation3D.Examples;
model Building3DPerformanceVis3D
  extends Modelica.Icons.Example;
  extends BuildingSystems.Utilities.Visualisation3D.ModelVis3D(updateInterval=
        0.1);
  parameter Integer nBuildings = 400;
  BuildingVis3D building[nBuildings];
  Integer x(start = 1);
  Integer y(start = 1);
algorithm
  when update3d.send then
    if not initDone then
      for i in 1:nBuildings loop
        BuildingSystems.Utilities.Visualisation3D.Modelica3D.translate(
          building[i].buildingElementGroupVis3D.id,
          10.0*x,
          10.0*y,
          0.0,
          update3d.frame);
        x := x + 1;
        if x == 21 then
          y:= y + 1;
          x:= 1;
        end if;
      end for;
      initDone := true;
    end if;
  end when;
end Building3DPerformanceVis3D;
