within BuildingSystems.Utilities.NcDataReader2;
function ncEasyGetAttributeDouble "get an attribute from a netCDF file as Real"
  input String fileName;
  input String varName;
  input String attName;
  output Real a;
  external "C";
  annotation (Include="#include <ncDataReaderEA.h>",IncludeDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/",                                                              Library={"ncDataReader2", "netcdf"},LibraryDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/");
end ncEasyGetAttributeDouble;
