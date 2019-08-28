within BuildingSystems.Technologies.ElectricalTransformers.Examples;
model DCACTransformer
  "test to evaluate transformer performance curve"
  extends Modelica.Icons.Example;
  .BuildingSystems.Technologies.ElectricalTransformers.DCACTransformer DCAC(
    P_nom=100,
    eta_max=0.92,
    gridConnection=false)
    annotation (Placement(transformation(extent={{-26,-18},{10,18}})));
  Modelica.Blocks.Sources.Ramp ramp(
    startTime=0,
    offset=0,
    duration=2,
    height=200)   annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={26,0})));
equation
  connect(ramp.y, DCAC.P1) annotation (Line(
      points={{15,0},{1.72,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (__Dymola_Commands(file=
          "Resources/Scripts/Dymola/Technologies/ElectricalTransformers/Examples/DCACTransformer.mos"
        "Simulate and Plot"));
end DCACTransformer;
