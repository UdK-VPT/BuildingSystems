within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels;
partial model UPartialClass
  parameter Modelica.SIunits.Area SPip = (Modelica.Constants.pi*d_o*d_o/4) - SWat
    "Cross-sectional wall area of the pipe (area of piping material)"                                                                                  annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.Area SWat = (Modelica.Constants.pi*d_i*d_i/4)
    "Cross-sectional inside area of the pipe"                                                                            annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.Density den_p = 8 "Density of the pipe material"
    annotation(Dialog(tab="General", group="Thermal properties"));
  parameter Modelica.SIunits.SpecificHeatCapacity cp_p = 0.49
    "Specific heat capacity of the pipe material"
    annotation(Dialog(tab="General", group="Thermal properties"));
  extends
    BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.PipeInfo(d_i = 0.1);
  parameter Integer nPipes( min=2) "Number of pipes";
  Modelica.Blocks.Interfaces.RealOutput[nPipes] U(unit="W/(m.K)")
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{60,-20},{-60,60}},
          lineColor={0,0,255},
          textString="U model")}), Diagram(coordinateSystem(preserveAspectRatio=
           false, extent={{-100,-100},{100,100}}), graphics));
end UPartialClass;
