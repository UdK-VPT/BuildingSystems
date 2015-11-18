within BuildingSystems.Utilities.NcDataReader2;
block NcDataReader
  extends Modelica.Blocks.Interfaces.MO(nout = size(varNameTime, 1));
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
end NcDataReader;
