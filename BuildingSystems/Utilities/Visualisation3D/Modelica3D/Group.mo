within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Group "A 3D group object"
  parameter String name = "";
  ExtID id = ExtID(name);
  Integer dummy;

  function initGroup "Create a group object"
    input ExtID objId;
    output Integer out;
    external "C" out=  M3D_New_Group(objId);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initGroup;

algorithm
  when initial() then
    dummy := initGroup(id);
  end when;
end Group;
