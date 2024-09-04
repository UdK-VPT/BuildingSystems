within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function dPhi
  "Calculates the liquid conduction coefficient"
  input Modelica.Units.SI.MassConcentration dwsTabX[:];
  input BuildingSystems.Types.CoefficientOfLiquidTransport dwsTabY[:];
  input Modelica.Units.SI.MassConcentration dwwTabX[:];
  input BuildingSystems.Types.CoefficientOfLiquidTransport dwwTabY[:];
  input Modelica.Units.SI.MassConcentration wF;
  input Modelica.Units.SI.MassConcentration w;
  input Modelica.Units.SI.MassFlowRate m_flow_wdr;
  input Modelica.Units.SI.MassConcentration wDerPhi;
  output Real value "[kg/ms]";

protected
  Real temp_wDerPhi;
  Real dws;
  Real dww;
  Real[size(dwsTabX,1)] d1(each fixed=false) =
    BuildingSystems.Utilities.Math.Functions.splineDerivatives(
      x=dwsTabX,
      y=dwsTabY,
      ensureMonotonicity=true);
  Real[size(dwwTabX,1)] d2(each fixed=false) =
    BuildingSystems.Utilities.Math.Functions.splineDerivatives(
      x=dwwTabX,
      y=dwwTabY,
      ensureMonotonicity=true);
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
          dws := BuildingSystems.Utilities.Math.Functions.interpolate(u=w,xd=dwsTabX,yd=dwsTabY,d=d1);
        elseif w > wF then
          dws := dwsTabY[size(dwsTabY,1)];
        end if;
      else
        if w <= wF then
          dww := BuildingSystems.Utilities.Math.Functions.interpolate(u=w,xd=dwwTabX,yd=dwwTabY,d=d2);
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
