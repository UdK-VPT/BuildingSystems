within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0DDistrict
  "Simplified low-order building for district simulation"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D(
    final VAir = 0.8*length*width*heightSto*nSto,
    final AAmb = ARoo+AFac,
    final AGro = length*width,
    final AInn = 2.0 * length * width * (nSto-1) // area of interior ceilings
      + (2.0 * integer(width/4.0+0.5) * length + 2.0 * integer(length/4.0+0.5) * width) * nSto, // area of interior ceilings
    final UValAmb = (ARoo*UValRoo+AFac*UValFac)/(ARoo+AFac),
    UValGro = 1.0,
    UValInn = 1.0,
    final CAmb = 1000.0*VAir,
    final CGro = 1000.0*VAir,
    final CInn = 1000.0*VAir,
    final nWindows = 4,
    AWin = {fWin*length*heightSto*nSto,fWin*width*heightSto*nSto,fWin*length*heightSto*nSto,fWin*width*heightSto*nSto},
    UValWin = {2.0,2.0,2.0,2.0});
  parameter Modelica.SIunits.Length length = 10.0
    "Length of the building";
  parameter Modelica.SIunits.Length width = 10.0
    "Width of the building";
  final parameter Modelica.SIunits.Area ARoo = length * width
    "Roof area of the building";
  final parameter Modelica.SIunits.Area AFac = (2*length+2*width)*heightSto*nSto-sum(AWin)
    "Opaque facade area of the building";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValFac = 1.0
    "Mean heat loss coefficient of the opaque building facade";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValRoo = 1.0
    "Mean heat loss coefficient of the building roof";
  parameter Modelica.SIunits.Length heightSto = 3.0
    "Height of one storey";
  parameter Integer nSto = 2
    "Number of storeys";
  final parameter Modelica.SIunits.Area AFloorSpace = width*length*nSto
    "Floor space area of the building";
  parameter Real fWin = 0.3
    "Window percentage of the facades";
  Real q_flow_heating
    "Floor space specific heating power";
  final parameter Real AV = (AAmb+length*width+sum(AWin))/(length*width*heightSto*nSto)
    "Ratio area to volume";
  equation
  q_flow_heating  = zone.Q_flow_heating / AFloorSpace;

  annotation(defaultComponentName="building");
end Building1Zone0DDistrict;
