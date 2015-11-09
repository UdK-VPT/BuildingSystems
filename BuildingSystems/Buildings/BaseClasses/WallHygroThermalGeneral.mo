within BuildingSystems.Buildings.BaseClasses;
partial model WallHygroThermalGeneral
  "General hygrot-hermal wall model"
  extends BuildingSystems.Buildings.BaseClasses.WallGeneral;
  parameter Modelica.SIunits.Temp_K T_start[constructionData.nLayers]={293.15 for i in 1:constructionData.nLayers}
    "Start temperature of each layer"
    annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Types.RelativeHumidity phi_start[constructionData.nLayers]={0.5 for i in 1:constructionData.nLayers}
    "Start relative humidity of each layer"
    annotation (Dialog(tab="Initialization"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction constructionData
    "Data of the hygro-thermal construction"
    annotation(HideResult=true, Dialog(tab ="General",group="Construction"),choicesAllMatching=true);
end WallHygroThermalGeneral;
