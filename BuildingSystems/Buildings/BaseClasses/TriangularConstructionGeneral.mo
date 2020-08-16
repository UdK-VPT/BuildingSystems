within BuildingSystems.Buildings.BaseClasses;
partial model TriangularConstructionGeneral
  "General model of triangular building constructions (walls, windows, roofs etc.)"
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_1(
    A=ASur,
    abs = abs_1,
    geo(
      angleDegAzi = angleDegAzi,
      angleDegTil = angleDegTil,
      width = sqrt(ASur),
      height = sqrt(ASur),
      zMean = position[3],
      vertex1 = verticesGlobal_internal[1],
      vertex2 = verticesGlobal_internal[2],
      vertex3 = verticesGlobal_internal[3],
      vertex4 = {0.0,0.0,0.0}),
    epsilon = epsilon_1)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}}),
      iconTransformation(extent={{-40,-10},{-20,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=ASur,
    abs = abs_2,
    geo(
      angleDegAzi = angleDegAzi,
      angleDegTil = angleDegTil,
      width = sqrt(ASur),
      height = sqrt(ASur),
      zMean = position[3],
      vertex1 = verticesGlobal_internal[3],
      vertex2 = verticesGlobal_internal[2],
      vertex3 = verticesGlobal_internal[1],
      vertex4 = {0.0,0.0,0.0}),
    epsilon = epsilon_2)
    "Interface to surface on side 2"
    annotation (Placement(transformation(extent={{20,-10},{40,10}}),
      iconTransformation(extent={{20,-10},{40,10}})));
  parameter BuildingSystems.Buildings.Types.GeometryType geometryType = BuildingSystems.Buildings.Types.GeometryType.Fixed
    "Fixed (default) or flexible geometry"
    annotation (Evaluate=true, Dialog(tab = "Geometry", group = "General"));
  parameter BuildingSystems.Buildings.Types.CoordinateType coordinateType = BuildingSystems.Buildings.Types.CoordinateType.Local
    "Local (default) or global"
    annotation (Evaluate=true, Dialog(tab = "Geometry", group = "Coordinates"));
  parameter Modelica.SIunits.Length verticesLocal[3,2] = {{0.0,0.0},{0.0,1.0},{0.5,1.0}}
    "Local 2D vertices (if geometryType == Fixed and coordinateType == Local)"
    annotation(Dialog(tab = "Geometry", group = "Coordinates"));
  output BuildingSystems.Interfaces.LengthOutput verticesLocal_internal[3,2]
    "Local 2D vertices";
  input BuildingSystems.Interfaces.LengthInput verticesLocal_in[3,2]
    if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
      and coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Local
    "Local 2D vertices from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,-36}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-20,-20})));
  parameter Modelica.SIunits.Length verticesGlobal[3,3] = {{0.0,0.0,0.0},{0.0,1.0,0.0},{0.5,1.0,0.0}}
    "Global 3D vertices (if geometryType == Fixed and coordinateType == Global)"
    annotation(Dialog(tab = "Geometry", group = "Coordinates"));
  output BuildingSystems.Interfaces.LengthOutput verticesGlobal_internal[3,3]
    "Global 3D vertices";
  input BuildingSystems.Interfaces.LengthInput verticesGlobal_in[3,3]
    if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
      and coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Global
      "Global 3D vertices from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,-46}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-20,-40})));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi = 0.0
    "Azimuth angle (if geometryType == Fixed and coordinateType = Local) -> south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg"
    annotation(Dialog(tab = "Geometry", group = "Orientation"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegAzi_internal
    "Azimuth angle";
  input BuildingSystems.Interfaces.Angle_degInput angleDegAzi_in(
    min=-180.0,
    max=180.0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
                  and coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Local
    "Azimuth angle from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,  origin={30,-46}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={22,-40})));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil = 90.0
    "Tilt angle (if geometryType == Fixed and coordinateType = Local) -> bottom: 0 deg, perpendicular: 90 deg, ceiling: 180 deg"
    annotation(Dialog(tab = "Geometry", group = "Orientation"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegTil_internal
    "Tilt angle";
  input BuildingSystems.Interfaces.Angle_degInput angleDegTil_in(
    min=0.0,
    max=180.0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
                  and coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Local
    "Tilt angle from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,  origin={30,-36}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={22,-20})));
  parameter Modelica.SIunits.Length position[3] = {0.0,0.0,0.0}
    "Position (if geometryType == Fixed and coordinateType == Local)"
    annotation(Dialog(tab = "Geometry", group = "General"));
  output BuildingSystems.Interfaces.LengthOutput position_internal[3]
    "Position";
  input BuildingSystems.Interfaces.LengthInput position_in[3]
    if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
      "Position from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,origin={30,20}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={22,20})));
  parameter BuildingSystems.Types.Absorptance abs_1 = 0.5
    "Short-wave absorptance side 1"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter BuildingSystems.Types.Absorptance abs_2 = 0.5
    "Short-wave absorptance side 2"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter Modelica.SIunits.Emissivity epsilon_1 = 0.9
    "Long-wave emittance side 1"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter Modelica.SIunits.Emissivity epsilon_2 = 0.9
    "Long-wave emittance side 2"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  Modelica.SIunits.Area ASur
    "Surface area";
protected
  parameter Modelica.SIunits.Length thickness
    "Total thickness of the construction";
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    angleDegAzi_internal = angleDegAzi;
    angleDegTil_internal = angleDegTil;
    verticesLocal_internal = verticesLocal;
    if coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Global then
      verticesGlobal_internal = verticesGlobal;
    end if;
    position_internal = position;
  else
    connect(position_internal, position_in);
    connect(angleDegAzi_internal,angleDegAzi_in);
    connect(angleDegTil_internal,angleDegTil_in);
    connect(verticesLocal_internal,verticesLocal_in);
    if coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Global then
      connect(verticesGlobal_internal,verticesGlobal_in);
    end if;
  end if;

  if coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Local then
    verticesGlobal_internal[1] = position_internal + BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      BuildingSystems.Buildings.Geometries.Functions.rotateVector({verticesLocal_internal[1,1],verticesLocal_internal[1,2],0.0},{1.0,0.0,0.0},
      -Modelica.Constants.pi/180.0*angleDegTil_internal),{0.0,0.0,0.1},-Modelica.Constants.pi/180.0*angleDegAzi_internal);
    verticesGlobal_internal[2] = position_internal + BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      BuildingSystems.Buildings.Geometries.Functions.rotateVector({verticesLocal_internal[2,1],verticesLocal_internal[2,2],0.0},{1.0,0.0,0.0},
      -Modelica.Constants.pi/180.0*angleDegTil_internal),{0.0,0.0,0.1},-Modelica.Constants.pi/180.0*angleDegAzi_internal);
    verticesGlobal_internal[3] = position_internal + BuildingSystems.Buildings.Geometries.Functions.rotateVector(
      BuildingSystems.Buildings.Geometries.Functions.rotateVector({verticesLocal_internal[3,1],verticesLocal_internal[3,2],0.0},{1.0,0.0,0.0},
      -Modelica.Constants.pi/180.0*angleDegTil_internal),{0.0,0.0,0.1},-Modelica.Constants.pi/180.0*angleDegAzi_internal);
  end if;

  annotation (
Documentation(info="<html>
<p>
This is partial model description of a triangular building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
August 8, 2020 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end TriangularConstructionGeneral;
