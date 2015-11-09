within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Material "A material object"
  parameter String name = "";
  ExtID id = ExtID(name);
  parameter Real r = 1.0;
  parameter Real g = 1.0;
  parameter Real b = 1.0;
  Integer dummy;

  function initMaterial "Creates a material object"
    input ExtID id;
    input Real  r;
    input Real  g;
    input Real  b;
    output Integer out;
    external "C" out=  M3D_New_Material(id,r,g,b);
    annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
  end initMaterial;

algorithm
  when initial() then
    dummy := initMaterial(id, r, g, b);
  end when;
end Material;
