within BuildingSystems.Buildings.Airpathes;
model AirpathConstant "Model of an air path with an constant opening"
  extends BuildingSystems.Buildings.BaseClasses.AirpathGeneral(
    k=kConstant,
    m=mConstant);
  parameter BuildingSystems.Types.FlowCoefficient kConstant= 0.5
    "Flow coefficient";
  parameter Real mConstant(unit = "1") = 0.5
    "Flow exponent";
end AirpathConstant;
