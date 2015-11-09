within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Cone "A 3D cone object"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real diameter = 1.0;
  parameter Real length = 1.0;
  Integer dummy;

  function initCone "Create a cone object"
    input ExtID id;
    input Real diameter;
    input Real length;
    output Integer out;
    external "C" out=  M3D_New_Cone(id,diameter,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initCone;

algorithm
  when initial() then
    dummy := initCone(id, diameter, length);
  end when;
end Cone;
