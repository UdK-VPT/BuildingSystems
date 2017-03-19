within BuildingSystems.Buildings.Airpathes;
model AirpathConstant
  "Model of an air path with an constant opening"
  extends BuildingSystems.Buildings.BaseClasses.AirpathGeneral(
    k=kConstant,
    m=mConstant);
  parameter BuildingSystems.Types.FlowCoefficient kConstant= 0.5
    "Flow coefficient";
  parameter Real mConstant(unit = "1") = 0.5
    "Flow exponent";
  annotation (
Documentation(info="<html>
<p>
This is a model of an air path with an constant opening.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirpathConstant;
