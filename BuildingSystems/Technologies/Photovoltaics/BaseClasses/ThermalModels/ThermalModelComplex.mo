within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ThermalModels;
model ThermalModelComplex
  "Complex thermal model, based on a multi-layered thermal model"
  parameter Modelica.SIunits.Length height
    "PV module height";
  parameter Modelica.SIunits.Length width
    "Module width";
  //BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete materialLayer1;
  //BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete materialLayer2;
  BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete materialLayer3;
  //BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete materialLayer4;
  //BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete materialLayer5;
  BuildingSystems.Interfaces.Temp_KInput TAmb
    "Ambient temperature"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={-68,20}), iconTransformation(extent={{-80,14},{-60,34}})));
  BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput ITot
    "Total irradiation in module plane"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={-68,-40}), iconTransformation(extent={{-80,-30},{-60,-10}})));
  BuildingSystems.Interfaces.Temp_KOutput TCel
    "Cell temperature"
     annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={80,0}), iconTransformation(extent={{60,-10},{80,10}})));
  /*BuildingSystems.HAM.HeatConduction.HeatConduction1D layer1(
    lengthX=0.001,
    lengthY=width,
    lengthZ=height,
    material=materialLayer1)
    annotation (Placement(transformation(extent={{-40,-8},{-24,8}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D layer2(
    lengthX=0.001,
    lengthY=width,
    lengthZ=height,
    material=materialLayer2)
    annotation (Placement(transformation(extent={{-24,-8},{-8,8}}))); */
  BuildingSystems.HAM.HeatConduction.HeatConduction1D layer3(
    lengthX=0.001,
    lengthY=width,
    lengthZ=height,
    material=materialLayer3)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}})));
  /* BuildingSystems.HAM.HeatConduction.HeatConduction1D layer4(
    lengthX=0.001,
    lengthY=width,
    lengthZ=height,
    material=materialLayer4)
    annotation (Placement(transformation(extent={{8,-8},{24,8}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D layer5(
    lengthX=0.001,
    lengthY=width,
    lengthZ=height,
    material=materialLayer5)
    annotation (Placement(transformation(extent={{24,-8},{40,8}}))); */
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-62,-6},{-50,6}})));
  Modelica.Blocks.Math.Gain areaModul(
    k=height*width)
    annotation (Placement(transformation(extent={{-40,-46},{-28,-34}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow solarHeat
    annotation (Placement(transformation(extent={{-22,-46},{-10,-34}})));
  Modelica.Thermal.HeatTransfer.Fahrenheit.TemperatureSensor sensTCel
    annotation (Placement(transformation(extent={{46,-6},{58,6}})));
equation
  connect(TAmb, prescribedTemperature.T)
   annotation (Line(points={{-68,20},{-66,20},{-66,0},{-63.2,0}}, color={0,0,127}));
  /* connect(prescribedTemperature.port, layer1.heatPort_x1)
    annotation (Line(points={{-50,0},{-38.4,0}}, color={191,0,0}));
  connect(layer1.heatPort_x2, layer2.heatPort_x1)
    annotation (Line(points={{-25.6,0},{-22.4,0}}, color={191,0,0}));
  connect(layer2.heatPort_x2, layer3.heatPort_x1)
    annotation (Line(points={{-9.6,0},{-6.4,0}}, color={191,0,0}));
  connect(layer3.heatPort_x2, layer4.heatPort_x1)
    annotation (Line(points={{6.4,0},{9.6,0}}, color={191,0,0}));
  connect(layer4.heatPort_x2, layer5.heatPort_x1)
    annotation (Line(points={{22.4,0},{25.6,0}}, color={191,0,0}));
  connect(prescribedTemperature.port, layer5.heatPort_x2)
    annotation (Line(points={{-50,0},{-44,0},{-44,-20},{42,-20},{42,0},{38.4,0}}, color={191,0,0})); */
  connect(ITot, areaModul.u)
    annotation (Line(points={{-68,-40},{-41.2,-40}}, color={0,0,127}));
  connect(areaModul.y, solarHeat.Q_flow)
    annotation (Line(points={{-27.4,-40},{-24.7,-40},{-22,-40}}, color={0,0,127}));
  connect(solarHeat.port, layer3.heatPort_source)
    annotation (Line(points={{-10,-40},{0,-40},{0,-0.16}}, color={191,0,0}));
  connect(sensTCel.T, TCel)
    annotation (Line(points={{58,0},{80,0},{80,0}}, color={0,0,127}));
  connect(sensTCel.port, layer3.heatPort_source)
    annotation (Line(points={{46,0},{46,0},{46,20},{0,20},{0,-0.16}}, color={191,0,0}));
  connect(prescribedTemperature.port, layer3.heatPort_x1)
    annotation (Line(points={{-50,0},{-6.4,0},{-6.4,0}}, color={191,0,0}));
  connect(layer3.heatPort_x2, prescribedTemperature.port)
    annotation (Line(points={{6.4,0},{6.4,0},{12,0},{12,-12},{-40,-12},{-40,0},{-50,0}},color={191,0,0}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255})}));
end ThermalModelComplex;
