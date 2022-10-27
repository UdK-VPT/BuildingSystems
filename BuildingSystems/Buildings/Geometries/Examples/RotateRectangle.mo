within BuildingSystems.Buildings.Geometries.Examples;
model RotateRectangle
  "Calculation of the geometrical properties of a rectangle which is rotated around the three coordinate axis"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Geometries.BaseClasses.Rectangle rect(
    width = 1.0,
    height = 3.0,
    zMean = 0.0,
    angleDegAzi = 0.0,
    angleDegTil = 0.0,
    vertex1={0.0,rect.width,0.0},
    vertex2={rect.height,rect.width,0.0},
    vertex3={rect.height,0.0,0.0},
    vertex4={0.0,0.0,0.0})
    "Rectangle in the x-y plane";
  BuildingSystems.Buildings.Geometries.BaseClasses.Rectangle rectRotXAxis(
    width = rect.width,
    height = rect.height,
    zMean = Modelica.Math.sin(Modelica.Constants.pi/180.0*rectRotXAxis.angleDegTil)*rect.height,
    angleDegAzi = 0.0,
    angleDegTil = angleDegRot,
    vertex1=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex1,{1.0,0.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex2=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex2,{1.0,0.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex3=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex3,{1.0,0.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex4=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex4,{1.0,0.0,0.0},Modelica.Constants.pi/180.0*angleDegRot))
    "Rectangle in rotation around the x-axis";
  BuildingSystems.Buildings.Geometries.BaseClasses.Rectangle rectRotYAxis(
    width = rect.width,
    height = rect.height,
    zMean = Modelica.Math.sin(Modelica.Constants.pi/180.0*rectRotYAxis.angleDegTil)*rect.height,
    angleDegAzi = 90.0,
    angleDegTil = angleDegRot,
    vertex1=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex1,{0.0,1.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex2=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex2,{0.0,1.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex3=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex3,{0.0,1.0,0.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex4=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex4,{0.0,1.0,0.0},Modelica.Constants.pi/180.0*angleDegRot))
    "Rectangle in rotation around the y-axis";
  BuildingSystems.Buildings.Geometries.BaseClasses.Rectangle rectRotZAxis(
    width = rect.width,
    height = rect.height,
    zMean = Modelica.Math.sin(Modelica.Constants.pi/180.0*rectRotZAxis.angleDegTil)*rect.height,
    angleDegAzi = angleDegRot,
    angleDegTil = 0.0,
    vertex1=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex1,{0.0,0.0,1.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex2=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex2,{0.0,0.0,1.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex3=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex3,{0.0,0.0,1.0},Modelica.Constants.pi/180.0*angleDegRot),
    vertex4=BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      rect.vertex4,{0.0,0.0,1.0},Modelica.Constants.pi/180.0*angleDegRot))
    "Rectangle in rotation around the z-axis";
  Modelica.Units.NonSI.Angle_deg angleDegRot;
equation
  angleDegRot = 90.0*Modelica.Math.sin(time);

  annotation(experiment(StartTime=0, StopTime=1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Geometries/Examples/RotateRectangle.mos" "Simulate and plot"),
Documentation(info="<html>
<p>
Example that demonstrates the calculation of the geometrical properties
of a rectangle which is rotated around the three coordinate axis.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 5, 2022, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end RotateRectangle;
