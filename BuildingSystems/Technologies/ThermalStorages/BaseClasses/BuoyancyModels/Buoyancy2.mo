within BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels;
model Buoyancy2
  parameter Modelica.SIunits.ThermalConductance G
    "Equivalent thermal conductance between layers";
  parameter Real exp_nEle
    "Exponent for nEle";
protected
  extends ThermalStorages.BaseClasses.BuoyancyModels.PartialBuoyancy;
equation
  for i in 1:nEle-1 loop
    Q_flow[i] = G * dT[i] * nEle^exp_nEle;
    port_a[i].Q_flow = Q_flow[i];
    port_b[i].Q_flow = -Q_flow[i];
  end for;
  annotation (Documentation(info="<html>
    <p>
    The Buoyancy model increments the heat exchange between layers when the upper layer is colder than the lower one.
    </p>
    <h4>Main equations</h4>
    <p>
    The Buoyancy effect is defined by the following equation, <code>Q=G*dT*nEle^exp_nEle</code>
    </p>
    <h4>Typical use and important parameters</h4>
    <p>
    <code>G</code>. Its value determines the buoyancy effect.
    </p>
    <p>
    <code>exp_nEle</code>. The results should not be affected by the TES's discretization. In this regard the parameter <code>exp_nEle</code> is used to improve the buoyancy model, diminishing the effect of the number of layers used on the model.
    </p>
    </html>"));
end Buoyancy2;
