within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0DDistrict
  "Simplified low-order building for district simulation"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D(
    final VAir = 0.8*length*width*heightSto*nSto,
    final AAmbient = ARoof+AFacade,
    final AGround = length*width,
    final AInner = 2.0 * length * width * (nSto-1) // area of interior ceilings
      + (2.0 * integer(width/4.0+0.5) * length + 2.0 * integer(length/4.0+0.5) * width) * nSto, // area of interior ceilings
    final UValAmbient = (ARoof*URoof+AFacade*UFacade)/(ARoof+AFacade),
    UValGround = 1.0,
    UValInner = 1.0,
    final CAmbient = 1000.0*VAir,
    final CGround = 1000.0*VAir,
    final CInner = 1000.0*VAir,
    final nWindows = 4,
    AWindow = {fWin*length*heightSto*nSto,fWin*width*heightSto*nSto,fWin*length*heightSto*nSto,fWin*width*heightSto*nSto},
    UValWindow = {2.0,2.0,2.0,2.0});
  parameter Modelica.SIunits.Length length = 10.0
    "Length of the building";
  parameter Modelica.SIunits.Length width = 10.0
    "Width of the building";
  final parameter Modelica.SIunits.Area ARoof = length * width
    "Roof area of the building";
  final parameter Modelica.SIunits.Area AFacade = (2*length+2*width)*heightSto*nSto-sum(AWindow)
    "Opaque facade area of the building";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UFacade = 1.0
    "Mean heat loss coefficient of the opaque building facade";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer URoof = 1.0
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
  final parameter Real AV = (AAmbient+length*width+sum(AWindow))/(length*width*heightSto*nSto)
    "Ratio area to volume";
  equation
  q_flow_heating  = zone.Q_flow_heating / AFloorSpace;
end Building1Zone0DDistrict;
