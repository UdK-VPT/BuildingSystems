within BuildingSystems.Buildings.Comfort;
model ThermalComfort_DIN_EN_ISO_7730
  "Thermal comfort model regarding DIN EN ISO 7730"
  BuildingSystems.Interfaces.Temp_KInput TAir
    "Air temperature"
    annotation (Placement(transformation(extent={{-100,30},{-60,70}}),
      iconTransformation(extent={{-80,50},{-60,70}})));
  BuildingSystems.Interfaces.Temp_KInput Tr
    "Mean radiant temperature"
    annotation (Placement(transformation(extent={{-100,0},{-60,40}}),
      iconTransformation(extent={{-80,20},{-60,40}})));
  BuildingSystems.Interfaces.Moisture_absInput xAir
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{-100,-30},{-60,10}}),
      iconTransformation(extent={{-80,-10},{-60,10}})));
  BuildingSystems.Interfaces.VelocityInput vAir
    "Relative air velocity"
    annotation (Placement(transformation(extent={{-100,-60},{-60,-20}}),
      iconTransformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Interfaces.RealInput clo
    "Clothing"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=90,origin={-50,-80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-50,-70})));
  Modelica.Blocks.Interfaces.RealInput met
    "Metabolism rate"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=90,origin={-20,-80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,-70})));
  Modelica.Blocks.Interfaces.RealInput wme
    "External work"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=90,origin={10,-80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,-70})));
  Modelica.Blocks.Interfaces.RealOutput PMV
    "Predicted mean vote"
    annotation (Placement(transformation(extent={{80,50},{100,70}}),
      iconTransformation(extent={{80,50},{100,70}})));
  Modelica.Blocks.Interfaces.RealOutput PPD
    "Predicted percentage dissatisfied"
    annotation (Placement(transformation(extent={{80,20},{100,40}}),
      iconTransformation(extent={{80,20},{100,40}})));
  Modelica.SIunits.Temp_K Tcl = tcl + 273.15
    "Clothing surface temperature";
  Real M(unit="W/m2")
    "Metabolic rate";
  Real W(unit="W/m2")
    "Effective mechanical power";
protected
  Real fcl
    "Clothing surface area factor";
  Modelica.SIunits.CoefficientOfHeatTransfer hc
    "Convective heat transfer coefficient";
  Modelica.SIunits.ThermalInsulance Icl
    "Thermal insulation for clothing";
  Real hcf, hcn;
  Modelica.SIunits.Temp_C tcl
    "Clothing surface temperature";
equation
  M = met * 58.15;
  W = wme * 58.15;
  PMV = BuildingSystems.Buildings.Comfort.Functions.PMV_DIN_EN_ISO_7730(
    TAir,Tr,Tcl,xAir,M,W,fcl,hc);
  PPD = BuildingSystems.Buildings.Comfort.Functions.PPD_DIN_EN_ISO_7730(PMV);
  Icl = 0.155 * clo;
  if Icl < 0.078 then
    fcl = 1.0 + 1.29 * Icl;
  else
    fcl = 1.05 + 0.645 * Icl;
  end if;
  hcf = 12.1 * vAir^0.5;
  hcn = 2.38 * abs(Tcl-TAir)^0.25;
  if hcf > hcn then
    hc = hcf;
  else
    hc = hcn;
  end if;
  tcl = 35.7 - 0.028 * (M-W) - Icl * (3.96e-8 * fcl*((tcl + 273.15)^4 - Tr^4) + fcl * hc * (tcl - (TAir-273.15)));

annotation(Icon(graphics={
  Rectangle(extent={{-80,80},{80,-80}}, lineColor={28,108,200}),
  Text(extent={{-46,106},{40,82}}, lineColor={0,0,255},fillColor={170,213,255},
    fillPattern=FillPattern.Solid,textString="%name"),
  Text(extent={{-60,64},{76,-54}},lineColor={28,108,200},
    textString="DIN EN
ISO 7730")}),
  Documentation(info="<html>
  <p>Model that simulates the PMV and PPD indices regarding DIN EN ISO 7730 for an indoor space.</p>
  </html>", revisions="<html>
  <ul>
  <li>
  January 2, 2020, by Christoph Nytsch-Geusen<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end ThermalComfort_DIN_EN_ISO_7730;
