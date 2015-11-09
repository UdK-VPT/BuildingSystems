within BuildingSystems;
package Climate "Package with climate data and radiation calculation models"
  extends Modelica.Icons.Package;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Ellipse(extent={{-40,40},{40,-40}}, lineColor={0,0,0}),
    Line(points={{0,40},{0,70},{0,72}}, color={0,0,0}),
    Line(points={{0,-72},{0,-42},{0,-40}}, color={0,0,0}),
    Line(
      points={{0,-16},{0,14},{0,16}},
      color={0,0,0},
      origin={56,0},
      rotation=90),
    Line(
      points={{0,-16},{0,14},{0,16}},
      color={0,0,0},
      origin={-56,0},
      rotation=90),
    Line(
      points={{-28,28},{-54,52}},
      color={0,0,0},
      smooth=Smooth.Bezier),
    Line(
      points={{28,28},{52,50}},
      color={0,0,0},
      smooth=Smooth.Bezier),
    Line(
      points={{29,-28},{51,-50}},
      color={0,0,0},
      smooth=Smooth.Bezier),
    Line(points={{-30,-26},{-54,-50}}, color={0,0,0})}));
end Climate;
