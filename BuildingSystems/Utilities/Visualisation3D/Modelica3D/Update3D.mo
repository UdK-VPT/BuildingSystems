within BuildingSystems.Utilities.Visualisation3D.Modelica3D;
model Update3D "Define communication and update interval"
  parameter Integer framerate = 30;
  parameter Modelica.SIunits.Time updateInterval = 1.0 / framerate;
  output Boolean send;
  output Integer frame;

algorithm
  when send then
    frame := integer(time/updateInterval + 1); // First frame is 1, not 0;
    setFrameTime(frame, time);
  end when;

equation
  send = sample(1e-08, updateInterval);
end Update3D;
