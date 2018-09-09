within BuildingSystems.Climate.WeatherData.BaseClasses;
partial block WeatherDataFileASCII
  "Template for weather data files (ASCII format)"
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral;
  parameter String filNam=""
    "Name of weather data file"
    annotation (Dialog(loadSelector(filter="Weather files (*.mos)",caption="Select weather file")));
  parameter String tabNam
    "Table name in ASCII file";
  parameter Integer columns[7]
    "Columns of table in ASCII file to be interpolated";
  parameter Real scaleFac[7] = {1.0,1.0,1.0,1.0,1.0,1.0,1.0}
    "Scaling factor for ASCII file values";
  parameter Real timeFac = 1.0
    "Time scale factor for ASCII file";
  parameter Real deltaTime = 0.0
    "Time shift factor for ASCII file values";
protected
  BuildingSystems.BoundaryConditions.WeatherData.BaseClasses.ConvertTime conTim
    "Convert simulation time to calendar time"
    annotation (Placement(transformation(extent={{-70,-16},{-50,4}})));
  BuildingSystems.Utilities.Time.ModelTime modTim "Model time"
    annotation (Placement(transformation(extent={{-100,-16},{-80,4}})));
  Modelica.Blocks.Tables.CombiTable1Ds datRea(
    final tableName=tabNam,
    final tableOnFile=true,
    final fileName=filNam,
    final columns=columns,
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
    "Data reader"
    annotation (Placement(transformation(extent={{26,-10},{46,10}})));
  Modelica.Blocks.Math.Gain gain(k=timeFac)
    annotation (Placement(transformation(extent={{-4,-10},{16,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  Modelica.Blocks.Sources.Constant timeShift(k=deltaTime)
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
equation
  IrrDirHor=BuildingSystems.Utilities.Math.Functions.smoothMax((datRea.y[1]-datRea.y[2])*scaleFac[1],0.0,0.1);
  IrrDifHor=BuildingSystems.Utilities.Math.Functions.smoothMax(datRea.y[2]*scaleFac[2],0.0,0.1);
  tAirRef=datRea.y[3]*scaleFac[3];
  vWindRef=BuildingSystems.Utilities.Math.Functions.smoothMax(datRea.y[4]*scaleFac[4],0.0,0.1);
  angleDegWindRef=datRea.y[5]*scaleFac[5];
  phiAir=BuildingSystems.Utilities.Math.Functions.smoothMax(datRea.y[6]*scaleFac[6],0.0,0.1);
  cloudCover=BuildingSystems.Utilities.Math.Functions.smoothMax(datRea.y[7]*scaleFac[7],0.0,0.1);

  connect(modTim.y, conTim.modTim)
    annotation (Line(points={{-79,-6},{-72,-6}},color={0,0,127}));
  connect(timeShift.y, add.u1)
    annotation (Line(points={{-49,30},{-36,30},{-36,6}}, color={0,0,127}));
  connect(gain.y, datRea.u)
    annotation (Line(points={{17,0},{24,0}}, color={0,0,127}));
  connect(add.y, gain.u)
    annotation (Line(points={{-13,0},{-6,0}}, color={0,0,127}));
  connect(conTim.calTim, add.u2)
    annotation (Line(points={{-49,-6},{-36,-6}}, color={0,0,127}));

  annotation (Icon(graphics={
    Rectangle(extent={{-100,-100},{100,100}},lineColor={0,0,127},fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Text(extent={{-150,150},{150,110}},textString="%name",lineColor={0,0,255}),
    Text(extent={{-90,88},{90,-92}},lineColor={28,108,200},textString="A")}),
Documentation(info="<html>
<p>
This is a partial model for reading weather data sets in ASCII data format.
</p>
</html>", revisions="<html>
<ul>
<li>
September 9, 2018 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WeatherDataFileASCII;
