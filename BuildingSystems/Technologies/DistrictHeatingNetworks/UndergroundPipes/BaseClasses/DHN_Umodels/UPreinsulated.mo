within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels;
model UPreinsulated "U model for Preinsulated pipes"
  extends
    BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPartialClass(
     final nPipes=2,
    final SPip=(Modelica.Constants.pi*d_o*d_o/4) - SWat,
    final SWat=Modelica.Constants.pi*d_i*d_i/4);

  parameter Modelica.SIunits.Length H_real "Deph of the pipe center" annotation(Dialog(tab="General", group="Laying"));
  parameter Modelica.SIunits.Length E "Distance between pipes' centers" annotation(Dialog(tab="General", group="Laying"));
  parameter Modelica.SIunits.Diameter d_g = 1.313
    "Diameter of the undisturbed ground" annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.ThermalConductivity lam_g = 1.2
    "Heat conductivity of the undisturbed ground" annotation(Dialog(tab="General", group="Thermal properties"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer h_gs = 14.6
    "Heat transfer coefficient at the ground surface" annotation(Dialog(tab="Assumptions"));
protected
  parameter Modelica.SIunits.Length H = H_real+(lam_g/h_gs)
    "Equivalent deph of the pipe center";
  parameter Modelica.SIunits.ThermalResistance R_g = (1/(2*Modelica.Constants.pi*lam_g))*log(4*H/d_c)
    "Ground thermal resistance";
  parameter Modelica.SIunits.ThermalResistance R_i = 0.5/Modelica.Constants.pi/lam_ins*log(d_ins/d_o)+0.5/Modelica.Constants.pi/lam_c*log(d_c/d_ins) + 0.5/Modelica.Constants.pi/lam_g*log(d_g/d_c)
    "Pipe's thermal resistance";
  parameter Modelica.SIunits.ThermalResistance R_m = (1/(4*Modelica.Constants.pi*lam_g))*log(1+(2*H/E)^2)
    "Thermal resistance between pipes";
equation
  U[1] = (R_g+R_i)/(((R_g+R_i)^2)-(R_m^2));
  U[2] = (R_m)/(((R_g+R_i)^2)-(R_m^2));
  assert(E > d_o, " Distance between pipes E, " + String(E)  +" , must be greater than pipe's cover diameter: " + String(d_o));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Documentation(info="<html>
<h4>Main equations</h4>
<p>
<code>U1 = (Rg+Ri)/((Rg+Ri)^2-Rm^2)</code>
</p>
<p>
<code>U2 = (Rm)/((Rg+Ri)^2-Rm^2) </code>
</p>

<h4>Implementation</h4>
<p>
In case U1 &gt; 4*U2, the value of U2 is set to 0. It means the interaction between pipes is negelcted.
</p>

<h4>References</h4>
<p>
On transient heat losses from buried district heating pipes, Bomm 2000.
</p>
</html>"));
end UPreinsulated;
