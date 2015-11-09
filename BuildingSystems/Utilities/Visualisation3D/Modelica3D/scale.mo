within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
function scale "Scale a geometric object"
  input ExtID objId;
  input Real x;
  input Real y;
  input Real z;
  input Integer frame;
  output Integer out;
  external "C" out = M3D_Scale(objId,x,y,z,frame);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end scale;
