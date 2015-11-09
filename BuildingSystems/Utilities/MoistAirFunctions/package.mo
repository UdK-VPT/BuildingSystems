within BuildingSystems.Utilities;
package MoistAirFunctions "Functions for state variables of moist air"
  extends Modelica.Icons.VariantsPackage;

  annotation(Documentation(info="<html>
    <p>
    This package contains functions for state variables for moist air:
    </p>
    <pre>
       <b>p_sat = f(T)</b>             Function for the saturation vapor pressure, dependent on T.
       <b>T_sat = f(enthalphy)</b>     Function for the saturation temperature, dependent on the enthalpy.
       <b>x = f(p,p_sat, phi)</b>      Function for the absolute humidity, dependent on p, p_sat and phi.
       <b>x_sat = f(p,p_sat)</b>       Function for the absolute humidity under saturation conditions, dependent on p and psat.
       <b>enthalpy = f(T,x,x_sat)</b>  Function of the enthalpy of moist air, dependent on T, X and x_sat.
       <b>T_dp = f(p)</b>              Function of dew point temperature, dependent on p.
       <b>p = f(x, p_air)</b>)         Function of vapor pressure, dependent on x and p_air.
    </pre>
      </html>"));
end MoistAirFunctions;
