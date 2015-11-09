within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Cylinder "A 3D cylinder object"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real diameter = 1.0;
  parameter Real length = 1.0;
  Integer dummy;

  function initCylinder "Create a cylinder object"
    input ExtID id;
    input Real diameter;
    input Real length;
    output Integer out;
    external "C" out=  M3D_New_Cylinder(id,diameter,length);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initCylinder;

algorithm
  when initial() then
    dummy := initCylinder(id, diameter, length);
  end when;
end Cylinder;
