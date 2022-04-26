within BuildingSystems.Buildings.Geometries.Viewfactors.Functions;
function PhiTri
  "Calculates the view factors of nTri triangular areas"
  input Integer nTri
    "Number of triangle areas";
  input Real a1[nTri];
  input Real a2[nTri];
  input Real a3[nTri];
  input Real b1[nTri];
  input Real b2[nTri];
  input Real b3[nTri];
  input Real c1[nTri];
  input Real c2[nTri];
  input Real c3[nTri];
  input Integer r[nTri]
    "Normal directions of the triangular areas";
  input Integer z[nTri]
    "Number of segments";
  input Boolean viewFacComp
    "true: numerical compensation of the view factors (only for closed hulls),
     false: no numerical compensation of the view factors";
  output Real PhiComp[nTri,nTri]
    "Compensated view factors of the triangular areas";
protected
  Integer h;
  Integer zvi, zvj, zwi, zwj;
  Real cS1, cS2, cS3;
  Real cosbetai, cosbetaj;
  Real Fli, Flj;
  Real factor;
  Real ei1, ei2, ei3;
  Real ej1, ej2, ej3;
  Real phii;
  Real phistern;
  Real Prod1, Prod2, Prod3;
  Real r1, r2, r3, rAbsVal, rn1, rn2, rn3;
  Real rS1, rS2, rS3;
  Real trS;
  Boolean obstacle = false;
  Real v1[nTri];
  Real v2[nTri];
  Real v3[nTri];
  Real w1[nTri];
  Real w2[nTri];
  Real w3[nTri];
  Real n1[nTri]
    "Surface normal 1st component";
  Real n2[nTri]
    "Surface normal 2nd component";
  Real n3[nTri]
    "Surface normal 3rd component";
  Real AD[nTri]
    "Triangle area";
  Real AEP[nTri]
    "Parallelogram area";
  Real Phi[nTri,nTri]
    "Non compensated view factors of the triangular areas";
  Real Sum;
