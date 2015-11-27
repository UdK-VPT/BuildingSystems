within BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces;
function alphaPlateFree
  "Heat transfer by free convection for plates with any direction and any heatflow"
  // Heat transfer coefficient for free convection on tilted surfaces"
  // Approach afte TAS Version 7.96, for deltaT -> 0.0 modified for numerical reasons"
  input Modelica.SIunits.TemperatureDifference deltaT;
  input Modelica.SIunits.Length height;
  input Modelica.SIunits.Length width;
  input Modelica.SIunits.Conversions.NonSIunits.Angle_deg angle;
  output Modelica.SIunits.SurfaceCoefficientOfHeatTransfer value;
protected
  Real DELTAT_RAD = 0.00000005 "Radius for deltaT->0 used by softpow()";
  Real SWITCH_FAK = 0.0000000001 "Smoothing for softswitch()";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaVer, alphaHor;
  
algorithm
  if angle == 90.0 then // vertical: e.g. wall
    value := BuildingSystems.Utilities.SmoothFunctions.softswitch(deltaT, 0.0, 1.0 / (670.656 * height^6 + 120.43 * height^8.7)^(1/6)
      + 1.23 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT, 1.0/3.0, DELTAT_RAD),1.0 / (670.656 * height^6 + 120.43 * height^8.7)^(1/6)
      + 1.23 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);

  elseif angle == 0.0 then // horizontal: e.g. roof
    value := BuildingSystems.Utilities.SmoothFunctions.softswitch(-deltaT, 0.0, 0.6 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT/ (2.0*height*width/(height+width))^2, 0.2, DELTAT_RAD),
      1.63 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);
  elseif angle == 180.0 then // horizontal: e.g. floor
    value := BuildingSystems.Utilities.SmoothFunctions.softswitch(deltaT, 0.0, 0.6 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT/ (2.0*height*width/(height+width))^2, 0.2, DELTAT_RAD),
      1.63 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);
  else // neither vertical nor horizontal: e.g. tilted roof
    alphaVer := BuildingSystems.Utilities.SmoothFunctions.softswitch(deltaT, 0.0, 1.0 / (670.656 * height^6 + 120.43 * height^8.7)^(1/6)
      + 1.23 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT, 1.0/3.0, DELTAT_RAD),1.0 / (670.656 * height^6 + 120.43 * height^8.7)^(1/6)
      + 1.23 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);
    if angle > 0.0 and angle < 90.0 then
      alphaHor := BuildingSystems.Utilities.SmoothFunctions.softswitch(-deltaT, 0.0, 0.6 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT/ (2.0*height*width/(height+width))^2, 0.2, DELTAT_RAD),
        1.63 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);
    else
      alphaHor := BuildingSystems.Utilities.SmoothFunctions.softswitch(deltaT, 0.0, 0.6 * BuildingSystems.Utilities.SmoothFunctions.softpow(-deltaT/ (2.0*height*width/(height+width))^2, 0.2, DELTAT_RAD),
        1.63 * BuildingSystems.Utilities.SmoothFunctions.softpow(deltaT, 1.0/3.0, DELTAT_RAD), SWITCH_FAK);
    end if;
    value := alphaHor + (alphaVer - alphaHor) * Modelica.Math.sin(angle*Modelica.Constants.pi/180.0)^0.25;
  end if;
end alphaPlateFree;
