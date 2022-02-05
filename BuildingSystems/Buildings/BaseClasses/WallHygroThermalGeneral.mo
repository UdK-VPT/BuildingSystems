within BuildingSystems.Buildings.BaseClasses;
partial model WallHygroThermalGeneral
  "General hygro-hermal wall model"
  extends BuildingSystems.Buildings.BaseClasses.WallGeneral(
    thickness = sum(constructionData.thickness[i] for i in 1:constructionData.nLayers));
  parameter Modelica.Units.SI.Temperature T_start[constructionData.nLayers]={
      293.15 for i in 1:constructionData.nLayers}
    "Start temperature of each layer" annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Types.RelativeHumidity phi_start[constructionData.nLayers]={0.5 for i in 1:constructionData.nLayers}
    "Start relative humidity of each layer"
    annotation (Dialog(tab="Initialization"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction constructionData
    "Data of the hygro-thermal construction"
    annotation(HideResult=true, Dialog(tab= "General",group="Construction"),choicesAllMatching=true);
  final parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaIns=
      7.692
    "Heat transfer coefficient (convection + radiation) inside of the wall"; // after German DIN 4701 Teil2 tabular 16"
  final parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaAmb=
      25.0
    "Heat transfer coefficient (convection + radiation) outside of the wall"; // after german DIN 4701 Teil2 tabular 16"
  final parameter Modelica.Units.SI.CoefficientOfHeatTransfer UVal=1.0/(1.0/
      alphaIns + sum(constructionData.thickness[i]/constructionData.material[i].lambdaDry
      for i in 1:constructionData.nLayers) + 1.0/alphaAmb)
    "U-value of the wall construction under standard conditions";

  annotation (
Documentation(info="<html>
<p>
This is partial model description of a hygro-thermal wall.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WallHygroThermalGeneral;
