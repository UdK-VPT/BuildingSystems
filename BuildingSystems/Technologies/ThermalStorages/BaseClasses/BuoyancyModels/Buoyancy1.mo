within BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels;
model Buoyancy1
protected
  extends BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.PartialBuoyancy;
  parameter Modelica.SIunits.ThermalConductance G = if nEle <10 then 0.8*nEle+16 else 26-0.2571*nEle
    "Equivalent thermal conductance between layers";
  parameter Real exp_nEle = 1.5
    "Exponent for nEle";
initial equation
  assert( nEle >= 4 and nEle <= 40,
  "The number of nodes used nEle is out of the validated range (between 4 and 40), see Info section of the selected buoyancy model.",level=  AssertionLevel.warning);
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
    <code>G</code>. Its value determines the buoyancy effect and is defined as, <code> G = if nEle &lt;
    10 then 0.8*nEle+16 else 26-0.2571*nEle</code>, see reference.
    </p>
    <h4>Validition</h4>
    Technical information and measurements from the commercial DHW tank Vitocell 100-V,
    type CVW of 390 l were used to tune the parameters of the model, see references. Furthermore,
    the buoyancy model is valid for values of <code>nEle</code> between 5 and 40.
    <h4>References</h4>
    <p>
    The Buoyancy Model is based on the following reference; \"De Coninck et al. (2013) - De Coninck, R., Baetens, R., Saelens, D., Woyte, A., &amp; Helsen, L. (2013). Rule-based demand side management of domestic hot water production with heat pumps in zero energy neighbourhoods. Journal of Building Performance Simulation\".
    </p>
    </html>"));
end Buoyancy1;
