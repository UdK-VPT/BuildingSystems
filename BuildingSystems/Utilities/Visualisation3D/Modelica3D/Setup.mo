within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Setup
  model ExtSetup "External setup object"
    extends ExternalObject;

    function constructor "Allocation of a setup object"
      input Integer  logLevel;
      input Boolean  send;
      input Boolean  rawFile;
      output ExtSetup setup;
      external "C" setup = M3D_New_Setup(logLevel,send,rawFile);
      annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
    end constructor;

    function destructor "Release of setup object"
      input ExtSetup setup;
      external "C" M3D_Del_Setup(setup);
      annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
    end destructor;
  end ExtSetup;

  input Integer  logLevel = 0;
  input Boolean  send = true;
  input Boolean  rawFile = false;
  ExtSetup setup = ExtSetup(logLevel, send, rawFile);
end Setup;
