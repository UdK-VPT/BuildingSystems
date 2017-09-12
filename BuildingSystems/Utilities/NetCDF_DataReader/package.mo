within BuildingSystems.Utilities;
package NetCDF_DataReader "Data reader for the Netcdf-format"
  extends Modelica.Icons.VariantsPackage;

annotation(Documentation(info="<html>
  <p>
  This package contains functions and a data reader for data in the Netcdf-format
  </p>
  <pre>
    <b>ncEasyGet1D</b> function to get an interpolated value from a netCDF file.
    <b>ncEasyGetAttributeDouble</b> function to get get an attribute from a netCDF file as Real.
    <b>ncEasyGetAttributeLong</b> function to get an attribute from a netCDF file as Integer.
    <b>ncEasyGetAttributeString</b> function to get an attribute from a netCDF file as Integer as String.
    <b>NcDataReader</b> block for reading netCDF data from a file.
    <b>ExampleNcDataReader</b> Example for the NcDataReader (reading weather data).
 </pre>
 </html>"));
//version="1.0",versionDate="01.06.2010",
end NetCDF_DataReader;
