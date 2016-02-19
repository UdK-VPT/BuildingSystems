within BuildingSystems.Buildings.Airpathes;
model AirpathPrescribedPressure "Air path model for a given pressure"
  Modelica.Fluid.Interfaces.FluidPort_a airpathPort_1(
    redeclare final package Medium=BuildingSystems.Media.Air)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}), iconTransformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Interfaces.RealInput p_in if use_p_in
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={40,0}), iconTransformation(extent={{-5,-5},{5,5}}, rotation=180,origin={35,1})));
  BuildingSystems.Interfaces.Temp_KInput T_in if use_T_in
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={40,20}), iconTransformation(extent={{-5,-5},{5,5}},rotation=180,origin={35,15})));
  BuildingSystems.Interfaces.Moisture_absInput x_in if use_x_in
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={40,-10}), iconTransformation(extent={{-5,-5},{5,5}},rotation=180,origin={35,-15})));
  parameter BuildingSystems.Types.FlowCoefficient kConstant= 0.5
    "Flow coefficient";
  parameter Real mConstant(unit = "1") = 0.5
    "Flow exponent";
  parameter Boolean use_p_in = false
    "Get the pressure from the input connector"
    annotation(Evaluate=true, HideResult=true);
  parameter Boolean use_T_in= false
    "Get the temperature from the input connector"
    annotation(Evaluate=true, HideResult=true);
  parameter Boolean use_x_in = false
    "Get the composition from the input connector"
    annotation(Evaluate=true, HideResult=true);
  parameter Modelica.SIunits.Pressure p = airpathPort_1.Medium.p_default
    "Fixed value of pressure"
    annotation (Dialog(enable = not use_p_in));
  parameter Modelica.SIunits.Temp_K T = airpathPort_1.Medium.T_default
    "Fixed value of temperature"
    annotation (Dialog(enable = not use_T_in));
  parameter Modelica.SIunits.MassFraction x = 0.005
    "Fixed value of absolute moisture"
    annotation (Dialog(enable = not use_x_in));
  constant Real factor = 20.0 "Numerical factor for air exchange calculation";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
protected
  Modelica.Blocks.Interfaces.RealInput p_internal
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput T_internal
    "Needed to connect to conditional connector";
  Modelica.Blocks.Interfaces.RealInput x_internal
    "Needed to connect to conditional connector";
equation
  connect(p_in, p_internal);
  connect(T_in, T_internal);
  connect(x_in, x_internal);
  if not use_p_in then
    p_internal = p;
  end if;
  if not use_T_in then
    T_internal = T;
  end if;
  if not use_x_in then
    x_internal = x;
  end if;

  airpathPort_1.h_outflow = BuildingSystems.Media.Air.specificEnthalpy_pTX(p=100000, T=T_internal, X={x_internal,1-x_internal});
  airpathPort_1.Xi_outflow[1] = x_internal;

  // Mass flow trough air path
  airpathPort_1.m_flow = Modelica.Math.tanh(factor * (airpathPort_1.p - p_internal)) * rho_nominal * kConstant
    * BuildingSystems.Utilities.SmoothFunctions.safepow(BuildingSystems.Utilities.SmoothFunctions.softfabs(airpathPort_1.p - p_internal,0.05),mConstant);

annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
     Rectangle(extent={{-10,40},{10,-40}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=  FillPattern.Solid,origin={0,1.77636e-015},rotation=90),
     Text(extent={{-44,-10},{48,-38}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString= "%name"),
     Rectangle(extent={{-20,9},{20,-9}},  lineColor={230,230,230},fillColor={230,230,230},fillPattern=  FillPattern.Solid,origin={31,0}, rotation=90)}));
end AirpathPrescribedPressure;
