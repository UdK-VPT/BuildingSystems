within BuildingSystems.HAM;
model GasGapClosed
  "Combined convective heat transfer and long-wave radiation exchange within a closed gas gap"
  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-20,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-20,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={20,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={20,0})));
  parameter Modelica.SIunits.Length width
    "Width of the gap"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length height
    "Height of the gap"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length distance
    "Distance of the gap"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Integer gas = 1
    "Gas within the gap: 1:air, 2:argon, 3:krypton, 4:xenon, 5:SF6"
    annotation(Dialog(tab = "General", group = "Convection"));
  parameter Modelica.SIunits.Area A = width * height
    "Area of one side of the gap"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Emissivity eps1 = 0.9
    "Long-wave emission coefficient of surface 1"
    annotation(Dialog(tab = "General", group = "Heat Radiation"));
  parameter Modelica.SIunits.Emissivity eps2 = 0.9
    "Long-wave emission coefficient of surface 2"
    annotation(Dialog(tab = "General", group = "Heat Radiation"));
  parameter Boolean calcNominal = false
    "True: heat transfer calculation under nominal conditions";
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha_nominal = 1.0
    "Convective heat transfer coefficient of the air gap under nominal conditions"
    annotation(Dialog(tab = "General", group = "Convection"));
  parameter Modelica.SIunits.Temp_K T1_nominal = 283.15 - 5.0
    "Temperature on surface 1 under nominal conditions";
  parameter Modelica.SIunits.Temp_K T2_nominal = 283.15 + 5.0
    "Temperature on surface 2 under nominal conditions";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha
    "Convective heat transfer coefficient of the air gap";
equation
  if calcNominal then
    alpha = alpha_nominal * BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(heatPort_x1.T,heatPort_x2.T,distance,height,gas)
      / BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(T1_nominal,T2_nominal,distance,height,gas);
  else
    alpha = BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(heatPort_x1.T,heatPort_x2.T,distance,height,gas);
  end if;
  heatPort_x1.Q_flow = (alpha * (heatPort_x1.T - heatPort_x2.T)
    + BuildingSystems.HAM.HeatRadiation.HeatRadiationTwoParallelSurfaces(heatPort_x2.T,heatPort_x1.T,eps1,eps2)) * A;
  heatPort_x2.Q_flow = - heatPort_x1.Q_flow;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-20,80},{20,-80}},
          pattern=LinePattern.None,
          lineColor={0,0,0},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-20,80},{-20,-80}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Line(
          points={{20,80},{20,-80}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),
        Text(extent={{4,-74},{96,-102}}, lineColor={0,0,255},fillColor={230,230,230},
            fillPattern = FillPattern.Solid,textString = "%name"),
        Ellipse(
          extent={{-18,68},{18,32}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-34},{18,-70}},
          lineColor={0,0,255},
          lineThickness=0.5,
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-6,74},{0,68}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,68},{-6,62}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{6,38},{0,32}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,32},{6,26}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,-34},{-6,-40}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-6,-28},{0,-34}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{6,-64},{0,-70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{0,-70},{6,-76}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-16,20},{16,20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-10,26},{-16,20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-16,20},{-10,14}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{10,26},{16,20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{16,20},{10,14}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-10,-14},{-16,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-16,-20},{-10,-26}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{-16,-20},{16,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{10,-14},{16,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None),
        Line(
          points={{16,-20},{10,-26}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None)}));
end GasGapClosed;
