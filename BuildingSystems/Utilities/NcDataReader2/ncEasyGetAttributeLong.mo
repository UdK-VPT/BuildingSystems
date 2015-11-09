within BuildingSystems.Utilities.NcDataReader2;
function ncEasyGetAttributeLong
  "get an attribute from a netCDF file as Integer"
  input String fileName;
  input String varName;
  input String attName;
  output Integer a;
  external "C";
  annotation (Include="#include <ncDataReaderEA.h>",IncludeDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/",                                                             Library={"ncDataReader2", "netcdf"},LibraryDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/");
end ncEasyGetAttributeLong;
