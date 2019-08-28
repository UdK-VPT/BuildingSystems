within BuildingSystems.Technologies;
package ElectricalTransformers "direct current to alternating current transformer"
extends Modelica.Icons.Package;

annotation (Icon(graphics={
      Line(points={{-18,-46},{88,-46}}, color={0,0,0}),
      Line(points={{-18,-68},{28,-68}}, color={0,0,0}),
      Line(points={{42,-68},{88,-68}}, color={0,0,0}),
        Line(
          points={{-80,50},{-40,90},{0,10},{40,50}},
          color={0,0,0},
          visible=DynamicSelect(true, not
                                         (gridConnection)),
          smooth=Smooth.Bezier),
      Line(points={{-80,-46},{86,36}}, color={0,0,0})}));
end ElectricalTransformers;
