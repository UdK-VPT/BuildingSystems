within BuildingSystems.HAM.HeatAndMoistureTransport;
model HeatAndMoistureTransport1DNodes
  "Model for combined 1D heat conduction and moisture transport and an optional additional discretisation"
  extends BuildingSystems.HAM.HeatAndMoistureTransport.BaseClasses.HeatAndMoistureTransportGeneral;
  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.MoisturePort moisturePort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20})));
  BuildingSystems.Interfaces.MoisturePort moisturePort_x2
     annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20})));
  BuildingSystems.Interfaces.HeatPort heatPort_source[nNodesX]
    "Optional heat source at the numerical node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  Modelica.SIunits.Temp_K T[nNodesX](each start = T_start)
    "Temperature of the numerical node";
  BuildingSystems.Types.RelativeHumidity phi[nNodesX]
    "Relative humidity of numerical node";
  Modelica.SIunits.MassConcentration w[nNodesX](
    each start = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wSor(material.sorTabX,material.sorTabY,phi_start,material.wF,material.porosity))
    "Water content of the numerical node";
  Modelica.SIunits.MassConcentration wDerPhi1[nNodesX]
    "Derivative of the water content by phi of the numerical node";
  BuildingSystems.Types.RelativeHumidity phi_x1
    "Relative humidity on the surface at side x1";
  BuildingSystems.Types.RelativeHumidity phi_x2
    "Relative humidity on the surface at side x2";
  Modelica.SIunits.ThermalConductance CTh[nNodesX+1](each fixed=false)
    "Thermal conductance of the numerical node";
  BuildingSystems.Types.CoefficientOfMoistureDiffusion CMd[nNodesX+1]
    "Moisture diffusion coefficient of the numerical node";
  BuildingSystems.Types.CoefficientOfLiquidTransport CLt[nNodesX+1]
    "Liquid transport coefficient of the numerical node";
  Real Modelica.SIunits.MassFlowRate m_flow_wdr = 0.0
    "Wind driven rain";
  parameter Integer nNodesX = 1
    "Number of numerical nodes in the x dimension";
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the numerical nodes"
    annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Types.RelativeHumidity phi_start = 0.5
    "Start relative humidity of the numerical nodes"
    annotation (Dialog(tab="Initialization"));
protected
  parameter Modelica.SIunits.Length dx[nNodesX](
    each fixed = false);
  parameter BuildingSystems.Types.VolumeHeatCapacity C = material.c * material.rho
    "Volume related heat capacity";
initial algorithm
  for i in 1:nNodesX loop
    dx[i]:= lengthX / nNodesX;
  end for;

