within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model CustomMesh "An custom mesh, included from a file"
  parameter String  name = "";
  ExtID id = ExtID(name);
  parameter String filePathAndName = "";
  Integer dummy;

  function initCustomMesh
    "Create a group object containing 3D objects imported from a file"
    input ExtID id;
    input String filePathAndName;
    output Integer out;
    external "C" out=  M3D_New_Custom_Mesh(id,filePathAndName);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initCustomMesh;

algorithm
  when initial() then
    dummy := initCustomMesh(id, filePathAndName);
  end when;
end CustomMesh;
