within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;

function dPhi
  "Calculates the liquid conduction coefficient"
  input Modelica.SIunits.MassConcentration dwsTabX[:];
  input BuildingSystems.Types.CoefficientOfLiquidTransport dwsTabY[:];
  input Modelica.SIunits.MassConcentration dwwTabX[:];
  input BuildingSystems.Types.CoefficientOfLiquidTransport dwwTabY[:];
  input Modelica.SIunits.MassConcentration wF;
  input Modelica.SIunits.MassConcentration w;
  input Modelica.SIunits.MassFlowRate m_flow_wdr;
  input Modelica.SIunits.MassConcentration wDerPhi;
  output Real value
  "[kg/ms]";

protected
  Real temp_wDerPhi;
  Real dws;
  Real dww;

algorithm
  if w < 0.0 then
    dww := Modelica.Constants.small;
    dws := Modelica.Constants.small;
  else
    dww := Modelica.Constants.small;
    dws := Modelica.Constants.small;
    if wF == -1 then
      dws := Modelica.Constants.small;
      dww := Modelica.Constants.small;
    elseif wF <> -1 then
      if m_flow_wdr > 0 then
        if w <= wF then
          // Tabular interpolation (exponential mode)
          dws := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(w,dwsTabX,dwsTabY,2);
        elseif w > wF then
          dws := dwsTabY[size(dwsTabY,1)];
        end if;
      else
        if w <= wF then
          // Tabular interpolation (exponential mode)
          dww := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(w,dwwTabX,dwwTabY,2);
        elseif w > wF then
          dww := dwwTabY[size(dwwTabY,1)];
        end if;
      end if;
    end if;
  end if;

  if wDerPhi <> 0.0 then
    temp_wDerPhi := wDerPhi;
  else
    temp_wDerPhi := Modelica.Constants.small;
  end if;

  if m_flow_wdr <> 0 then
    value := dws * temp_wDerPhi;
  else
    value := dww * temp_wDerPhi;
  end if;
end dPhi;
