within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Camera "A camera"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real fov = 90.0;
  Integer dummy;

  function initCamera "Create a camera object"
    input ExtID id;
    input Real fov;
    output Integer out;
    external "C" out=  M3D_New_Camera(id,fov);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initCamera;

algorithm
  when initial() then
    dummy := initCamera(id, fov);
  end when;
end Camera;
