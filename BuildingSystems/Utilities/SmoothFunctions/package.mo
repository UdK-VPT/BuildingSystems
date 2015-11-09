within BuildingSystems.Utilities;
package SmoothFunctions "Functions for numerical smoothing"
  extends Modelica.Icons.VariantsPackage;

  annotation(Documentation(info="<html>
    <p>
    This package contains functions for the numerica smoothing of equations:
    </p>
    <pre>
       <b>softcut</b>       softly cuts to upper and lower limit.
       <b>softcut_lower</b> softly cuts to lower limit.
       <b>softcut_upper</b> softly cuts to upper limit.
       <b>softpow</b>       pow(x) with x close to 0.0 smoothing.
       <b>softabs</b>       softabs(x) softly approximate fabs().
       <b>safetanh</b>      tanh(x) with NaN catching.
       <b>safepow</b>       pow(x) with x less than 0.0 catching.
       <b>softswitch</b>    switches softly between y0 and y1 at x=y_switch with smoothing f.
       <b>safereciprocal</b> calculates 1/x without zeros between a user defined intervall from -delta to +delta.
    </pre>
      </html>"));
 //version="0.1",versionDate="12.09.2008"
end SmoothFunctions;
