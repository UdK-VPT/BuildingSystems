within BuildingSystems.Buildings.Geometries.Viewfactors.Functions;
function PhiRect
  "Calculates the view factors of nRect rectangular areas"
  input Integer nRect
    "Number of rectangle areas";
  input Real a1[nRect];
  input Real a2[nRect];
  input Real a3[nRect];
  input Real b1[nRect];
  input Real b2[nRect];
  input Real b3[nRect];
  input Real c1[nRect];
  input Real c2[nRect];
  input Real c3[nRect];
  input Real d1[nRect];
  input Real d2[nRect];
  input Real d3[nRect];
  input Integer r[nRect]
    "Normal direction of the rectangular areas";
  input Integer z[nRect]
    "Number of segments";
  input Boolean viewFacComp
    "true: numerical compensation of the view factors (only for closed hulls),
     false: no numerical compensation of the view factors";
  output Real PhiRect[nRect,nRect]
    "View factors for rectangular areas";
protected
  Integer nTri = 2*nRect;
  Real a1Tri[nTri];
  Real a2Tri[nTri];
  Real a3Tri[nTri];
  Real b1Tri[nTri];
  Real b2Tri[nTri];
  Real b3Tri[nTri];
  Real c1Tri[nTri];
  Real c2Tri[nTri];
  Real c3Tri[nTri];
  Integer rTri[nTri]
    "Normal direction of the triangular areas";
  Integer zTri[nTri]
    "Number of segments";
  Real PhiTri[nTri,nTri]
    "Compensated view factors of the triangular areas";
algorithm
  for i in 1:nRect loop
    rTri[2*i-1] := r[i];
    rTri[2*i] := r[i];
    zTri[2*i-1] := z[i];
    zTri[2*i] := z[i];
  end for;

  // Discretization of the quadrangles into triangles
  for i in 1:nRect loop
    // 1st triangle vertices
    a1Tri[2*i-1] := a1[i];
    a2Tri[2*i-1] := a2[i];
    a3Tri[2*i-1] := a3[i];
    b1Tri[2*i-1] := b1[i];
    b2Tri[2*i-1] := b2[i];
    b3Tri[2*i-1] := b3[i];
    c1Tri[2*i-1] := c1[i];
    c2Tri[2*i-1] := c2[i];
    c3Tri[2*i-1] := c3[i];
    // 2nd triangle vertices
    a1Tri[2*i] := c1[i];
    a2Tri[2*i] := c2[i];
    a3Tri[2*i] := c3[i];
    b1Tri[2*i] := d1[i];
    b2Tri[2*i] := d2[i];
    b3Tri[2*i] := d3[i];
    c1Tri[2*i] := a1[i];
    c2Tri[2*i] := a2[i];
    c3Tri[2*i] := a3[i];
  end for;
  // Calculation of triangle based view factors
  PhiTri := BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiTri(nTri,a1Tri,a2Tri,a3Tri,b1Tri,b2Tri,b3Tri,c1Tri,c2Tri,c3Tri,rTri,zTri,viewFacComp);
  // Merging to quadrangle based view factors
  for i in 1:nRect loop
    for j in 1:nRect loop
      PhiRect[i,j] := 0.5*(PhiTri[2*i-1,2*j-1] + PhiTri[2*i-1,2*j])
                      + 0.5*(PhiTri[2*i,2*j-1] + PhiTri[2*i,2*j]);
    end for;
  end for;
  annotation (
Documentation(info="<html>
<p>
This function calculates the view factors of nRect rectangular areas.
</p>
</html>", revisions="<html>
<ul>
<li>
March 9, 2022 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PhiRect;
