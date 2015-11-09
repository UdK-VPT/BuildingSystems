within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Box "A 3D box object"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real length = 1.0;
  parameter Real width = 1.0;
  parameter Real height = 1.0;
  Integer dummy;

  function initBox "Create a box object"
    input ExtID id;
    input Real width;
    input Real length;
    input Real height;
    output Integer out;
    external "C" out=  M3D_New_Box(id,length,width,height);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initBox;

algorithm
  when initial() then
    dummy := initBox(id, length, width, height);
  end when;
end Box;
