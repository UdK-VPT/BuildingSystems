within BuildingSystems.Technologies.Cogeneration.Data.BaseClasses;
record CogenerationUnitGeneral
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal
    "Nominal heat flow rate (at full load)";
  parameter Modelica.SIunits.HeatFlowRate QCon_flow_nominal
    "Nominal heat flow rate (at full load with condensing energy)";
  parameter Modelica.SIunits.HeatFlowRate P_nominal
    "Nominal electrical power (at full load)";
  parameter Real etaEl[:,2]
    "Electrical efficieny dependent on the partial load";
  parameter Real etaTh[:,2]
    "Thermal efficieny dependent on the partial load";
  parameter Modelica.SIunits.Length length
    "Length of the cogeneration unit";
  parameter Modelica.SIunits.Length width
    "Width of the cogeneration unit";
  parameter Modelica.SIunits.Length height
    "Height of the cogeneration unit";
  parameter Modelica.SIunits.Mass m
    "Mass of the cogeneration unit";
end CogenerationUnitGeneral;