algorithm
  (w1,w2,w3,v1,v2,v3,AD,AEP,n1,n2,n3) := BuildingSystems.Buildings.Geometries.Viewfactors.Functions.generateTriangles(nTri,a1,a2,a3,b1,b2,b3,c1,c2,c3,z,r);

  for i in 1:nTri loop
    for j in 1:nTri loop
      Phi[i,j] := 0.0;
    end for;
  end for;
  // Area treatment
  for i in 1:nTri loop
    if AD[i] > 0.0 then
      for j in 1:nTri loop
        if not (AD[j] == 0.0 or i == j) then
          if not Phi[i,j] > 0.0 then
            if not (n1[i] == n1[j] and n2[i] == n2[j] and n3[i] == n3[j]) then
              if not (a1[i] == a1[j] and a2[i] == a2[j] and a3[i] == a3[j]
                 and b1[i] == b1[j] and b2[i] == b2[j] and b3[i] == b3[j]
                 and c1[i] == c1[j] and c2[i] == c2[j] and c3[i] == c3[j]) then
                // Element representation triangle i
                for zvi in 1:z[i] loop
                  for zwi in 1:z[i] loop
                    if not zvi + zwi > z[i] + 1 then
                      if zvi + zwi == z[i] + 1 then
                        Fli := 0.5;
                        factor := 0.65;
                      else
                        Fli := 1;
                        factor := 0.5;
                      end if;
                      ei1 := a1[i] + (zvi-factor) / z[i] * v1[i] + (zwi-factor) / z[i] * w1[i];
                      ei2 := a2[i] + (zvi-factor) / z[i] * v2[i] + (zwi-factor) / z[i] * w2[i];
                      ei3 := a3[i] + (zvi-factor) / z[i] * v3[i] + (zwi-factor) / z[i] * w3[i];
                      // Element representation triangle j
                      phii := 0.0;
                      for zvj in 1:z[j] loop
                        for zwj in 1:z[j] loop
                          if not zvj + zwj > z[j] + 1 then
                            if zvj + zwj == z[j] + 1 then
                              Flj := 0.5;
                              factor := 0.65;
                            else
                              Flj := 1.0;
                              factor := 0.5;
                            end if;
                            ej1 := a1[j] + (zvj-factor) / z[j] * v1[j] + (zwj-factor) / z[j] * w1[j];
                            ej2 := a2[j] + (zvj-factor) / z[j] * v2[j] + (zwj-factor) / z[j] * w2[j];
                            ej3 := a3[j] + (zvj-factor) / z[j] * v3[j] + (zwj-factor) / z[j] * w3[j];
                            // connection vector
                            r1 := ej1 - ei1;
                            r2 := ej2 - ei2;
                            r3 := ej3 - ei3;
                            rAbsVal := (r1^2 + r2^2 + r3^2)^0.5;
                            rn1 := r1 / rAbsVal;
                            rn2 := r2 / rAbsVal;
                            rn3 := r3 / rAbsVal;
                            // Check if obstacle h in the radiation path from i to j
                            for h in 1:nTri loop
                              if not (i == h or j == h) then
                                if not AD[h] == 0.0 then
                                  Prod3 := {n1[h],n2[h],n3[h]} * {r1,r2,r3};
                                  if not Prod3 == 0.0 then
                                    Prod1 := {n1[h],n2[h],n3[h]} * {a1[h],a2[h],a3[h]};
                                    Prod2 := {n1[h],n2[h],n3[h]} * {ei1,ei2,ei3};
                                    trS := (Prod1 - Prod2) / Prod3;
                                    if not (trS <= 0.0 or trS >= 1.0) then
                                      rS1 := ei1 + trS * r1;
                                      cS1 := rS1 - a1[h];
                                      rS2 := ei2 + trS * r2;
                                      cS2 := rS2 - a2[h];
                                      rS3 := ei3 + trS * r3;
                                      cS3 := rS3 - a3[h];

                                      if BuildingSystems.Buildings.Geometries.Viewfactors.Functions.checkObstacle(v1[h], w1[h], cS1, v2[h], w2[h], cS2, z[h]) == true or
                                      BuildingSystems.Buildings.Geometries.Viewfactors.Functions.checkObstacle(v2[h],w2[h],cS2,v3[h],w3[h],cS3,z[h]) == true or
                                      BuildingSystems.Buildings.Geometries.Viewfactors.Functions.checkObstacle(v3[h],w3[h],cS3,v1[h],w1[h],cS1,z[h]) == true then
                                        obstacle := true;
                                      else
                                        obstacle := false;
                                      end if;
                                    end if;
                                  end if;
                                end if;
                              end if;
                            end for;
                            if obstacle == false then
                              // Calculaton of the view factors
                              cosbetai := n1[i] * rn1 + n2[i] * rn2 + n3[i] * rn3;
                              if cosbetai < 0.0 then
                                cosbetai := 0.0;
                              end if;
                              cosbetaj := -(n1[j] * rn1 + n2[j] * rn2 + n3[j] * rn3);
                              if cosbetaj < 0.0 then
                                cosbetaj := 0.0;
                              end if;
                              phistern := cosbetai * cosbetaj / (rAbsVal ^ 2) * AEP[j] * Flj;
                              phii := phii + phistern;
                            end if;
                          end if;
                        end for;
                      end for;
                      Phi[i,j] := Phi[i,j] + phii * AEP[i] * Fli;
                    end if;
                  end for;
                end for;
                Phi[i,j] := Phi[i,j] / Modelica.Constants.pi / AD[i];
                Phi[j,i] := Phi[i,j] * AD[i] / AD[j];
                if Phi[j,i] == 0.0 then
                  Phi[j,i] := 10e-8;
                end if;
              end if;
            end if;
          end if;
        end if;
      end for;
    end if;
  end for;
  // Compensation of the numerical deviations
  if viewFacComp then
    for i in 1:nTri loop
      if AD[i] > 0.0 then
        Sum := 0.0;
        for j in 1:nTri loop
          Sum := Sum + Phi[i,j];
        end for;
        for j in 1:nTri loop
          PhiComp[i,j] := Phi[i,j] / Sum;
        end for;
      end if;
    end for;
  else
    PhiComp := Phi;
  end if;
  annotation (
Documentation(info="<html>
<p>
This function calculates the view factors of nTri triangular areas.
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
end PhiTri;
