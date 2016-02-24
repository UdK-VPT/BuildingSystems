within BuildingSystems.HAM.HeatAndMoistureTransport.BaseClasses;
partial model HeatAndMoistureTransportGeneral
  "General model for combined heat conduction and moisture transport"
  replaceable parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral material
    "Material of the body"
    annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);
  Real sorTabX[nRowsSor+1]
    "Sorption isotherm of the physical layer (table)"
    annotation(HideResult=true);
  Real sorTabY[nRowsSor+1]
    "Sorption isotherm of the physical layer (table)"
    annotation(HideResult=true);
  parameter Modelica.SIunits.Length lengthX
    "Length in x dimension";
  parameter Modelica.SIunits.Length lengthY
    "Length in y dimension";
  parameter Modelica.SIunits.Length lengthZ
    "Length in z dimension";
protected
  parameter Integer nRowsSor = size(material.sorTabX,1);
  parameter Modelica.SIunits.MassConcentration wMax = rhoH2O * material.porosity
    "Maximum value of water content of the material";
  constant Modelica.SIunits.Density rhoH2O = 1000.0
    "Density of water";
  constant BuildingSystems.Types.RelativeHumidity phiMax = 1.01
    "Maximum value of relative humidity";
  constant Modelica.SIunits.SpecificEnergy Hv = 2.47e6
    "Evaporation heat of water";
  constant Modelica.SIunits.SpecificHeatCapacity cH2O = 4185.0
    "Specific heat capacity of water";
equation
  for i in 1:size(material.sorTabX,1) loop
    sorTabX[i] = material.sorTabX[i];
    sorTabY[i] = material.sorTabY[i];
  end for;
  sorTabX[nRowsSor+1] = phiMax;
  sorTabY[nRowsSor+1] = wMax;

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=FillPattern.Solid,textString="%name")}));
end HeatAndMoistureTransportGeneral;
