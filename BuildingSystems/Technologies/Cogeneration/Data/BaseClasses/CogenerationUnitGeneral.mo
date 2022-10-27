within BuildingSystems.Technologies.Cogeneration.Data.BaseClasses;
record CogenerationUnitGeneral
  parameter Modelica.Units.SI.HeatFlowRate Q_flow_nominal
    "Nominal heat flow rate (at full load)";
  parameter Modelica.Units.SI.HeatFlowRate QCon_flow_nominal
    "Nominal heat flow rate (at full load with condensing energy)";
  parameter Modelica.Units.SI.HeatFlowRate P_nominal
    "Nominal electrical power (at full load)";
  parameter Real etaEl[:,2]
    "Electrical efficieny dependent on the partial load";
  parameter Real etaTh[:,2]
    "Thermal efficieny dependent on the partial load";
  parameter Modelica.Units.SI.Length length "Length of the cogeneration unit";
  parameter Modelica.Units.SI.Length width "Width of the cogeneration unit";
  parameter Modelica.Units.SI.Length height "Height of the cogeneration unit";
  parameter Modelica.Units.SI.Mass m "Mass of the cogeneration unit";
end CogenerationUnitGeneral;
