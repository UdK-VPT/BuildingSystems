within BuildingSystems.Buildings.Geometries.Viewfactors.Functions;
function checkObstacle
  "Checks if an obtacle is in the radiation path between two surface elements"
  input Real a1;
  input Real a2;
  input Real a3;
  input Real b1;
  input Real b2;
  input Real b3;
  input Real zk;
  output Boolean obstacle;
protected
  Real DD, D1, D2;
  Real Gx1, Gx2;
algorithm
  DD := a1 * b2 - a2 * b1;
  D1 := a3 * b2 - b3 * a2;
  D2 := a1 * b3 - b1 * a3;
  obstacle := false;
  if DD == 0.0 then
  else
    Gx1 := D1 / DD * zk;
    Gx2 := D2 / DD * zk;
    if Gx1 + Gx2 > zk or Gx1 < 0.0 or Gx2 < 0.0 then
    else
      obstacle := true;
    end if;
  end if;
  annotation (
Documentation(info="<html>
<p>
This function checks if an obtacle is in the radiation path between two surface elements.
<h4>Literature</h4>
This algorithm is inherited by the view factor calculation method of Bernd Glück:
Dynamisches Raummodell zur wärmetechnischen und wärmephysiologischen Bewertung,
Rudolf-Otto-Meyer-Stiftung, Bericht Teil A, 2004.
</p>
</html>", revisions="<html>
<ul>
<li>
March 9, 2022 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end checkObstacle;
