within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels;
model UPrescribed
  extends BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPartialClass(
    final nPipes=2);
  parameter Modelica.SIunits.ThermalConductivity U1_constant
    "Thermal conductivity specific to length";
  parameter Modelica.SIunits.ThermalConductivity U2_constant = U1_constant
    "Thermal conductivity specific to length";
equation
  U[1] = U1_constant;
  U[2] = U2_constant;

  annotation ( Documentation(info="<html>
<p>
Values for <code>U1</code> and <code>U2</code> are defined by the parameters <code>U1_constant</code>  and <code>U2_constant</code> respectively.
</p>
</html>"));
end UPrescribed;
