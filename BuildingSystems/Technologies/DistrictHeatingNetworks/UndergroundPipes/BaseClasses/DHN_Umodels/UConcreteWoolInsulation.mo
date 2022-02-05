within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels;
model UConcreteWoolInsulation
  extends
    BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPartialClass(
    final nPipes=2,
    final th_c=(d_ins - 2.2*A*B/(A + B)/2),
    final SPip=(Modelica.Constants.pi*d_o*d_o/4) - SWat,
    final SWat=Modelica.Constants.pi*d_i*d_i/4);
  parameter Modelica.Units.SI.Length H_real "Depth of the pipe center"
    annotation (Dialog(tab="General", group="Laying"));
  parameter Modelica.Units.SI.Length A "Width case"
    annotation (Dialog(tab="General", group="Laying"));
  parameter Modelica.Units.SI.Length B "Height case"
    annotation (Dialog(tab="General", group="Laying"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer h_gs=14.6
    "Heat transfer coefficient at the ground surface"
    annotation (Dialog(tab="Assumptions"));
  parameter Modelica.Units.SI.Diameter d_g=1.313
    "Diameter of the undisturbed ground"
    annotation (Dialog(tab="General", group="Geometry"));
  parameter Modelica.Units.SI.ThermalConductivity lam_g=1.2
    "Heat conductivity of the undisturbed ground"
    annotation (Dialog(tab="General", group="Thermal properties"));
protected
  parameter Modelica.Units.SI.Length H=H_real + (lam_g/h_gs)
    "Equivalent deph of the pipe center";
  parameter Modelica.Units.SI.ThermalResistance R_hi=1/(Modelica.Constants.pi*
      d_ins*h_s);
  parameter Modelica.Units.SI.ThermalResistance R_hg=1/(2*(A + B)*h_s)
    "Thermal resistance at the concrete surface";
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer h_s=7.7
    "Heat transfer coefficient of the air duct between concrete surface and ground";
  parameter Modelica.Units.SI.ThermalResistance R_g=(1/(2*Modelica.Constants.pi
      *lam_g))*log(4*H/d_c) "Ground thermal resistance";
  parameter Modelica.Units.SI.ThermalResistance R_i=R_hi + (1/Modelica.Constants.pi)
      *(0.5/lam_ins*log(d_ins/d_o) + 0.5/lam_c*log(d_c/d_ins) + 0.5/lam_g*log(
      d_g/d_c)) "Pipe's thermal resistance";
  parameter Modelica.Units.SI.ThermalResistance R_m=R_g
    "Thermal resistance between pipes";
equation
  U[1] = (R_g+R_i)/((R_g+R_i)^2-R_m^2);
  U[2] = (R_m)/(((R_g+R_i)^2)-(R_m^2));
  annotation ( Documentation(info="<html>
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
end UConcreteWoolInsulation;
