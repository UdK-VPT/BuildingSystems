within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector LwSwRad
  "HeatPort + A"
  //General variables
  Modelica.Units.SI.Area A;
  Modelica.Units.SI.Temperature T;
  flow Modelica.Units.SI.HeatFlowRate Q_flowLw;
  flow Modelica.Units.SI.HeatFlowRate Q_flowSwIn;
  flow Modelica.Units.SI.HeatFlowRate Q_flowSwOut;
end LwSwRad;
