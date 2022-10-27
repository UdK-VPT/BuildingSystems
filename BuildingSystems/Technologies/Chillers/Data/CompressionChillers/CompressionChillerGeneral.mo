within BuildingSystems.Technologies.Chillers.Data.CompressionChillers;
record CompressionChillerGeneral
  parameter Modelica.Units.SI.Power P_nominal
    "Electrical power demand of the chiller under nominal conditions";
  parameter Modelica.Units.SI.Temperature TCon_nominal
    "Temperature of the condensor under nominal conditions";
  parameter Modelica.Units.SI.Temperature TEva_nominal
    "Temperature of the evaporator under nominal conditions";
  parameter Real COP_nominal[:,2]
    "Part load charateristic of the chiller under nominal conditions";
end CompressionChillerGeneral;
