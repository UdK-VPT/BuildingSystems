within BuildingSystems.Climate.WeatherData;
record WeatherDataFile
  "Template for weather data files"
  parameter String info = "";
  parameter String fileName = ""
    annotation(Dialog(loadSelector(filter="NetCDF files (*.nc)",caption="Select weather-data file")));
end WeatherDataFile;
