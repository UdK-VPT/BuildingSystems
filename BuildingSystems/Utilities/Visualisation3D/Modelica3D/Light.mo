within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Light "A light"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Integer typ = 0;
  parameter Real r = 1.0;
  parameter Real g = 1.0;
  parameter Real b = 1.0;
  Integer dummy;

  function initLight "Create a light object"
    input ExtID id;
    input Integer typ;
    input Real  r;
    input Real  g;
    input Real  b;
    output Integer out;
    external "C" out=  M3D_New_Light(id,typ,r,g,b);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initLight;

algorithm
  when initial() then
    dummy := initLight(id,typ,r,g,b);
  end when;
end Light;
