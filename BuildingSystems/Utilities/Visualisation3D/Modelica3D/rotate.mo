within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
function rotate "Rotate a geometric object"
  input ExtID objId;
  input Real x;
  input Real y;
  input Real z;
  input Integer frame;
  output Integer out;
  external "C" out = M3D_Rotate(objId,x,y,z,frame);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end rotate;
