within BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels;
partial model OpticalModelGeneral
  "Optical model calculates the reduction of the solar irradiation between the surface of the PV module and the PV cell"
  input Modelica.Blocks.Interfaces.RealInput GSC(min=0.0,max=1.0)
    "Geometrical shading coefficient"
    annotation (Placement(transformation(extent={{-88,0},{-48,40}}), iconTransformation(extent={{-68,20},{-48,40}})));
  output BuildingSystems.Interfaces.RadiantEnergyFluenceRateOutput ITotRed
    "Reduced total solar radiation on module plane inclusive shading effects."
    annotation (Placement(transformation(extent={{60,-10},{80,10}}),iconTransformation(extent={{60,-10},{80,10}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    "Solar radiation on module plane"
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}}), iconTransformation(extent={{-70,-10},{-50,10}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
    Rectangle(extent={{-2,40},{2,-40}},lineColor={28,108,200},fillColor={0,0,255},fillPattern=FillPattern.Solid),
    Line(points={{-40,0},{-2,0}},color={255,255,0},arrow={Arrow.None,Arrow.Filled},thickness=0.5)}),
Documentation(info="<html>
<p>
Basic optical model that calculates the reduction of the solar irradiation between the surface
of the PV module and the PV cell.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpticalModelGeneral;
