within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector FluidHeatExt
  "HeatPort + dim, pos"
  //General variables
  Modelica.SIunits.Length[3] pos
    annotation (HideResult=true);
  Modelica.SIunits.Length[3] dim
    annotation (HideResult=true);
  Modelica.SIunits.Temp_K T;
  flow Modelica.SIunits.HeatFlowRate Q_flow;
    annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
      Rectangle(extent={{-100,100},{100,-100}},lineColor={191,0,0},fillColor={191,0,0},fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
      Rectangle(extent={{-50,50},{50,-50}},lineColor={191,0,0},fillColor={191,0,0},fillPattern=FillPattern.Solid),
      Text(extent={{-120,120},{100,60}},lineColor={191,0,0},textString="%name")}));
end FluidHeatExt;
