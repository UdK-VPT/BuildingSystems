within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
function setFrameTime "Set the time of a given frame"
  input Integer frame;
  input Real ctime;
  output Integer out;
  external "C" out = M3D_Set_Frame_Time(frame, ctime);
  annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
end setFrameTime;
