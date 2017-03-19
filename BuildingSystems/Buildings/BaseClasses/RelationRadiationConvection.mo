within BuildingSystems.Buildings.BaseClasses;
model RelationRadiationConvection
  "Model for distribution to radiative and convective heat flows"
  BuildingSystems.Interfaces.HeatPort heatPort
    "Heat Port"
    annotation (Placement(transformation(extent={{-66,-20},{-26,20}}),iconTransformation(extent={{-50,-20},{-10,20}})));
  BuildingSystems.Interfaces.HeatPort heatPortCv
    "Heat port for convective heat"
    annotation (Placement(transformation(extent={{30,10},{50,30}}), iconTransformation(extent={{30,10},{50,30}})));
  BuildingSystems.Interfaces.HeatPort heatPortLw
    "Heat port for radiative heat"
    annotation (Placement(transformation(extent={{30,-30},{50,-10}}),iconTransformation(extent={{30,-30},{50,-10}})));
  parameter Real radiationportion;
equation
  heatPortCv.Q_flow + (1.0 - radiationportion) * heatPort.Q_flow = 0.0;
  heatPortLw.Q_flow + radiationportion * heatPort.Q_flow = 0.0;
  heatPort.T = 293.15;

  annotation ( Icon(graphics={Rectangle(extent={{-40,40},{40,-40}},lineColor={215,215,215},fillColor={215,215,215},fillPattern=FillPattern.Solid),
    Text(extent={{-40,-34},{44,-68}},lineColor={0,0,255},textString="%name"),
    Line(points={{-10,0},{30,20},{30,20}},color={255,0,0},smooth=Smooth.None,thickness=1),
    Line(points={{-10,0},{30,-20}},color={255,0,0},thickness=1,smooth=Smooth.None)}),
Documentation(info="<html>
<p>
This model describes the distribution of a heat flow to its radiative and convective heat flows.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end RelationRadiationConvection;
