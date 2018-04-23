within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0DDistrict
  "Low-order building model for district simulation"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D(
    final VAir = f_W_BGF*length*width*heightSto*(nSto-thicknessSla),
    final AAmb = ARoo+AFac,
    final AGro = (length-thicknessFac)*(width-thicknessFac),
    final AInn = 2.0*length*width*(nSto-1) // area of interior ceilings
      +(2.0*integer(width/4.0+0.5)*length+2.0*integer(length/4.0+0.5)*width)*nSto, // area of interior walls
    final UValAmb = (ARoo*UValRoo+AFac*UValFac)/(ARoo+AFac),
    UValGro = 1.0,
    UValInn = 1.0,
    final CAmb = if conAmb == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AAmb
      else if conAmb == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AAmb
      else 105000.0 * AAmb,
    final CGro = if conGro == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AGro
      else if conGro == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AGro
      else 105000.0 * AGro,
    final CInn = if conInn == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Low then 25000.0 * AInn
      else if conInn == BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium then 65000.0 * AInn
      else 105000.0 * AInn,
    final nWindows = 4,
    final height = heightSto*nSto,
    final AWin = {
      fWin*length*heightSto*nSto*(1.0-fAreaAdjBld),
      fWin*width*heightSto*nSto*(1.0-fAreaAdjBld),
      fWin*length*heightSto*nSto*(1.0-fAreaAdjBld),
      fWin*width*heightSto*nSto*(1.0-fAreaAdjBld)
    },
    UValWin = {2.0,2.0,2.0,2.0});
  parameter Modelica.SIunits.Length length = 10.0
    "Length of the building"
    annotation (Dialog(tab = "General", group = "Geometry building"));
  parameter Modelica.SIunits.Length width = 10.0
    "Width of the building"
    annotation (Dialog(tab = "General", group = "Geometry building"));
  parameter Modelica.SIunits.Length thicknessFac = 0.4
    "Mean thickness of the facade opaque construction"
    annotation (Dialog(tab = "General", group = "Geometry building"));
  parameter Modelica.SIunits.Length thicknessSla = 0.3
    "Mean thickness of the slab construction between the floors"
    annotation (Dialog(tab = "General", group = "Geometry building"));
  parameter Real fAreaAdjBld = 0.0
    "Area reduction factor for common walls with adjacent buildings"
    annotation (Dialog(tab = "General", group = "Geometry building"));
  parameter Real f_W_BGF = 0.75
    "Relation living area (Wohnfläche) to gross floor area (Bruttogrundfläche)"
      annotation (Dialog(tab = "General", group = "Geometry building"));
  final parameter Modelica.SIunits.Area ARoo =
    (length-thicknessFac)*(width-thicknessFac)
    "Roof area of the building";
  final parameter Modelica.SIunits.Area AFac =
    (2.0*(length-thicknessFac)+2.0*(width-thicknessFac))*(heightSto-thicknessSla)*nSto*(1.0-fAreaAdjBld)-sum(AWin)
    "Opaque facade area of the building";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValFac = 1.0
    "Mean heat loss coefficient of the opaque building facade"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Ambient constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValRoo = 1.0
    "Mean heat loss coefficient of the building roof"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Roof constructions"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conAmb = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity outside construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conGro = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity building plate construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter BuildingSystems.Buildings.Types.ThermalBuildingCapacity conInn = BuildingSystems.Buildings.Types.ThermalBuildingCapacity.Medium
    "Thermal capacity inner building construction"
    annotation (Evaluate=true, Dialog(tab="Constructions", group="Thermal building capacity"));
  parameter Modelica.SIunits.Length heightSto = 3.0
    "Brutto height of one storey"
    annotation(Dialog(tab = "General", group = "Geometry building"));
  parameter Integer nSto = 2
    "Number of storeys"
    annotation(Dialog(tab = "General", group = "Geometry building"));
  final parameter Modelica.SIunits.Area AFloorSpace = width*length*nSto
    "Floor space area of the building";
  parameter Real fWin = 0.3
    "Window percentage of the facades"
    annotation(Dialog(tab = "General", group = "Geometry windows"));
  final parameter Real AV = (2*length+2*width+2*length*width)/(length*width*heightSto*nSto)
    "Ratio area to volume";

  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a low-order building model for district simulation.
</p>
</html>", revisions="<html>
<ul>
<li>
April 23, 2018 by Christoph Nytsch-Geusen:<br/>
Improvement of the building geometry model.
</li>
<li>
March 4, 2018 by Christoph Nytsch-Geusen:<br/>
Area reduction factor for common walls of adjacent buildings introduced.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Building1Zone0DDistrict;
