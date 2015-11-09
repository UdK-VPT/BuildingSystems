within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model VisConfig
  model ExtVisConfig "External visualization config  object"
    extends ExternalObject;

    function constructor "Allocation of an VisConfig object"
      input Boolean waitForSimulation;
      input Boolean minimalGUI;
      input Boolean playAnim;
      input Boolean renderAvi;
      input String aviPath;
      output ExtVisConfig config;
      external "C" config = M3D_New_Config(waitForSimulation,minimalGUI,playAnim,renderAvi,aviPath);
      annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
    end constructor;

    function destructor "Release of VisConfig object"
      input ExtVisConfig config;
      external "C" M3D_Del_Config(config);
      annotation(Include = "#include <Modelica3D.h>", Library = {"modelica3d"});
    end destructor;
  end ExtVisConfig;

  input Boolean waitForSimulation = true;
  input Boolean minimalGUI = false;
  input Boolean playAnim = false;
  input Boolean renderAvi = false;
  input String aviPath = "";
  ExtVisConfig config = ExtVisConfig(waitForSimulation,minimalGUI,playAnim,renderAvi,aviPath);
end VisConfig;
