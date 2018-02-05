within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector LwSwRad
  "HeatPort + A"
  //General variables
  Modelica.SIunits.Area A;
  Modelica.SIunits.Temp_K T;
  flow Modelica.SIunits.HeatFlowRate Q_flowLw;
  flow Modelica.SIunits.HeatFlowRate Q_flowSwIn;
  flow Modelica.SIunits.HeatFlowRate Q_flowSwOut;
end LwSwRad;
