within BuildingSystems.Buildings.Geometries.Viewfactors.Functions;
function generateTriangles
  "Generates discretized triangle areas and normals"
  input Integer nTri
    "Number of the triangular areas";
  input Real a1[nTri];
  input Real a2[nTri];
  input Real a3[nTri];
  input Real b1[nTri];
  input Real b2[nTri];
  input Real b3[nTri];
  input Real c1[nTri];
  input Real c2[nTri];
  input Real c3[nTri];
  input Integer z[nTri]
    "Number of segments";
  input Integer r[nTri]
    "Normal direction of the triangular areas";
  output Real w1[nTri];
  output Real w2[nTri];
  output Real w3[nTri];
  output Real v1[nTri];
  output Real v2[nTri];
  output Real v3[nTri];
  output Real AD[nTri]
    "Area of the triangle";
  output Real AEP[nTri]
    "Area of the parallelogram";
  output Real n1[nTri]
    "Surface normal 1st component";
  output Real n2[nTri]
    "Surface normal 2nd component";
  output Real n3[nTri]
    "Surface normal 3rd component";
protected
    Real RR;
    Real D[3];
    Real absVal;
algorithm
  for i in 1:nTri loop
    v1[i] := c1[i] - a1[i];
    v2[i] := c2[i] - a2[i];
    v3[i] := c3[i] - a3[i];

    w1[i] := b1[i] - a1[i];
    w2[i] := b2[i] - a2[i];
    w3[i] := b3[i] - a3[i];

    D := cross({w1[i],w2[i],w3[i]},{v1[i],v2[i],v3[i]});
    absVal := (D[1]^2 + D[2]^2 + D[3]^2)^0.5;
    if absVal > 0.0 then
      D := D / ((D[1]^2 + D[2]^2 + D[3]^2)^0.5);
    else
      D := {0.0,0.0,0.0};
    end if;

    AD[i] := 0.5 * absVal;

    if AD[i] > 0 then
      AEP[i] := 2 * AD[i] / (z[i]^2);
      RR := r[i];
      n1[i] := D[1] * RR;
      n2[i] := D[2] * RR;
      n3[i] := D[3] * RR;
    end if;
  end for;
  annotation (
Documentation(info="<html>
<p>
This function generates discretized triangle areas and normals.
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
end generateTriangles;
