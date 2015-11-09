within BuildingSystems.Utilities.NcDataReader2;
function ncEasyGetAttributeString
  "get an attribute from a netCDF file as String"
  input String fileName;
  input String varName;
  input String attName;
  output String a;
  external "C";
  annotation (Include="#include <ncDataReaderEA.h>",IncludeDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/",                                                             Library={"ncDataReader2", "netcdf"},LibraryDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/");
end ncEasyGetAttributeString;
