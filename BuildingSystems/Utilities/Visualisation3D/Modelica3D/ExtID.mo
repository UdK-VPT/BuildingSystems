within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
class ExtID "Unique references to 3D objects"
  extends ExternalObject;

  function constructor "Allocation of uniqueID"
    input String  idName;
    output ExtID  id;
    external "C" id=  M3D_New_ID(idName);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end constructor;

  function destructor "Release of uniqueID"
    input ExtID id;
    external "C" M3D_Del_ID(id);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end destructor;
end ExtID;
