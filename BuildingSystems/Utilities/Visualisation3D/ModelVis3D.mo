within BuildingSystems.Utilities.Visualisation3D;
partial model ModelVis3D
  parameter Modelica.SIunits.Time updateInterval = 1.0
    "Update intervall for visualisation"
   annotation(Dialog(tab = "3D visualisation", group = "General"));
  parameter Modelica.SIunits.Length xVis3D = 0.0 "x-position"
    annotation(Dialog(tab = "3D visualisation", group = "Position"));
  parameter Modelica.SIunits.Length yVis3D = 0.0 "y-position"
    annotation(Dialog(tab = "3D visualisation", group = "Position"));
  parameter Modelica.SIunits.Length zVis3D = 0.0 "z-position"
    annotation(Dialog(tab = "3D visualisation", group = "Position"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg xAngleVis3D=0.0
    "Rotation angle x-axis"
    annotation (Dialog(tab="3D visualisation", group="Orientation"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg yAngleVis3D=0.0
    "Rotation angle y-axis"
    annotation (Dialog(tab="3D visualisation", group="Orientation"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg zAngleVis3D=0.0
    "Rotation angle z-axis"
    annotation (Dialog(tab="3D visualisation", group="Orientation"));
  parameter Real xScaleVis3D = 1.0 "Scale factor x-dimension"
    annotation(Dialog(tab = "3D visualisation", group = "Scaling"));
  parameter Real yScaleVis3D = 1.0 "Scale factor y-dimension"
    annotation(Dialog(tab = "3D visualisation", group = "Scaling"));
  parameter Real zScaleVis3D = 1.0 "Scale factor z-dimension"
    annotation(Dialog(tab = "3D visualisation", group = "Scaling"));
protected
   Boolean initDone(
     start = false) "True, if initialization done";
  BuildingSystems.Utilities.Visualisation3D.Modelica3D.Update3D update3d(
      updateInterval=updateInterval);
end ModelVis3D;
