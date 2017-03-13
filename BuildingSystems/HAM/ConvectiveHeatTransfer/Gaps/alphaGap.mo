within BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps;
function alphaGap
  "Empirical equation for convective heat transfer coefficient for a parallel gap"
  input Modelica.SIunits.Temp_K T1
    "Surface temperature 1";
  input Modelica.SIunits.Temp_K T2
    "Surface temperature 2";
  input Modelica.SIunits.Length d
    "Gap distance";
  input Modelica.SIunits.Length h
    "Gap height";
  input Integer gas
    "Gas within the gap: 1:air, 2:argon or 3:krypton, 4:xenon, 5:SF6";
  output Modelica.SIunits.CoefficientOfHeatTransfer value;
protected
  Modelica.SIunits.Temp_K TMean
    "mean temperature";
  Modelica.SIunits.TemperatureDifference deltaT
    "positive temperature difference";
  Modelica.SIunits.PrandtlNumber Pr
    "Prandtl number of the gas";
  Modelica.SIunits.GrashofNumber Gr
    "Grashof number of the gas";
  Modelica.SIunits.RayleighNumber Ra
    "Rayleigh number of the gas";
  Modelica.SIunits.CoefficientOfHeatTransfer alpha1, alpha2, alpha3, alpha12
    "Helping variables";
  Modelica.SIunits.Acceleration g = 9.81
    "accelaration of gravity";

algorithm
  TMean := abs((T1 + T2)/2.0);
  deltaT := abs(T2 - T1);
  Pr := BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.Pr(gas, TMean);
  Gr := g*deltaT*d^3/(TMean*BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.ny(gas, TMean)^2);

  Ra := Gr * Pr;

  // Ra > 0 and Ra < 1.0e4:
  alpha1 := 1.0*BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.lambda(gas,TMean)/d;
  // Ra => 1.0e4 and Ra < 1.0e7:
  alpha2 := 0.42*Pr^0.012*Ra^0.25*(h/d)^(-0.25)*BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.lambda(gas, TMean)/d;
  // Ra >= 1.0e7 and Ra < 1.0e9:
  alpha3 := 0.049*Ra^0.33*BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.lambda(gas, TMean)/d;

  alpha12 := BuildingSystems.Utilities.SmoothFunctions.softswitch(Ra,1.0e4,alpha1,alpha2,0.01);
  value := BuildingSystems.Utilities.SmoothFunctions.softswitch(Ra,1.0e7,alpha12,alpha3,0.0001);
  annotation (Documentation(info="<html>
This function computes the convective heat transfer coefficient for a gap between
two parallel surfaces with the gap distance <code>d</code>, the gap height <code>h</code>,
the surface temperatures <code>T1</code> and <code>T2</code> and the gases air, argon, krypton, xenon and SF6.
<h4>References</h4>
<p>
Empirical alpha equation by Mac Gregor/Emery (7th edition of VDI-Waermeatlas Fc3 formula 15)
</p>
</html>", revisions="<html>
<ul>
<li>
Jan 16, 2014 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end alphaGap;
