within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;

function myPhiMoist
  "Calculates the water vapour diffusion coefficient"
  input BuildingSystems.Types.RelativeHumidity myTabX[:];
  input BuildingSystems.Types.WaterVapourDiffusionResistance myTabY[:];
  input BuildingSystems.Types.WaterVapourDiffusionResistance myDry;
  input BuildingSystems.Types.RelativeHumidity phi;
  output BuildingSystems.Types.WaterVapourDiffusionResistance value;
protected
  Integer n=size(myTabX,1);

algorithm
  if phi < 0.0 then
    value := myDry;
  elseif phi >= 0.0 and phi <= 1.0 then
    value := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(phi,myTabX,myTabY,2);
  else
    value := myTabY[n];
  end if;
end myPhiMoist;
