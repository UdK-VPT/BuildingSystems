within BuildingSystems.Utilities.Visualisation3D.Examples;
model BuildingGroupVis3D
  extends Modelica.Icons.Example;
  BuildingVis3D building1(
    xVis3D= 0.0,yVis3D= 0.0,zVis3D= 0.0,zAngleVis3D= 0.0,
    height_inside = 10.0, length_inside = 4.0, width_inside = 4.0,
    width_window = 1.0, height_window = 9.0);
  BuildingVis3D building2(
    xVis3D= 20.0,yVis3D= 0.0,zVis3D= 0.0,zAngleVis3D= 45.0);
  BuildingVis3D building3(
    xVis3D= 20.0,yVis3D= 20.0,zVis3D= 0.0,zAngleVis3D= 90.0,
    length_inside = 4.0, width_inside = 20.0);
  BuildingVis3D basement(
    xVis3D= 0.0,yVis3D=20.0,zVis3D= 0.0,zAngleVis3D= 135.0,
    length_inside = 4.0, width_inside = 4.0, overhang_roof = 0.0, width_stripe_groundplate = 1.0,
    width_window = 1.0);
  BuildingVis3D first_floor(
    xVis3D= 0.0,yVis3D=20.0,zVis3D= 3.3,zAngleVis3D= 225.0,
    length_inside = 4.0, width_inside = 4.0, overhang_roof = 0.0, width_stripe_groundplate = 0.0,
    width_window = 1.0);
  BuildingVis3D second_floor(
    xVis3D= 0.0,yVis3D=20.0,zVis3D= 2*3.3,zAngleVis3D= 315.0,
    length_inside = 4.0, width_inside = 4.0, overhang_roof = 0.0, width_stripe_groundplate = 0.0,
    width_window = 1.0);
  BuildingVis3D third_floor(
    xVis3D= 0.0,yVis3D=20.0,zVis3D= 3*3.3,zAngleVis3D= 45.0,
    length_inside = 4.0, width_inside = 4.0, overhang_roof = 1.0, width_stripe_groundplate = 0.0,
    width_window = 1.0);
end BuildingGroupVis3D;
