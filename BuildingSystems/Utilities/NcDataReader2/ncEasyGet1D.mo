within BuildingSystems.Utilities.NcDataReader2;
function ncEasyGet1D "get an interpolated value from a netCDF file"
  input String fileName;
  input String varName;
  input Real x;
  output Real y;
  external "C";
  annotation (Include="#include <ncDataReaderEA.h>",IncludeDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/",                                                              Library={"ncDataReader2", "netcdf"},LibraryDirectory=
        "modelica://BuildingSystems/Utilities/LibrariesNcDataReader2/");
end ncEasyGet1D;
