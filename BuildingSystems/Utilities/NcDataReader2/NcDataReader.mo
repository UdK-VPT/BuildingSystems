within BuildingSystems.Utilities.NcDataReader2;
block NcDataReader
  extends Modelica.Blocks.Interfaces.MO(nout = size(varNameTime,1));
  parameter String varNameTime[:];
  parameter String varNameConstant[:];
  parameter String fileName;
  parameter Real varTimeUpperLimit[size(varNameTime,1)];
  parameter Real varTimeLowerLimit[size(varNameTime,1)];
protected
  parameter Real constantVariable[size(varNameConstant,1)] = {ncEasyGetAttributeDouble(fileName,"",varNameConstant[j]) for j in 1:size(varNameConstant, 1)};

algorithm
  for i in 1:nout loop
    y[i] := BuildingSystems.Utilities.SmoothFunctions.softcut(
      ncEasyGet1D(
        fileName,
        varNameTime[i],
        time),
      varTimeLowerLimit[i],
      varTimeUpperLimit[i],
      0.01);
  end for;
  annotation (Documentation(info="<html>
<p>
The block is used to read information from <code>.nc</code> files. It calls the external C functions <code>ncEasyGet1D</code> and <code>ncEasyGetAttributeDouble</code>.
</p>

<h4>Common errors</h4>

<p>
When the following error message appears:
</p>
<p>
<code>
ERROR | -43 | netcdf  | NetCDF: Attribute not found
</code>
</p>
<p>
It may be due to the called function cannot find in the readed <code>.nc</code> file some of the variables defined in <code>varNameTime</code> or <code>varNameConstant</code>.
</p>

</html>"));
end NcDataReader;
