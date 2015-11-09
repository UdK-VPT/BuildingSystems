within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Plane "A square plane"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real length = 1.0;
  Integer dummy;

  function initPlane "Create a plane object"
    input ExtID id;
    input Real length;
    output Integer out;
    external "C" out=  M3D_New_Plane(id,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initPlane;

algorithm
  when initial() then
    dummy := initPlane(id, length);
  end when;
end Plane;
