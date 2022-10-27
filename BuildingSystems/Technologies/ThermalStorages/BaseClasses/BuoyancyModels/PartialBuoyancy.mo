within BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels;
partial model PartialBuoyancy
  parameter Integer nEle( min=2) "Number of layers";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a[nEle - 1]
    "Heat port of the bottom volume"
    annotation (Placement(transformation(extent={{-10,-100},{10,-80}}), iconTransformation(extent={{-10,-100},{10,-80}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b[nEle - 1]
    "Heat port of the top volume"
    annotation (Placement(transformation(extent={{-10,80},{10,100}}), iconTransformation(extent={{-10,80},{10,100}})));
  Modelica.Units.SI.TemperatureDifference dT[nEle - 1]
    "Temperature difference between layers";
  Modelica.Units.SI.HeatFlowRate Q_flow[nEle - 1]
    "Heat flow rate from port_a -> port_b";
equation
  for i in 1:nEle-1 loop
    dT[i] = max(port_a[i].T-port_b[i].T,0);
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-100,100},{100,-100}},lineColor={0,0,0}),
    Text(extent={{-60,40},{56,-42}},lineColor={0,0,0},fillPattern=FillPattern.Solid,textString="Buoyancy")}));
end PartialBuoyancy;
