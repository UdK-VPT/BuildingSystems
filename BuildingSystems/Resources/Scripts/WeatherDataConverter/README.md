# Generation of netcdf weather data files

In order to generate weather data files that are compatible with the `WeatherDataNetcdf` and `Ambient` components of the BuildingSystems library, you can use the MeteonormFile.py Python 2.7 script.

### Requirements:
- Python 2.7
- pupynere (Python module)

### Usage:
- Bring your weather data into the same format as shown in `ExampleWeather.dat`
- The required data is given in the table below
- Execute from command line `python MeteonormFile.py ExampleWeather.dat`
- The resulting .nc-file can now be used with the `WeatherDataNetcdf` and `Ambient` components of BuildingSystems library

### Required data:

| Variable          | Abbreviation | Unit  |
|-------------------|--------------|-------|
| Time              | hy           | s     |
| Air pressure      | p            | hPa   |
| Air temperature   | Ta           | °C    |
| Relative humidity | RH           | %     |
| Beam radiation    | G_Bh         | W/m^2 |
| Diffuse radiation | G_Dh         | W/m^2 |
| Cloud cover       | N            | 1/8   |
| Wind speed        | FF           | m/s   |
| Wind direction    | DD           | deg   |
