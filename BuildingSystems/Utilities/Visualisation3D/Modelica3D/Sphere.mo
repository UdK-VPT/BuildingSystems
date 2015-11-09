within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Sphere "A 3D sphere object"
  parameter String  name = "";
  ExtID id = ExtID(name);
  parameter Real diameter = 1.0;
  Integer dummy;

  function initSphere "Create a sphere object"
    input ExtID id;
    input Real diameter;
    output Integer out;
    external "C" out=  M3D_New_Sphere(id,diameter);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initSphere;

algorithm
  when initial() then
    dummy := initSphere(id, diameter);
  end when;
end Sphere;
