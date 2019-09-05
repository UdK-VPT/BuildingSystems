within BuildingSystems.Technologies.ElectricalTransformers.Examples;
model GridTrading "test to evaluate combination of battery and transformers"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.ElectricalTransformers.DCACTransformer
                  DCAC_load(
    P_nom=100,
    eta_max=0.92,
    gridConnection=false)
    annotation (Placement(transformation(extent={{-26,-18},{10,18}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=200,
    startTime=0,
    duration=200,
    offset=0)     annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={26,0})));
  ElectricalStorages.BatteryComplexIU battery(redeclare
      ElectricalStorages.Data.LeadAcid.Chloride200Ah batteryData,
      SOC_start=0.7)
    annotation (Placement(transformation(extent={{-66,-4},{-30,32}})));
  Modelica.Blocks.Sources.Pulse gain(
    width=50,
    period=72000,
    amplitude=battery.batteryData.PCharge_max/battery.batteryData.etaCharge,
    offset=0,
    startTime=3700)
    annotation (Placement(transformation(extent={{-98,4},{-78,24}})));
  BuildingSystems.Technologies.ElectricalTransformers.DCACTransformer
                  DCAC_grid(
    P_nom=1000,
    eta_max=0.91,
    gridConnection=true)
    annotation (Placement(transformation(extent={{10,16},{-26,52}})));
equation
  connect(ramp.y, DCAC_load.P1) annotation (Line(
      points={{15,0},{1.72,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(DCAC_load.P2, battery.PLoad) annotation (Line(points={{-17,0},{-28,0},
          {-28,14},{-39,14}},                        color={0,0,127}));
  connect(gain.y, battery.PCharge)
    annotation (Line(points={{-77,14},{-57,14}},
                                               color={0,0,127}));
  connect(battery.PGrid, DCAC_grid.P1) annotation (Line(points={{-38.28,21.2},{
          -28,21.2},{-28,34},{-17.72,34}},
                                       color={0,0,127}));
  annotation (__Dymola_Commands(file=
          "Resources/Scripts/Dymola/Technologies/ElectricalTransformers/Examples/GridTrading.mos"
        "Simulate and Plot"));
end GridTrading;
