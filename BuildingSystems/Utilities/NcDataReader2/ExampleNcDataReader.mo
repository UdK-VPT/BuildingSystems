within BuildingSystems.Utilities.NcDataReader2;
model ExampleNcDataReader
  extends Modelica.Icons.Example;
  NcDataReader datareader(
    varNameTime = {"air_temperature", "wind_speed", "wind_direction", "beam_radiation", "diffuse_radiation", "relative_humidity", "cloud_cover"},
    varTimeLowerLimit = {-273.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
    varTimeUpperLimit = {100.0, 20.0, 360.0, 1000.0, 1000.0, 1.0, 8.0},
    varNameConstant = {"longitude", "latitude", "longitude_0"},
    fileName = Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_HamburgTRYnormal_weather.nc"));
  annotation(experiment(StartTime=-3e+006,StopTime=4e+007,Interval = 860));
end ExampleNcDataReader;
