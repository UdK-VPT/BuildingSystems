within BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels;
model OpticalModelSimple
  "Simplified calculation of the overall solar radiation for the PV cell"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels.OpticalModelGeneral;
equation
  ITotRed = radiationPort.IrrDir * (1.0 - GSC) + radiationPort.IrrDif;

  annotation (
Documentation(info="<html>
<p>
Optical model that calculates the reduction of the solar irradiation between the surface
of the PV module and the PV cell.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpticalModelSimple;
