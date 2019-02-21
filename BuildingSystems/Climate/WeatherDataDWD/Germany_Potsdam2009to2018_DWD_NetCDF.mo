within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2009to2018_DWD_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: DWD",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Potsdam_2009_to_2018_DWD.nc"))
  annotation(Documentation(info="<html>
  source: DWD <p>
  beginning of year: <br>
  2009: 0 h, 0 s <br>
  2010: 8760 h, 31536000 s <br>
  2011: 17520 h, 63072000 s <br>
  2012: 26280 h, 94608000 s <br>
  2013: 35064 h, 126230400 s <br>
  2014: 43824 h, 157766400 s <br>
  2015: 52584 h, 189302400 s <br>
  2016: 61344 h, 220838400 s <br>
  2017: 70128 h, 252460800 s <br>
  2018: 78888 h, 283996800 s <br>
  </html>"));
end Germany_Potsdam2009to2018_DWD_NetCDF;
