within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Text "An planar text object"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter String info = "";
  Integer dummy;

  function initText "Create a planar text object"
    input ExtID id;
    input String info;
    output Integer out;
    external "C" out=  M3D_New_Text(id,info);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initText;

algorithm
  when initial() then
    dummy := initText(id, info);
  end when;
end Text;