equation
  heatPort_source[1].T = T[1];

  if nNodesX > 1 then
    for i in 2:nNodesX-1 loop
      heatPort_source[i].T = T[i];
    end for;
    // last node side 2
    heatPort_source[nNodesX].T = T[nNodesX];
  end if;

  // Thermal conductance coefficient
  CTh[1] =
    2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.lambdaMoist(material.lambdaTabX, material.lambdaTabY, material.lambdaDry, w[1]) / dx[1] * lengthY * lengthZ;
  for i in 2:nNodesX loop
    CTh[i] =
      1.0 / (dx[i]/ 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.lambdaMoist(material.lambdaTabX, material.lambdaTabY, material.lambdaDry, w[i]))
      + dx[i] / 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.lambdaMoist(material.lambdaTabX, material.lambdaTabY, material.lambdaDry, w[i-1]))) * lengthY * lengthZ;
  end for;
  CTh[nNodesX+1] =
    2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.lambdaMoist(material.lambdaTabX, material.lambdaTabY, material.lambdaDry, w[nNodesX]) / dx[nNodesX] * lengthY * lengthZ;

  // Moisture diffusion coefficient
  CMd[1] =
    2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.deltaL(T[1]) / BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY, material.myDry, phi[1])/dx[1] * lengthY * lengthZ;
  for i in 2:nNodesX loop
    CMd[i] =
      1.0 / (dx[i] / 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.deltaL(T[i]) / BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY, material.myDry, phi[i]))
      + dx[i] / 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.deltaL(T[i-1]) / BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY, material.myDry, phi[i-1]))) * lengthY * lengthZ;
  end for;
  CMd[nNodesX+1] =
    2.0 * BuildingSystems.HAM.HeatAndMoistureTransport.Functions.deltaL(T[nNodesX]) / BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY, material.myDry, phi[nNodesX]) / dx[nNodesX] * lengthY * lengthZ;

  // Liquid transport coefficient
  CLt[1] =
    2.0 * (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX,material.dwsTabY,material.dwwTabX,material.dwwTabY,material.wF,w[1],m_flow_wdr,wDerPhi1[1]))/dx[1] * lengthY * lengthZ;
  for i in 2:nNodesX loop
    CLt[i] =
      1.0 / (dx[i] / 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX,material.dwsTabY,material.dwwTabX,material.dwwTabY,material.wF,w[i],m_flow_wdr,wDerPhi1[i]))
      + dx[i] / 2.0 / (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX,material.dwsTabY,material.dwwTabX,material.dwwTabY,material.wF,w[i-1],m_flow_wdr,wDerPhi1[i-1]))) * lengthY * lengthZ;
  end for;
  CLt[nNodesX+1] =
    2.0 * (BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX,material.dwsTabY,material.dwwTabX,material.dwwTabY,material.wF,w[nNodesX],m_flow_wdr,wDerPhi1[nNodesX]))/dx[nNodesX] * lengthY * lengthZ;

  // Relative humidity of the numerical nodes
  for i in 1:nNodesX loop
    phi[i] = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor(sorTabX,sorTabY,w[i],material.wF,material.porosity);
  end for;

  // Derivative by phi of the water content
  for i in 1:nNodesX loop
    wDerPhi1[i] = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wDerPhi(w[i],sorTabX,sorTabY,material.wF,phi[i],material.porosity);
  end for;

  // Energy balance of each numerical node
  if nNodesX > 1 then
    lengthY * lengthZ * dx[1]*((C + w[1] * cH2O) * der(T[1]) + cH2O * T[1] * der(w[1])) =
      CTh[1] * heatPort_x1.T - (CTh[1] + CTh[2]) * T[1] + CTh[2] * T[2] + heatPort_source[1].Q_flow
      + Hv*(CMd[1] * min(phi_x1,phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
      - (CMd[1] + CMd[2]) * phi[1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1])
      + CMd[2] * phi[2] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[2]));
    for i in 2:nNodesX-1 loop
      lengthY * lengthZ * dx[i]*((C + w[i] * cH2O) * der(T[i]) + cH2O * T[i] * der(w[i])) =
        CTh[i] * T[i-1] - (CTh[i] + CTh[i+1]) * T[i] + CTh[i+1] * T[i+1] + heatPort_source[i].Q_flow
        + Hv*(CMd[i] * phi[i-1] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i-1])
        - (CMd[i] + CMd[i+1]) * phi[i] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i])
        + CMd[i+1] * phi[i+1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i+1]));
    end for;
    lengthY * lengthZ * dx[nNodesX]*((C + w[nNodesX] * cH2O)*der(T[nNodesX])+ cH2O * T[nNodesX] * der(w[nNodesX])) =
      CTh[nNodesX] * T[nNodesX-1] - (CTh[nNodesX] + CTh[nNodesX+1]) * T[nNodesX] + CTh[nNodesX+1] * heatPort_x2.T + heatPort_source[nNodesX].Q_flow
      + Hv*(CMd[nNodesX] * phi[nNodesX-1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX-1])
      - (CMd[nNodesX] + CMd [nNodesX+1]) * phi [nNodesX] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX])
      + CMd[nNodesX+1] * min(phi_x2,  phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T));
  else
    // Case with one node
    lengthY * lengthZ * dx[1]*((C + w[1] * cH2O)*der(T[1]) + cH2O * T[1]*der(w[1])) =
      CTh[1] * heatPort_x1.T - 2.0 * CTh[1] * T[1] + CTh[2] * heatPort_x2.T + heatPort_source[1].Q_flow
      + Hv*(CMd[1] * min(phi_x1,  phiMax)* BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
      - (CMd[1] + CMd[2]) * phi[1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1])
      + CMd[2] * min(phi_x2, phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T));
  end if;

  // Heat flux side 1
  heatPort_x1.Q_flow =
    CTh[1] * (heatPort_x1.T - T[1])
    + Hv * (CMd[1] * (phi_x1 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T) - phi[1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1])));

  // Heat flux side 2
  heatPort_x2.Q_flow =
    CTh[nNodesX+1] * (heatPort_x2.T - T[nNodesX])
      + Hv * (CMd[nNodesX+1] * (phi_x2 * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T) - phi[nNodesX] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX])));

  // Moisture balance of each numerical node
  if nNodesX > 1 then
    lengthY * lengthZ * dx[1] * der(w[1]) =
      CMd[1] * min(phi_x1,  phiMax) * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
        - (CMd[1] + CMd[2]) * phi[1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1])
        + CMd[2] * phi[2] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[2])
        + CLt [1] * min(phi_x1,  phiMax) - (CLt[1] + CLt[2]) * phi[1] + CLt[2] * phi[2];
    for i in 2:nNodesX-1 loop
      lengthY * lengthZ * dx[i] * der(w[i]) =
        CMd[i] * phi[i-1] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i-1])
        - (CMd[i] + CMd[i+1]) * phi[i] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i])
        + CMd[i+1] * phi[i+1] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[i+1])
        + CLt[i] * phi[i-1] - (CLt[i] + CLt[i+1]) * phi[i] + CLt[i+1] * phi[i+1];
    end for;
    lengthY * lengthZ * dx[nNodesX] * der(w[nNodesX]) =
      CMd[nNodesX] * phi[nNodesX-1] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX-1])
      - (CMd[nNodesX] + CMd[nNodesX+1]) * phi[nNodesX] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX])
      + CMd[nNodesX+1] * min(phi_x2,phiMax) *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T)
      + CLt[nNodesX] * phi[nNodesX-1] - (CLt[nNodesX] + CLt[nNodesX+1]) * phi[nNodesX] + CLt[nNodesX+1] * min(phi_x2,phiMax);
  else
    // Case with one node
    lengthY * lengthZ * dx[1] * der(w[1]) =
      CMd[1] *  min(phi_x1,phiMax) *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T)
      - (CMd[1] + CMd[2]) * phi[1] *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1])
      + CMd[2] * min(phi_x2,phiMax) *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T)
      + CLt[1] * min(phi_x1,phiMax) - (CLt[1] + CLt[2]) * phi[1] + CLt[2] * min(phi_x2,phiMax);
  end if;

  // Moisture flow rate at side 1
  moisturePort_x1.m_flow =
    CMd[1] * (phi_x1 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x1.T) - phi[1] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[1]))
    + CLt[1] * (phi_x1 - phi[1]);

  // Moisture flow rate at side 2
  moisturePort_x2.m_flow =
    CMd[nNodesX+1] * (phi_x2 *  BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(heatPort_x2.T) - phi[nNodesX] * BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(T[nNodesX]))
    + CLt[nNodesX+1] * (phi_x2 - phi[nNodesX]);

  // Relative humidity at side 1 and side 2
  phi_x1 = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000.0,heatPort_x1.T,moisturePort_x1.x);
  phi_x2 = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000.0,heatPort_x2.T,moisturePort_x2.x);

  annotation(defaultComponentName = "heatConduction1DNodes",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={120,0,120},lineThickness=0.5,fillColor={120,0,120},fillPattern=FillPattern.Solid,textString="1"),
    Line(points={{-40,80},{-40,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{40,80},{40,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{0,80},{0,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{-80,80},{-80,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{80,80},{80,-80}},color={135,135,135},smooth=Smooth.None,thickness=1)}));
end HeatAndMoistureTransport1DNodes;
