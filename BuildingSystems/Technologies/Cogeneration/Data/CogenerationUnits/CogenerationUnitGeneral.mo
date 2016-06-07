within BuildingSystems.Technologies.Cogeneration.Data.CogenerationUnits;
record CogenerationUnitGeneral
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal
    "Nominal heat flow rate (at full load)";
  parameter Modelica.SIunits.HeatFlowRate P_nominal
    "Nominal electrical power (at full load)";
  parameter Real etaEl[:,2]
    "Electrical efficieny dependent on the partial load";
  parameter Real etaTh[:,2]
    "Thermal efficieny dependent on the partial load";
end CogenerationUnitGeneral;
