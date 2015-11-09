within BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels;
model OpticalModelSimple
  "Simplified calculation of the overall solar radiation for the PV cell"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels.OpticalModelGeneral;
equation
  ITotRed = radiationPort.IrrDir * (1.0 - GSC) + radiationPort.IrrDif;
end OpticalModelSimple;
