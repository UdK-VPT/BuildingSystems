within BuildingSystems.Buildings.BaseClasses;
partial model WallThermalGeneral
  "General thermal wall model"
  extends BuildingSystems.Buildings.BaseClasses.WallGeneral;
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.MoistureFlowFixed moistBcPort1(
    m_flow_constant = 0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=90,origin={-20,-16})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.MoistureFlowFixed moistBcPort2(
    m_flow_constant = 0.0)
    annotation (Placement(transformation(extent={{8,-8},{-8,8}},rotation=-90,origin={20,-16})));
  parameter Modelica.SIunits.Temp_K T_start[constructionData.nLayers]={293.15 for i in 1:constructionData.nLayers}
    "Start temperature of each layer"
    annotation (Dialog(tab="Initialization"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionData
    "Data of the thermal construction"
    annotation(Dialog(tab = "General", group = "Construction"), choicesAllMatching=true);
end WallThermalGeneral;
