within BuildingSystems.Buildings.Airpathes;
model AirpathVariable "Model of an air path with an variable opening"
  extends BuildingSystems.Buildings.BaseClasses.AirpathGeneral(k=kVar, m=mVar);
  Modelica.Blocks.Interfaces.RealInput kVar
    "Flow coefficient"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={-20,40}),iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-10,6})));
  Modelica.Blocks.Interfaces.RealInput mVar
    "Flow exponent"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={20,40}),iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={10,6})));
end AirpathVariable;
