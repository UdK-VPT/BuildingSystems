within BuildingSystems.HAM.HeatAndMoistureTransport;
model HeatAndMoistureTransport1D
  "Model for combinend 1D heat conduction and moisture transport"
  extends BuildingSystems.HAM.HeatAndMoistureTransport.BaseClasses.HeatAndMoistureTransportGeneral;
  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.MoisturePort moisturePort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20})));
  BuildingSystems.Interfaces.MoisturePort moisturePort_x2
     annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20})));
  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Optional heat source at the hygro-thermal node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  Modelica.SIunits.Temp_K T(start = T_start)
    "Temperature of the hygro-thermal node";
  BuildingSystems.Types.RelativeHumidity phi
    "Relative humidity of numerical node";
  Modelica.SIunits.MassConcentration w(
    start=BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wSor(material.sorTabX,material.sorTabY,phi_start,material.wF,material.porosity))
    "Water content of the hygro-thermal node";
  Modelica.SIunits.MassConcentration wDerPhi1
    "Derivative of the water content by phi of the hygro-thermal node";
  Modelica.SIunits.MassConcentration w_x1
    "Water content on the surface at side x1";
  Modelica.SIunits.MassConcentration w_x2
    "Water content on the surface at side x2";
  BuildingSystems.Types.RelativeHumidity phi_x1
    "Relative humidity on the surface at side x1";
  BuildingSystems.Types.RelativeHumidity phi_x2
    "Relative humidity on the surface at side x2";
  Modelica.SIunits.ThermalConductance CTh(fixed=false)
    "Thermal conductance of the hygro-thermal node";
  BuildingSystems.Types.CoefficientOfMoistureDiffusion CMd
    "Moisture diffusion coefficient of the hygro-thermal node";
  BuildingSystems.Types.CoefficientOfLiquidTransport CLt
    "Liquid transport coefficient of the hygro-thermal node";
  Modelica.SIunits.MassFlowRate m_flow_wdr
    "Wind driven rain";
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the hygro-thermal node"
    annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Types.RelativeHumidity phi_start = 0.5
    "Start relative humidity of the hygro-thermal node"
    annotation (Dialog(tab="Initialization"));
protected
  parameter BuildingSystems.Types.VolumeHeatCapacity C = material.c * material.rho
    "Volume related heat capacity";
equation
  heatPort_source.T = T;

  // Thermal conductance coefficient
  CTh = 2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.lambdaMoist(material.lambdaTabX,material.lambdaTabY,material.lambdaDry,w) / lengthX * lengthY * lengthZ;

  // Moisture diffusion coefficient
  CMd = 2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.deltaL(T) / BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY,material.myDry,phi) / lengthX * lengthY * lengthZ;

  // Liquid transport coefficient
  CLt = 2.0 * (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX, material.dwsTabY, material.dwwTabX,material.dwwTabY,material.wF,w,m_flow_wdr,wDerPhi1)) / lengthX * lengthY * lengthZ;

  // Relative humidity of the numerical node
  phi = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor(sorTabX,sorTabY,w,material.wF,material.porosity);

  // Derivative by phi of the water content
  wDerPhi1 = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wDerPhi(w,sorTabX,sorTabY,material.wF,phi,material.porosity);

  // Energy balance of the numerical node
  lengthY * lengthZ * lengthX*((C + w * cH2O)*der(T) + cH2O * T * der(w)) =
    CTh * heatPort_x1.T - 2.0 * CTh * T + CTh * heatPort_x2.T + heatPort_source.Q_flow
    + Hv * (CMd * min(phi_x1,phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
    - (CMd + CMd) * phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T)
    + CMd * min(phi_x2,phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T));

  // Heat flux side 1
  heatPort_x1.Q_flow =
    CTh * (heatPort_x1.T - T)
    + Hv * (CMd * (phi_x1 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T) - phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T)));

  // Heat flux side 2
  heatPort_x2.Q_flow =
    CTh * (heatPort_x2.T - T)
    + Hv * (CMd * (phi_x2 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T) - phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T)));

  // Moisture balance of the numerical node
  lengthY * lengthZ * lengthX * der(w) =
    CMd * min(phi_x1,phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
    - (CMd + CMd) * phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T)
    + CMd * min(phi_x2,phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T)
    + CLt * min(phi_x1,phiMax) - (CLt + CLt) * phi + CLt * min(phi_x2,phiMax);

  // Moisture flow rate at side 1
  moisturePort_x1.m_flow =
    CMd * (phi_x1 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T) - phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T))
    + CLt * (phi_x1 - phi);

  // Moisture flow rate at side 2
  moisturePort_x2.m_flow =
    CMd * (phi_x2 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T) - phi * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T))
    + CLt * (phi_x2 - phi);

  // Relative humidity at side 1 and side 2
  phi_x1 = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000.0,heatPort_x1.T,moisturePort_x1.x);
  phi_x2 = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000.0,heatPort_x2.T,moisturePort_x2.x);

  annotation(defaultComponentName = "heatConduction1DNodes",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={120,0,120},lineThickness=0.5,fillColor={120,0,120},fillPattern=FillPattern.Solid,textString="1")}));
end HeatAndMoistureTransport1D;
