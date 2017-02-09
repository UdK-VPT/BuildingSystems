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
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionData
    "Data of the thermal construction"
    annotation(Dialog(tab = "General", group = "Construction"), choicesAllMatching=true);
  parameter Modelica.SIunits.Temp_K T_start[constructionData.nLayers]={293.15 for i in 1:constructionData.nLayers}
    "Start temperature of each layer"
    annotation (Dialog(tab="Initialization"));  
  final parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaIns = 7.692
    "Heat transfer coefficient (convection + radiation) inside of the wall"; // after German DIN 4701 Teil2 tabular 16"
  final parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaAmb = 25.0
    "Heat transfer coefficient (convection + radiation) outside of the wall"; // after german DIN 4701 Teil2 tabular 16"
  final parameter Modelica.SIunits.CoefficientOfHeatTransfer UVal =
    1.0/(1.0/alphaIns+sum(constructionData.thickness[i]/constructionData.material[i].lambda for i in 1:constructionData.nLayers)+1.0/alphaAmb)
    "U-value of the wall construction under standard conditions";
end WallThermalGeneral;
