within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
function linkToObject "Link object as child of parent object"
  input ExtID childId;
  input ExtID parentId;
  output Integer out;
  external "C" out = M3D_Link_To_Object(childId, parentId);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end linkToObject;
