within BuildingSystems.Buildings.Airvolumes;
package Airvolume3D "Package for 3D discretized air volume models"
  extends Modelica.Icons.Package;

  model zone3Dwrap "Adapter of the airvolume body to match the walls"
    extends BuildingSystems.Buildings.Airvolumes.Airvolume3D.zone3Dbuilt;

    /* old version

  parameter Integer nConstructions1 "Number of Constructions Surface 1" annotation (HideResult=true);
  parameter Integer nConstructions2 "Number of Constructions Surface 2" annotation (HideResult=true);
  parameter Integer nConstructions3 "Number of Constructions Surface 3" annotation (HideResult=true);
  parameter Integer nConstructions4 "Number of Constructions Surface 4" annotation (HideResult=true);
  parameter Integer nConstructions5 "Number of Constructions Surface 5" annotation (HideResult=true);
  parameter Integer nConstructions6 "Number of Constructions Surface 6" annotation (HideResult=true);
  */

  // Anpassungsversuch

    parameter Integer nConstructions1 = 1 "Number of Constructions Surface 1" annotation (HideResult=true);
    parameter Integer nConstructions2 = 1 "Number of Constructions Surface 2" annotation (HideResult=true);
    parameter Integer nConstructions3 = 1 "Number of Constructions Surface 3" annotation (HideResult=true);
    parameter Integer nConstructions4 = 1 "Number of Constructions Surface 4" annotation (HideResult=true);
    parameter Integer nConstructions5 = 1 "Number of Constructions Surface 5" annotation (HideResult=true);
    parameter Integer nConstructions6 = 1 "Number of Constructions Surface 6" annotation (HideResult=true);

  // Anpassungsversuch Ende

    /***************************************************************************/

    parameter Integer gridSurface1[nConstructions1,2]= {{elemY,elemZ}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);
    parameter Integer gridSurface2[nConstructions2,2]= {{elemY,elemX}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);
    parameter Integer gridSurface3[nConstructions3,2]= {{elemY,elemZ}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);
    parameter Integer gridSurface4[nConstructions4,2]= {{elemY,elemX}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);
    parameter Integer gridSurface5[nConstructions5,2]= {{elemZ,elemX}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);
    parameter Integer gridSurface6[nConstructions6,2]= {{elemZ,elemX}}
      "Grid in y and z dimension of each surface" annotation (HideResult=true);

    //********************************************************************/
    /*  old version
  // (Index ai, Index aj, number of Constructions) to map the wall constructions
  // to the array based adapter-walls
  parameter Integer surf1ai[elemY,elemZ]
    "Description of the Surface"   annotation (HideResult=true);
  parameter Integer surf1aj[elemY,elemZ]
    "Description of the Surface"   annotation (HideResult=true);
  parameter Integer surf1nCon[elemY,elemZ]
    "Description of the Surface"   annotation (HideResult=true);

  parameter Integer surf2ai[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf2aj[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf2nCon[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);

  parameter Integer surf3ai[elemY,elemZ]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf3aj[elemY,elemZ]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf3nCon[elemY,elemZ]
    "Description of the Surface"  annotation (HideResult=true);

  parameter Integer surf4ai[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf4aj[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf4nCon[elemY,elemX]
    "Description of the Surface"  annotation (HideResult=true);

  parameter Integer surf5ai[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf5aj[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf5nCon[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);

  parameter Integer surf6ai[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf6aj[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  parameter Integer surf6nCon[elemZ,elemX]
    "Description of the Surface"  annotation (HideResult=true);
  */

  // Anpassungsversuch

    // (Index ai, Index aj, number of Constructions) to map the wall constructions
    // to the array based adapter-walls
    parameter Integer surf1ai[elemY,elemZ] = {{k for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"   annotation (HideResult=true);
    parameter Integer surf1aj[elemY,elemZ] = {{j for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"   annotation (HideResult=true);
    parameter Integer surf1nCon[elemY,elemZ] = {{1 for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"   annotation (HideResult=true);

    parameter Integer surf2ai[elemY,elemX] = {{i for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf2aj[elemY,elemX] = {{j for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf2nCon[elemY,elemX] = {{1 for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);

    parameter Integer surf3ai[elemY,elemZ] = {{k for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf3aj[elemY,elemZ] = {{j for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf3nCon[elemY,elemZ] = {{1 for j in 1:elemY} for k in 1:elemZ}
      "Description of the Surface"  annotation (HideResult=true);

    parameter Integer surf4ai[elemY,elemX] = {{i for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf4aj[elemY,elemX] = {{j for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf4nCon[elemY,elemX] = {{1 for j in 1:elemY} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);

    parameter Integer surf5ai[elemZ,elemX] = {{i for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf5aj[elemZ,elemX] = {{k for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf5nCon[elemZ,elemX] = {{1 for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);

    parameter Integer surf6ai[elemZ,elemX] = {{i for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf6aj[elemZ,elemX] = {{k for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);
    parameter Integer surf6nCon[elemZ,elemX] = {{1 for k in 1:elemZ} for i in 1:elemX}
      "Description of the Surface"  annotation (HideResult=true);

    // Anpassungsversuch Ende

    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortW[nConstructions1](nY=gridSurface1[:, 1], nZ=gridSurface1[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // west
    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortE[nConstructions2](nY=gridSurface2[:, 1], nZ=gridSurface2[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // east
    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortN[nConstructions3](nY=gridSurface3[:, 1], nZ=gridSurface3[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // north
    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortS[nConstructions4](nY=gridSurface4[:, 1], nZ=gridSurface4[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // south
    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortF[nConstructions5](nY=gridSurface5[:, 1], nZ=gridSurface5[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // floor
    BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePortC[nConstructions6](nY=gridSurface6[:, 1], nZ=gridSurface6[:, 2])
      "Interface Wall - Airvolumes"                                                                                                     annotation (HideResult=true); // ceiling

    // Create Adapter Walls
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallEast[elemY,elemZ](
      each location="east",
      dimVec={{{dxVec[elemX],dyVec[j],dzVec[k]} for k in 1:elemZ} for j in 1:elemY},
      each posX=length,
      posY={{posYVec[i] for j in 1:elemZ} for i in 1:elemY},
      posZ={{posZVec[j] for j in 1:elemZ} for i in 1:elemY})
      annotation (HideResult=true);
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallWest[elemY,elemZ](
      each location="west",
      dimVec={{{dxVec[1],dyVec[j],dzVec[k]} for k in 1:elemZ} for j in 1:elemY},
      each posX=0.0,
      posY={{posYVec[j] for k in 1:elemZ} for j in 1:elemY},
      posZ={{posZVec[k] for k in 1:elemZ} for j in 1:elemY})
      annotation (HideResult=true);
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallNorth[elemY,elemX](
      each location="north",
      dimVec={{{dxVec[i],dyVec[j],dzVec[elemZ]} for i in 1:elemX} for j in 1:elemY},
      posX={{posXVec[i] for i in 1:elemX} for j in 1:elemY},
      posY={{posYVec[j] for i in 1:elemX} for j in 1:elemY},
      each posZ=width) annotation (HideResult=true);
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallSouth[elemY,elemX](
      each location="south",
      dimVec={{{dxVec[i],dyVec[j],dzVec[1]} for i in 1:elemX} for j in 1:elemY},
      posX={{posXVec[i] for i in 1:elemX} for j in 1:elemY},
      posY={{posYVec[j] for i in 1:elemX} for j in 1:elemY},
      each posZ=0.0) annotation (HideResult=true);
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallCeiling[elemZ,elemX](
      each location="roof",
      dimVec={{{dxVec[i],dyVec[elemY],dzVec[k]} for i in 1:elemX} for k in 1:elemZ},
      posX={{posXVec[i] for i in 1:elemX} for j in 1:elemZ},
      each posY=height,
      posZ={{posZVec[j] for i in 1:elemX} for j in 1:elemZ})
      annotation (HideResult=true);
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.BoundaryAdapter
      wallFloor[elemZ,elemX](
      each location="floor",
      dimVec={{{dxVec[i],dyVec[1],dzVec[k]} for i in 1:elemX} for k in 1:elemZ},
      posX={{posXVec[i] for i in 1:elemX} for j in 1:elemZ},
      each posY=0.0,
      posZ={{posZVec[j] for i in 1:elemX} for j in 1:elemZ})
      annotation (HideResult=true);

    ////////////////////////////////////////////////////////////

  equation
    // (toSurfacePorts, walls_x) -> kind of adapter

    for iy in 1:elemY loop
      for iz in 1:elemZ loop
      // west W = 1
        connect(wallWest[iy,iz].surfToAir.heatPort[1,1], toSurfacePortW[surf1nCon[elemY+1-iy,iz]].heatPort[surf1aj[iy,iz],surf1ai[elemY+1-iy,iz]]);
        connect(wallWest[iy,iz].surfToAir.moisturePort[1,1], toSurfacePortW[surf1nCon[elemY+1-iy,iz]].moisturePort[surf1aj[iy,iz],surf1ai[elemY+1-iy,iz]]);
        wallWest[iy,iz].surfToAir.vAir[1,1]= toSurfacePortW[surf1nCon[elemY+1-iy,iz]].vAir[surf1aj[iy,iz],surf1ai[elemY+1-iy,iz]];
        wallWest[iy,iz].surfToAir.angleDegAir[1,1]= toSurfacePortW[surf1nCon[elemY+1-iy,iz]].angleDegAir[surf1aj[iy,iz],surf1ai[elemY+1-iy,iz]];
     // east E = 3
        connect(wallEast[iy,iz].surfToAir.heatPort[1,1], toSurfacePortE[surf3nCon[elemY+1-iy,iz]].heatPort[surf3aj[iy,iz],surf3ai[elemY+1-iy,iz]]);
        connect(wallEast[iy,iz].surfToAir.moisturePort[1,1], toSurfacePortE[surf3nCon[elemY+1-iy,iz]].moisturePort[surf3aj[iy,iz],surf3ai[elemY+1-iy,iz]]);
        wallEast[iy,iz].surfToAir.vAir[1,1]= toSurfacePortE[surf3nCon[elemY+1-iy,iz]].vAir[surf3aj[iy,iz],surf3ai[elemY+1-iy,iz]];
        wallEast[iy,iz].surfToAir.angleDegAir[1,1]= toSurfacePortE[surf3nCon[elemY+1-iy,iz]].angleDegAir[surf3aj[iy,iz],surf3ai[elemY+1-iy,iz]];
      end for;
    end for;

    for iy in 1:elemY loop
      for ix in 1:elemX loop
      // north N = 2
      connect(wallNorth[iy,ix].surfToAir.heatPort[1,1], toSurfacePortN[surf2nCon[elemY+1-iy,ix]].heatPort[surf2aj[iy,ix],surf2ai[elemY+1-iy,ix]]);
      connect(wallNorth[iy,ix].surfToAir.moisturePort[1,1], toSurfacePortN[surf2nCon[elemY+1-iy,ix]].moisturePort[surf2aj[iy,ix],surf2ai[elemY+1-iy,ix]]);
      wallNorth[iy,ix].surfToAir.vAir[1,1]= toSurfacePortN[surf2nCon[elemY+1-iy,ix]].vAir[surf2aj[iy,ix],surf2ai[elemY+1-iy,ix]];
      wallNorth[iy,ix].surfToAir.angleDegAir[1,1]= toSurfacePortN[surf2nCon[elemY+1-iy,ix]].angleDegAir[surf2aj[iy,ix],surf2ai[elemY+1-iy,ix]];
      // south S = 4
      connect(wallSouth[iy,ix].surfToAir.heatPort[1,1], toSurfacePortS[surf4nCon[elemY+1-iy,ix]].heatPort[surf4aj[iy,ix],surf4ai[elemY+1-iy,ix]]);
      connect(wallSouth[iy,ix].surfToAir.moisturePort[1,1], toSurfacePortS[surf4nCon[elemY+1-iy,ix]].moisturePort[surf4aj[iy,ix],surf4ai[elemY+1-iy,ix]]);
      wallSouth[iy,ix].surfToAir.vAir[1,1]= toSurfacePortS[surf4nCon[elemY+1-iy,ix]].vAir[surf4aj[iy,ix],surf4ai[elemY+1-iy,ix]];
      wallSouth[iy,ix].surfToAir.angleDegAir[1,1]= toSurfacePortS[surf4nCon[elemY+1-iy,ix]].angleDegAir[surf4aj[iy,ix],surf4ai[elemY+1-iy,ix]];
      end for;
     end for;

    for iz in 1:elemZ loop
      for ix in 1:elemX loop
       // floor F = 5
      connect(wallFloor[iz,ix].surfToAir.heatPort[1,1], toSurfacePortF[surf5nCon[iz,ix]].heatPort[surf5aj[iz,ix],surf5ai[iz,ix]]);
      connect(wallFloor[iz,ix].surfToAir.moisturePort[1,1], toSurfacePortF[surf5nCon[iz,ix]].moisturePort[surf5aj[iz,ix],surf5ai[iz,ix]]);
      wallFloor[iz,ix].surfToAir.vAir[1,1]= toSurfacePortF[surf5nCon[iz,ix]].vAir[surf5aj[iz,ix],surf5ai[iz,ix]];
      wallFloor[iz,ix].surfToAir.angleDegAir[1,1]= toSurfacePortF[surf5nCon[iz,ix]].angleDegAir[surf5aj[iz,ix],surf5ai[iz,ix]];
      // ceiling C = 6
      for i in 1:nConstructions6 loop
      connect(wallCeiling[iz,ix].surfToAir.heatPort[1,1], toSurfacePortC[surf6nCon[iz,ix]].heatPort[surf6aj[iz,ix],surf6ai[iz,ix]]);
      connect(wallCeiling[iz,ix].surfToAir.moisturePort[1,1], toSurfacePortC[surf6nCon[iz,ix]].moisturePort[surf6aj[iz,ix],surf6ai[iz,ix]]);
      wallCeiling[iz,ix].surfToAir.vAir[1,1]= toSurfacePortC[surf6nCon[iz,ix]].vAir[surf6aj[iz,ix],surf6ai[iz,ix]];
      wallCeiling[iz,ix].surfToAir.angleDegAir[1,1]= toSurfacePortC[surf6nCon[iz,ix]].angleDegAir[surf6aj[iz,ix],surf6ai[iz,ix]];
      end for;
      //
      end for;
    end for;
    //////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////

      // Wall-Fluid-Connections
    for iy in 1:elemY loop
      for iz in 1:elemZ loop
      // west
      connect(wallWest[iy,iz].portF, portFwest[iy,iz]);
      connect(wallWest[iy,iz].portHeat, portHwest[iy,iz]);
      // east
      connect(wallEast[iy,iz].portF, portFeast[iy,iz]);
      connect(wallEast[iy,iz].portHeat, portHeast[iy,iz]);
      //
      end for;
    end for;

    for iy in 1:elemY loop
      for ix in 1:elemX loop
       // south
      connect(wallSouth[iy,ix].portF, portFsouth[iy,ix]);
      connect(wallSouth[iy,ix].portHeat, portHsouth[iy,ix]);
      // north
      connect(wallNorth[iy,ix].portF, portFnorth[iy,ix]);
      connect(wallNorth[iy,ix].portHeat, portHnorth[iy,ix]);
      //
      end for;
    end for;

    for iz in 1:elemZ loop
      for ix in 1:elemX loop
      //floor
      connect(wallFloor[iz,ix].portF, portFfloor[iz,ix]);
      connect(wallFloor[iz,ix].portHeat, portHfloor[iz,ix]);
      //roof
      connect(wallCeiling[iz,ix].portF, portFroof[iz,ix]);
      connect(wallCeiling[iz,ix].portHeat, portHroof[iz,ix]);
      //
      end for;
    end for;

  end zone3Dwrap;

  partial model zone3Dbuilt "Built of the airvolume body"
  //
  //
  /*
  |-----------------|
  |                /|
  h              /  |    Y
  e           h     |    |    Z
  i         t       |    |  /
  g       d         |    |/
  h     i           |    |---- X
  t   w             |
  | /               |
  |-------length----|
  */
  //
  //rectangular or square rooms (please)
  parameter Real parameterVis = 1 "Parametrization of the dynamic viscosity";

  /////////////
  /* old version
parameter Integer elemX = size(dxVec,1)
    "Number of discrete volumes (x-direction)"                                   annotation (HideResult=true);
parameter Integer elemY = size(dyVec,1)
    "Number of discrete volumes (y-direction)"                                   annotation (HideResult=true);
parameter Integer elemZ = size(dzVec,1)
    "Number of discrete volumes (z-direction)"                                   annotation (HideResult=true);
//
parameter Modelica.SIunits.Length dxVec[elemX]
    "Size of discrete volumes (x-direction)"                                     annotation (HideResult=true);
parameter Modelica.SIunits.Length dyVec[elemY]
    "Size of discrete volumes (y-direction)"                                     annotation (HideResult=true);
parameter Modelica.SIunits.Length dzVec[elemZ]
"Size of discrete volumes (z-direction)"                                          annotation (HideResult=true);
//
// Xmax, Ymax, Zmax
parameter Modelica.SIunits.Length length
    "Overall size of the zone (x-direction)"                                      annotation (HideResult=true);
parameter Modelica.SIunits.Length height
    "Overall size of the zone (y-direction)"                                      annotation (HideResult=true);
parameter Modelica.SIunits.Length width
    "Overall size of the zone (z-direction)"                                      annotation (HideResult=true);

    */

  // Anpassung

  parameter Integer elemX = 3 "Number of discrete volumes (x-direction)"           annotation (HideResult=true);
  parameter Integer elemY = 3 "Number of discrete volumes (y-direction)"           annotation (HideResult=true);
  parameter Integer elemZ = 3 "Number of discrete volumes (z-direction)"           annotation (HideResult=true);
  //
  parameter Modelica.SIunits.Length dxVec[elemX] = fill(length/elemX, elemX)
      "Size of discrete volumes (x-direction)"                                     annotation (HideResult=true);
  parameter Modelica.SIunits.Length dyVec[elemY] = fill(height/elemY, elemY)
      "Size of discrete volumes (y-direction)"                                     annotation (HideResult=true);
  parameter Modelica.SIunits.Length dzVec[elemZ] = fill(width/elemZ, elemZ)
      "Size of discrete volumes (z-direction)"
                                          annotation (HideResult=true);
  // Xmax, Ymax, Zmax
  parameter Modelica.SIunits.Length length = 1
      "Overall size of the zone (x-direction)"                                      annotation (HideResult=true);
  parameter Modelica.SIunits.Length height = 1
      "Overall size of the zone (y-direction)"                                      annotation (HideResult=true);
  parameter Modelica.SIunits.Length width = 1
      "Overall size of the zone (z-direction)"                                      annotation (HideResult=true);

  // Anpassung  Ende

  /***************************************************************************/

  parameter Boolean Heatinside = true "Flag for Heat sources" annotation (HideResult=true);
  parameter Modelica.SIunits.Temp_K T_start = 293.15 "Start temperature";

  // positions
  parameter Modelica.SIunits.Length[elemX-1] posXVecHelp = {sum(dxVec[1:(i-1)]) + dxVec[i]/2 for i in 2:elemX}
      "Vertices of discrete volumes (x-direction)"  annotation (HideResult=true);
  parameter Modelica.SIunits.Length[elemX] posXVec = cat(1,{dxVec[1]/2}, posXVecHelp)
      "Vertices of discrete volumes (x-direction)"  annotation (HideResult=false);

  parameter Modelica.SIunits.Length[elemY-1] posYVecHelp = {sum(dyVec[1:(i-1)]) + dyVec[i]/2 for i in 2:elemY}
      "Vertices of discrete volumes (y-direction)"  annotation (HideResult=true);
  parameter Modelica.SIunits.Length[elemY] posYVec = cat(1,{dyVec[1]/2}, posYVecHelp)
      "Vertices of discrete volumes (y-direction)"  annotation (HideResult=false);

  parameter Modelica.SIunits.Length[elemZ-1] posZVecHelp = {sum(dzVec[1:(i-1)]) + dzVec[i]/2 for i in 2:elemZ}
      "Vertices of discrete volumes (z-direction)"   annotation (HideResult=true);
  parameter Modelica.SIunits.Length[elemZ] posZVec = cat(1,{dzVec[1]/2}, posZVecHelp)
      "Vertices of discrete volumes (z-direction)"   annotation (HideResult=false);
  //********************************************************************/
  //********************************************************************/

  // FV elements
    BuildingSystems.Buildings.Airvolumes.Airvolume3D.FiniteVolumes.FVelementThermal
      box[elemY,elemZ,elemX](
      each T_start=T_start,
      posX={{{posXVec[i] for i in 1:elemX} for k in 1:elemZ} for j in 1:elemY},
      posY={{{posYVec[j] for i in 1:elemX} for k in 1:elemZ} for j in 1:elemY},
      posZ={{{posZVec[k] for i in 1:elemX} for k in 1:elemZ} for j in 1:elemY},
      dimVec={{{{dxVec[i],dyVec[j],dzVec[k]} for i in 1:elemX} for k in 1:elemZ}
          for j in 1:elemY},
      each parVis=parameterVis,
      bcWallWest={{{(if i == 1 then true else false) for i in 1:elemX} for k in
          1:elemZ} for j in 1:elemY},
      bcWallEast={{{(if i == elemX then true else false) for i in 1:elemX} for k in
              1:elemZ} for j in 1:elemY},
      bcWallFloor={{{(if j == 1 then true else false) for i in 1:elemX} for k in
              1:elemZ} for j in 1:elemY},
      bcWallCeiling={{{(if j == elemY then true else false) for i in 1:elemX} for k in
              1:elemZ} for j in 1:elemY},
      bcWallSouth={{{(if k == 1 then true else false) for i in 1:elemX} for k in
              1:elemZ} for j in 1:elemY},
      bcWallNorth={{{(if k == elemZ then true else false) for i in 1:elemX} for k in
              1:elemZ} for j in 1:elemY});

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnectionX
      conx[elemY,elemZ,elemX - 1] annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnectionY
      cony[elemY - 1,elemZ,elemX](each gravity=true) annotation (HideResult=false);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnectionZ
      conz[elemY,elemZ - 1,elemX] annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.ZoneHeatConductionX
      zHC_x[elemY,elemZ,elemX - 1] annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.ZoneHeatConductionY
      zHC_y[elemY - 1,elemZ,elemX] annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.ZoneHeatConductionZ
      zHC_z[elemY,elemZ - 1,elemX] annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFwest[elemY,
      elemZ] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHwest[elemY,
      elemZ] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFeast[elemY,
      elemZ] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHeast[elemY,
      elemZ] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFfloor[elemZ,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHfloor[elemZ,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFroof[elemZ,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHroof[elemZ,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFsouth[elemY,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHsouth[elemY,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portFnorth[elemY,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHnorth[elemY,
      elemX] "Interface Airvolumes - Wall"
                                   annotation (HideResult=true);

  /********************************************************************/
  equation
  /********************************************************************/
  // inside Flow-Connections
  for iy in 1:elemY loop
      for iz in 1:elemZ loop
        for ix in 1:elemX loop

            //west-east
            if ix < elemX then
               connect(box[iy,iz,ix].portX2, conx[iy,iz,ix].port_a);
               connect(conx[iy,iz,ix].port_b, box[iy,iz,ix+1].portX1);
               connect(box[iy,iz,ix].portHeatIntern, zHC_x[iy,iz,ix].port_a);
               connect(zHC_x[iy,iz,ix].port_b, box[iy,iz,ix+1].portHeatIntern);
            end if;

            //south-north
            if iy < elemY then
              connect(box[iy,iz,ix].portY2, cony[iy,iz,ix].port_a);
              connect(cony[iy,iz,ix].port_b, box[iy+1,iz,ix].portY1);
              connect(box[iy,iz,ix].portHeatIntern, zHC_y[iy,iz,ix].port_a);
              connect(zHC_y[iy,iz,ix].port_b, box[iy+1,iz,ix].portHeatIntern);
            end if;

            //front - back
            if iz < elemZ then
              connect(box[iy,iz,ix].portZ2, conz[iy,iz,ix].port_a);
              connect(conz[iy,iz,ix].port_b, box[iy,iz+1,ix].portZ1);
              connect(box[iy,iz,ix].portHeatIntern, zHC_z[iy,iz,ix].port_a);
              connect(zHC_z[iy,iz,ix].port_b, box[iy,iz+1,ix].portHeatIntern);
            end if;

        end for;
      end for;
  end for;

  // Wall-Fluid-Connections
  for iy in 1:elemY loop
    for iz in 1:elemZ loop
    // west
    connect(portFwest[iy,iz], box[iy,iz,1].portX1);
    connect(portHwest[iy,iz], box[iy,iz,1].portHeatExtern);
    // east
    connect(portFeast[iy,iz], box[iy,iz,elemX].portX2);
    connect(portHeast[iy,iz], box[iy,iz,elemX].portHeatExtern);
    //
    end for;
  end for;

  for iz in 1:elemZ loop
    for ix in 1:elemX loop
    //floor
    connect(portFfloor[iz,ix], box[1,iz,ix].portY1);
    connect(portHfloor[iz,ix], box[1,iz,ix].portHeatExtern);
    //roof
    connect(portFroof[iz,ix], box[elemY,iz,ix].portY2);
    connect(portHroof[iz,ix], box[elemY,iz,ix].portHeatExtern);
    //
    end for;
  end for;

  for iy in 1:elemY loop
    for ix in 1:elemX loop
     // south
    connect(portFsouth[iy,ix], box[iy,1,ix].portZ1);
    connect(portHsouth[iy,ix], box[iy,1,ix].portHeatExtern);
    // north
    connect(portFnorth[iy,ix], box[iy,elemZ,ix].portZ2);
    connect(portHnorth[iy,ix], box[iy,elemZ,ix].portHeatExtern);
    //
    end for;
  end for;

  /********************************************************************/
  end zone3Dbuilt;

  package FiniteVolumes "Finite Volumes"
    extends Modelica.Icons.Package;

    model FVelementGeneral "A thermal finite volume element"
      extends BuildingSystems.Buildings.BaseClasses.AirvolumeGeneral(
      redeclare package Medium = BuildingSystems.Media.Air);

    ///////////////////////////////////////////////////////
      constant Modelica.SIunits.SpecificHeatCapacity cAir = 1005.00
        "specific heat capacity"
                                annotation (HideResult=true);
      constant Modelica.SIunits.SpecificHeatCapacity cH20 = 1860.0
        "Specific heat capacity of water vapor" annotation (HideResult=true);
      constant Modelica.SIunits.SpecificHeatCapacity cH20Liq = 4190.0
        "Specific heat capacity of liquid water" annotation (HideResult=true);
      constant Modelica.SIunits.MolarMass M = 0.0289644
        "molar mass of dry air:  0.0289644 kg / mol " annotation (HideResult=true);
      constant Modelica.SIunits.DynamicViscosity nu = 18.232*10^(-6)
        "dynamic viscosity, nu = 17.2*10^(-6), in medium-term: nu = nu(T)"
                                                                          annotation (HideResult=true);
      constant Modelica.SIunits.Density rho_nominal = 1.2
        "Air density under nominal conditions" annotation (HideResult=true);
      constant Modelica.SIunits.Temp_K T_nominal = 293.15
        "Air temperature under nominal conditions";
      constant BuildingSystems.Types.WaterVapourEnthalpy rH2O = Medium.enthalpyOfVaporization(T_nominal)
        "Enthalpy of vaporization for water" annotation (HideResult=true);

      parameter Real parVis = 1
        "(parVis * nu) to parameterize the dynamic viscosity"  annotation (HideResult=true);

      parameter Modelica.SIunits.Density rho_start = 1.2;
      parameter BuildingSystems.Types.RelativeHumidity phi_start = 0.5;

      parameter Real[3] dimVec
      annotation (HideResult=true);
      // Position in space (center)
      parameter Modelica.SIunits.Length posX
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length posY
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length posZ
      annotation (HideResult=true);

      parameter Boolean bcWallNorth = false
      annotation (HideResult=true);
      parameter Boolean bcWallEast = false
      annotation (HideResult=true);
      parameter Boolean bcWallSouth = false
      annotation (HideResult=true);
      parameter Boolean bcWallWest = false
      annotation (HideResult=true);
      parameter Boolean bcWallFloor = false
      annotation (HideResult=true);
      parameter Boolean bcWallCeiling = false
      annotation (HideResult=true);

      parameter Boolean enabled = false annotation (HideResult=true);

      parameter Modelica.SIunits.Mass mAir_start = dx*dy*dz * rho_nominal
        "Start value Mass of dry air of the air volume";
      parameter Modelica.SIunits.Mass mH2OAir_start = x_start * dx*dy*dz * rho_nominal
        "Start value Mass of water vapor";
      parameter Modelica.SIunits.InternalEnergy U_start = (rho_nominal*(dx*dy*dz)*cAir+rho_nominal*(dx*dy*dz)*x_start*cH20)*T_start+rH2O*rho_nominal*(dx*dy*dz)*x_start
        "Start value Internal energy of the air volume";
      //////////////////////////////////////////////////////
    //////////////////  INTERN  //////////////////////////

      parameter Modelica.SIunits.Length[3] posVec={posX,posY,posZ}
      annotation (HideResult=true);
      // Scaling factor for finite element size
      // 1x1x1-Box - finite volume element
      parameter Modelica.SIunits.Length dx=dimVec[1]
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length dy=dimVec[2]
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length dz=dimVec[3]
      annotation (HideResult=true);

    ///////////////////////////////////////////////////////
    ////////////  THERMOPHYSICAL PROPERTIES  /////////////

        // to solve the conservation equations
        // to calculate Temperature and Pressure
        // to store characteristic velocity

      // Simple Air
      // replaceable package Medium = Modelica.Media.Air.SimpleAir
      // constrainedby Modelica.Media.Interfaces.PartialMedium;
      // Base properties (p, d, T, h, u, R, MM and, if applicable, x) of a medium
      // Medium.BaseProperties fluid;

      // alternative:
      // record: {T, p, d, h, x}
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.FiniteVolumes.FluidProp fluid
        "record of fluid properties {T, p, rho, h, x}";

       ///////////////////////////////////////////////////////
      // Connection to thermophys. model
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.AssessmentPort
        assessmentPort;

      /////////////     CONSTANTS    //////////////////////
      /////////////     PARAMETER    //////////////////////
      /////////////      SOURCES    ///////////////////////

      /////////////////////////////////////////////////////
      /////////////      VARIABLES    /////////////////////
      //
      // characteristic Velocity
      Modelica.SIunits.Velocity[3] vVec(start = {0,0,0});
      // for comparisons
      Modelica.SIunits.Velocity velMag(start = 0);
      /////////////// Dummy ///////////////////
      BuildingSystems.Types.RelativeHumidity  phi = phi_start
        "Relative humidity of the air";
      ////////////////     PORTS   //////////////////////////

      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        portHeatIntern "heat conduction (FV -> FV)";
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHeatExtern
        "heat transfer (walls, incl. Radiation)";

    // 3D-ports

     ///*****************************************************************///
     ///*****************************************************************///
     ///*****************************************************************///

      Connections.FluidFluid                                                  portY2
        annotation (Placement(transformation(extent={{-10,30},{10,50}}),
            iconTransformation(extent={{-20,20},{0,40}})));
      Connections.FluidFluid                                                  portZ2
        annotation (Placement(transformation(extent={{30,30},{50,50}}),
            iconTransformation(extent={{20,20},{40,40}})));
      Connections.FluidFluid                                                  portY1
        annotation (Placement(transformation(extent={{-10,-50},{10,-30}}),
            iconTransformation(extent={{-20,-60},{0,-40}})));
      Connections.FluidFluid                                                  portZ1
        annotation (Placement(transformation(extent={{-46,-50},{-26,-30}}),
            iconTransformation(extent={{-56,-60},{-36,-40}})));
      Connections.FluidFluid                                                  portX1
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Connections.FluidFluid                                                  portX2
        annotation (Placement(transformation(extent={{30,-10},{50,10}}),
            iconTransformation(extent={{20,-20},{40,0}})));
    algorithm
       // Velocities: assign by massflows: V = mdot/(rho*A)
      // depends on the flow-direction of both sides
      // |1| -> |FV| -> |2|   FV: V1
      // |1| <- |FV| <- |2|   FV: V2
      // |1| -> |FV| <- |2|   FV: V1-V2
      // Exceptions at Boundaries
      //////////////////////////////////////////////////////
      // Vx
     if (not bcWallEast and not bcWallWest) then
      if noEvent(portX1.m_flowAir > 0) and noEvent(portX2.m_flowAir <= 0) then
        vVec[1] := portX1.m_flowAir/(inStream(portX1.rho)*dz*dy);
      elseif noEvent(portX1.m_flowAir <= 0) and noEvent(portX2.m_flowAir > 0) then
        vVec[1] := - portX2.m_flowAir/(inStream(portX2.rho)*dz*dy);
      elseif noEvent(portX1.m_flowAir > 0) and noEvent(portX2.m_flowAir > 0) then
        vVec[1] := (portX1.m_flowAir/(inStream(portX1.rho)*dz*dy) - portX2.m_flowAir/(inStream(portX2.rho)*dz*dy));
      else
        vVec[1] := 0;
      end if;

      elseif (bcWallWest and not bcWallEast) then
        if noEvent(portX1.m_flowAir > 0 or portX1.m_flowAir < 0) then
          vVec[1] := portX1.m_flowAir/(inStream(portX1.rho)*dz*dy); // BC
        elseif noEvent(portX1.m_flowAir == 0.0 and portX2.m_flowAir > 0.0) then
          vVec[1] := - portX2.m_flowAir/(inStream(portX2.rho)*dz*dy);
        elseif noEvent(portX1.m_flowAir == 0.0 and portX2.m_flowAir <= 0.0) then
          //vVec[1] := 0.0;//(- portX2.m_flowAir/(inStream(portX2.rho)*dz*dy));
         vVec[1] := min(1,(log(1 + dimVec[1]))) * (- portX2.m_flowAir/(inStream(portX2.rho)*dz*dy));
      else
        vVec[1] := 0;
        end if;

     elseif (bcWallEast and not bcWallWest) then
        if noEvent(portX2.m_flowAir > 0 or portX2.m_flowAir < 0) then
          vVec[1] := - portX2.m_flowAir/(inStream(portX2.rho)*dz*dy); // BC
        elseif noEvent(portX2.m_flowAir == 0.0 and portX1.m_flowAir > 0.0) then
          vVec[1] := portX1.m_flowAir/(inStream(portX1.rho)*dz*dy);
        elseif noEvent(portX2.m_flowAir == 0.0 and portX1.m_flowAir <= 0.0) then
          //vVec[1] := 0.0;//portX1.m_flowAir/(inStream(portX1.rho)*dz*dy);
           vVec[1] := min(1,(log(1 + dimVec[1]))) * portX1.m_flowAir/(inStream(portX1.rho)*dz*dy);
      else
        vVec[1] := 0;
        end if;

      else
        vVec[1] := 0;
      end if;

      //////////////////////////////////////////////////////
      // Vy
      if (not bcWallCeiling and not bcWallFloor) then
      if noEvent(portY1.m_flowAir > 0) and noEvent(portY2.m_flowAir <= 0) then
        vVec[2] := portY1.m_flowAir/(inStream(portY1.rho)*dz*dx);
      elseif noEvent(portY1.m_flowAir <= 0) and noEvent(portY2.m_flowAir > 0) then
        vVec[2]:= - portY2.m_flowAir/(inStream(portY2.rho)*dz*dx);
      elseif noEvent(portY1.m_flowAir > 0) and noEvent(portY2.m_flowAir > 0) then
        vVec[2] := portY1.m_flowAir/(inStream(portY1.rho)*dz*dx) - portY2.m_flowAir/(inStream(portY2.rho)*dz*dx);
      else
       vVec[2] := 0;
      end if;

      elseif (bcWallFloor and not bcWallCeiling) then
         if noEvent(portY1.m_flowAir > 0 or portY1.m_flowAir < 0) then
            vVec[2] := portY1.m_flowAir/(inStream(portY1.rho)*dz*dx);  // BC
          elseif noEvent(portY1.m_flowAir == 0.0 and portY2.m_flowAir > 0.0) then
            vVec[2] := - portY2.m_flowAir/(inStream(portY2.rho)*dz*dx);
          elseif noEvent(portY1.m_flowAir == 0.0 and portY2.m_flowAir <= 0.0) then
            //vVec[2] := 0.0;//(- portY2.m_flowAir/(inStream(portY2.rho)*dz*dx));
            vVec[2] := min(1,(log(1 + dimVec[2]))) * (- portY2.m_flowAir/(inStream(portY2.rho)*dz*dx));
          else
           vVec[2] := 0;
          end if;

      elseif (bcWallCeiling and not bcWallFloor) then
          if noEvent(portY2.m_flowAir > 0 or portY2.m_flowAir < 0) then
            vVec[2] := - portY2.m_flowAir/(inStream(portY2.rho)*dz*dx);  // BC
          elseif noEvent(portY2.m_flowAir == 0.0 and portY1.m_flowAir > 0.0) then
            vVec[2] := portY1.m_flowAir/(inStream(portY1.rho)*dz*dx);
          elseif noEvent(portY2.m_flowAir == 0.0 and portY1.m_flowAir <= 0.0) then
            //vVec[2] := 0.0;//(portY1.m_flowAir/(inStream(portY1.rho)*dz*dx));
           vVec[2] :=  min(1,(log(1 + dimVec[2]))) * (portY1.m_flowAir/(inStream(portY1.rho)*dz*dx));
           else
           vVec[2] := 0;
          end if;

       else
          vVec[2] := 0;
      end if;

      //////////////////////////////////////////////////////
      // Vz
      if (not bcWallNorth and not bcWallSouth) then

         if noEvent(portZ1.m_flowAir > 0) and noEvent(portZ2.m_flowAir <= 0) then
           vVec[3] := portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx);
         elseif noEvent(portZ1.m_flowAir <= 0) and noEvent(portZ2.m_flowAir > 0) then
          vVec[3] := - portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx);
         elseif noEvent(portZ1.m_flowAir > 0) and noEvent(portZ2.m_flowAir > 0) then
          vVec[3]:= portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx) - portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx);
         else
          vVec[3] := 0;
         end if;

      elseif (bcWallSouth and not bcWallNorth) then
         if noEvent(portZ1.m_flowAir > 0 or portZ1.m_flowAir < 0) then
            vVec[3] := portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx);  // BC
          elseif noEvent(portZ1.m_flowAir == 0.0 and portZ2.m_flowAir > 0.0) then
            vVec[3] := - portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx);
          elseif noEvent(portZ1.m_flowAir == 0.0 and portZ2.m_flowAir <= 0.0) then
            //vVec[3] := 0.0;//(- portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx));
            vVec[3] := min(1,(log(1 + dimVec[3]))) * (- portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx));
         else
          vVec[3] := 0;
          end if;

      elseif (bcWallNorth and not bcWallSouth) then
          if noEvent(portZ2.m_flowAir > 0 or portZ2.m_flowAir < 0) then
            vVec[3] := - portZ2.m_flowAir/(inStream(portZ2.rho)*dy*dx);  // BC
          elseif noEvent(portZ2.m_flowAir == 0.0 and portZ1.m_flowAir > 0.0) then
            vVec[3] := portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx);
          elseif noEvent(portZ2.m_flowAir == 0.0 and portZ1.m_flowAir <= 0.0) then
            //vVec[3] := 0.0;//(portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx));
            vVec[3] := min(1,(log(1 + dimVec[3]))) * (portZ1.m_flowAir/(inStream(portZ1.rho)*dy*dx));
         else
          vVec[3] := 0;
          end if;

      else
          vVec[3] := 0;
      end if;

      // Magnitude
      velMag :=  sqrt(vVec*vVec);

      ///*****************************************************************///
      assessmentPort.Tair := fluid.T;
      assessmentPort.velMag := velMag;
      assessmentPort.HumRel := phi;
      ///*****************************************************************///
      // For consistency to AirvolumeGeneral
      T := fluid.T;
      x := fluid.x;
      ///*****************************************************************///
    equation
      //
      // Redistribution to the ports -> flowConnections
      //
      // d: Differential equation solved
      portX1.rho = fluid.rho;
      portX2.rho = fluid.rho;
      portY1.rho = fluid.rho;
      portY2.rho = fluid.rho;
      portZ1.rho = fluid.rho;
      portZ2.rho = fluid.rho;
      //h: Differential equation solved
      portX1.h = fluid.h;
      portX2.h = fluid.h;
      portY1.h = fluid.h;
      portY2.h = fluid.h;
      portZ1.h = fluid.h;
      portZ2.h = fluid.h;
      //x: ...
      portX1.moist.x = fluid.x;
      portX2.moist.x = fluid.x;
      portY1.moist.x = fluid.x;
      portY2.moist.x = fluid.x;
      portZ1.moist.x = fluid.x;
      portZ2.moist.x = fluid.x;
      //p: ideal gas equation
      portX1.p = fluid.p;
      portX2.p = fluid.p;
      portY1.p = fluid.p;
      portY2.p = fluid.p;
      portZ1.p = fluid.p;
      portZ2.p = fluid.p;
      //v: associated
      portX1.vVec = vVec;
      portX2.vVec = vVec;
      portY1.vVec = vVec;
      portY2.vVec = vVec;
      portZ1.vVec = vVec;
      portZ2.vVec = vVec;
      // geometric information
      portX1.posVec = posVec;
      portX2.posVec = posVec;
      portY1.posVec = posVec;
      portY2.posVec = posVec;
      portZ1.posVec = posVec;
      portZ2.posVec = posVec;
      // geometric information
      portX1.dimVec = dimVec;
      portX2.dimVec = dimVec;
      portY1.dimVec = dimVec;
      portY2.dimVec = dimVec;
      portZ1.dimVec = dimVec;
      portZ2.dimVec = dimVec;
      ////T: ideal gas equation
      portHeatIntern.T = fluid.T;
      portHeatIntern.posVec = posVec;
      portHeatIntern.dimVec = dimVec;

      portHeatExtern.T = fluid.T;

     // Parts of the Viscous-Forces
    algorithm
     portX1.ForceVF :=  parVis*nu*((portY2.visgr1 - portY1.visgr1)*dx*dz + (portZ2.visgr1 -
        portZ1.visgr1)*dx*dy);
     portX2.ForceVF :=  parVis*nu*((portY2.visgr1 - portY1.visgr1)*dx*dz + (portZ2.visgr1 -
        portZ1.visgr1)*dx*dy);
     portY1.ForceVF :=  parVis*nu*((portX2.visgr1 - portX1.visgr1)*dy*dz + (portZ2.visgr2 -
        portZ1.visgr2)*dx*dy);
     portY2.ForceVF :=  parVis*nu*((portX2.visgr1 - portX1.visgr1)*dy*dz + (portZ2.visgr2 -
        portZ1.visgr2)*dx*dy);
     portZ1.ForceVF :=  parVis*nu*((portX2.visgr2 - portX1.visgr2)*dy*dz + (portY2.visgr2 -
        portY1.visgr2)*dx*dz);
     portZ2.ForceVF :=  parVis*nu*((portX2.visgr2 - portX1.visgr2)*dy*dz + (portY2.visgr2 -
        portY1.visgr2)*dx*dz);
     //*****************************************************************//

    initial equation
       fluid.T = T_start;
       fluid.p = rho_start*Modelica.Constants.R/M*fluid.T;

    annotation (defaultComponentName = "FVelement",
                Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),
                      graphics={Rectangle(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={244,222,233},
                fillPattern=FillPattern.Solid),
            Text(
              extent={{-44,44},{46,18}},
              lineColor={0,0,255},
              textString="FV element"),
            Line(
              points={{-60,60},{-40,80},{80,80},{60,60},{80,80},{80,-40},{60,-60},{80,
                  -40},{-40,-40},{-60,-60},{-40,-40},{-40,18}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-40,80},{-40,40}},
              color={0,0,255},
              smooth=Smooth.None)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={
                                Rectangle(
                extent={{-46,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={244,222,233},
                fillPattern=FillPattern.Solid)}));
    end FVelementGeneral;

    model FVelementThermal "A thermal finite volume element"

      extends
        BuildingSystems.Buildings.Airvolumes.Airvolume3D.FiniteVolumes.FVelementGeneral;

    /////////////     CONSTANT     ///////////////////////

      ///////////////     PARAMETER     /////////////////////
      /////////////////    SOURCES    ///////////////////////
      // Source, Heatsource, moisture source
      parameter Modelica.SIunits.MassFlowRate mSource=0.0
      annotation (HideResult=true);
      parameter Modelica.SIunits.SpecificEnthalpy hSource = cAir * T_start
      annotation (HideResult=true);

    /////////////      VARIABLES    //////////////////////
      Modelica.SIunits.Mass mAir = mAir_start
        "Mass of dry air of the air volume";
      Modelica.SIunits.Mass mH2OAir = mH2OAir_start
        "Mass of water vapor in the air of the air volume";
      Modelica.SIunits.Mass mH2OLiq = mH2OLiq_start
        "Mass of liquid water of the air volume";
      Modelica.SIunits.InternalEnergy U=U_start
        "Internal energy of the air volume";

     ///*****************************************************************///

    equation
      // mass conservation: der(rho) = [m_flowAir{for north,east,south,west,front,back} + Source] / FV_i
      der(fluid.rho) = (portX1.m_flowAir + portX2.m_flowAir + portY1.m_flowAir + portY2.m_flowAir +
        portZ1.m_flowAir + portZ2.m_flowAir  + mSource)/(dx*dy*dz);

    // enthalpy conservation: rho * FV_i * der(h) = m_flowAir*hi/inStream(hi) {for n,o,s,w,v,h} + Sorcem_flowAir*h  + HeatFlow Qdot
         (fluid.rho*dx*dy*dz)*der(fluid.h) =
         (portX1.m_flowAir*actualStream(portX1.h)
        + portX2.m_flowAir*actualStream(portX2.h)
        + portY1.m_flowAir*actualStream(portY1.h)
        + portY2.m_flowAir*actualStream(portY2.h)
        + portZ1.m_flowAir*actualStream(portZ1.h)
        + portZ2.m_flowAir*actualStream(portZ2.h)
        + mSource *(if noEvent(mSource > 0) then hSource else fluid.h)
        + portHeatExtern.Qdot + portHeatIntern.Qdot);

      ////////// dummy value /////////////
      fluid.x = x_start;

      // Temperature: h = cp * T
      fluid.T =fluid.h/cAir;
      // Pressure: p = rho * R_s* T
      fluid.p = fluid.rho*(Modelica.Constants.R/M)*fluid.T;
      //

    annotation (defaultComponentName = "FVelement",
                Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                {100,100}}),
                      graphics={Rectangle(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={244,222,233},
                fillPattern=FillPattern.Solid),
            Text(
              extent={{-44,44},{46,18}},
              lineColor={0,0,255},
              textString="FV element"),
            Line(
              points={{-60,60},{-40,80},{80,80},{60,60},{80,80},{80,-40},{60,-60},{80,
                  -40},{-40,-40},{-60,-60},{-40,-40},{-40,18}},
              color={0,0,255},
              smooth=Smooth.None),
            Line(
              points={{-40,80},{-40,40}},
              color={0,0,255},
              smooth=Smooth.None)}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={
                                Rectangle(
                extent={{-46,50},{50,-50}},
                lineColor={0,0,255},
                fillColor={244,222,233},
                fillPattern=FillPattern.Solid)}));
    end FVelementThermal;



    record FluidProp "Basic fluid properties"
       Modelica.SIunits.Temp_K T;
       Modelica.SIunits.Pressure p;
       Modelica.SIunits.Density rho;
       Modelica.SIunits.SpecificEnthalpy h;
       // Absolute Moisture
       Modelica.SIunits.MassFraction x;

    end FluidProp;
  end FiniteVolumes;

  package FlowConnections "Connections to connect the finite airvolumes"
    extends Modelica.Icons.Package;
    partial model FlowConnection
      "a connector-element between two FV elements calculating the velocity. X, Y and Z - direction"
      // Simple Air
      // replaceable package Medium = Modelica.Media.Air.SimpleAir
      // constrainedby Modelica.Media.Interfaces.PartialMedium;
      // Base properties (p, d, T, h, u, R, MM and, if applicable, X and x) of a medium
       // Medium.BaseProperties fluid;
      parameter Boolean bcWallNorth = false
      annotation (HideResult=true);
      parameter Boolean bcWallEast = false
      annotation (HideResult=true);
      parameter Boolean bcWallSouth = false
      annotation (HideResult=true);
      parameter Boolean bcWallWest = false
      annotation (HideResult=true);
      parameter Boolean bcWallFloor = false
      annotation (HideResult=true);
      parameter Boolean bcWallCeiling = false
      annotation (HideResult=true);
      // Variante of the Impulse Equation
      parameter Integer VarImEq = 5
      annotation (HideResult=true);
      parameter Real LayFac = 3.25;
      parameter Real LoFac = 0.01;
      Modelica.SIunits.Length distance=sqrt((port_b.posVec[1] - port_a.posVec[1])^2 + (port_b.posVec[2] - port_a.posVec[2])^2 +(port_b.posVec[3] - port_a.posVec[3])^2)
      annotation (HideResult=true);

      // ports
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid port_a;
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid port_b;

      Modelica.SIunits.Velocity v;
      Modelica.SIunits.Pressure dp=port_b.p - port_a.p;

    equation
      //fluid.h = 0.5*(inStream(port_a.h) + inStream(port_b.h));
      //p = 0.5*(port_a.p + port_b.p);

      // 'flowConnection' - bridging, FV1-FV2
      // streams
      port_a.rho = inStream(port_b.rho);
      port_b.rho = inStream(port_a.rho);
      port_a.h = inStream(port_b.h);
      port_b.h = inStream(port_a.h);
      port_a.moist.x_flowAir = port_b.moist.x*port_a.m_flowAir;
      port_b.moist.x_flowAir = port_a.moist.x*port_b.m_flowAir;
    end FlowConnection;

    model FlowConnectionX
      extends
        BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnection;
      // distance between two zones
      // flowConnection "from center of FV1 to center of FV2"
      Modelica.SIunits.Length deltaX=abs(port_a.posVec[1] - port_b.posVec[1])
      annotation (HideResult=true);
      // joint area between two zones, depends on the size (parameterization) of the FV
      Modelica.SIunits.Length dy= 0.5 * (port_a.dimVec[2] + port_b.dimVec[2])
      annotation (HideResult=true);
      Modelica.SIunits.Length dz= 0.5 * (port_a.dimVec[3] + port_b.dimVec[3])
      annotation (HideResult=true);

       parameter Real LayFacBC = (if bcWallFloor or bcWallCeiling then LayFac else 1)*(if bcWallNorth or bcWallSouth then LayFac else 1);
       parameter Real LayFacBCs = 0.0008*((if bcWallFloor or bcWallCeiling then LayFac else 0)+(if bcWallNorth or bcWallSouth then LayFac else 0));

    equation
      // Velocity ​​values: Pressure forces + Impulse forces + Viscose forces
      // Type momentum equation
      if VarImEq == 0 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2);
      elseif  VarImEq == 1 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2) - LoFac*sign(v)*v^2;
      elseif VarImEq == 2 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2) - LoFac*sign(v)*v^2 * LayFacBC;
      elseif VarImEq == 3 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF);
      elseif VarImEq == 4 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF) - sign(v)*v^2 * LayFacBCs;
      elseif VarImEq == 5 then
       deltaX * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp  - (port_b.vVec[1]^2 - port_a.vVec[1]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF) *0.5 - 0.5 * LoFac*sign(v)*v^2 * LayFacBC;
      else
       deltaX * der(v) = 0;
      end if;

      port_a.m_flowAir = (0.5*(port_a.rho + port_b.rho))*(dy*dz)*v;
      port_a.m_flowAir + port_b.m_flowAir = 0;

      // Gradients for the viscous force
      port_a.visgr1 = (port_b.vVec[2] - port_a.vVec[2])/(port_b.posVec[1] - port_a.posVec[1]); //dvdx
      port_b.visgr1 = (port_b.vVec[2] - port_a.vVec[2])/(port_b.posVec[1] - port_a.posVec[1]); //dvdx
      port_a.visgr2 = (port_b.vVec[3] - port_a.vVec[3])/(port_b.posVec[1] - port_a.posVec[1]); //dwdx
      port_b.visgr2 = (port_b.vVec[3] - port_a.vVec[3])/(port_b.posVec[1] - port_a.posVec[1]); //dwdx

    //initial equation
       //deltax * der(V) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Ellipse(
                extent={{80,-40},{-80,40}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-74,0},{-60,0}},
                lineColor={0,0,255},
                fontSize=14,
                textString="port 1"),
              Text(
                extent={{60,0},{74,0}},
                lineColor={0,0,255},
                fontSize=14,
                textString="port 2")}), Diagram(graphics={
                                               Ellipse(
                extent={{90,-30},{-70,50}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-64,10},{-50,10}},
                lineColor={0,0,255},
                fontSize=14,
                textString="port 1"),
              Text(
                extent={{70,10},{84,10}},
                lineColor={0,0,255},
                fontSize=14,
                textString="port 2")}));
    end FlowConnectionX;

    model FlowConnectionY
      extends
        BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnection;

      parameter Boolean gravity = true;
      Modelica.Blocks.Sources.Ramp rampe(duration = 60, height = 25);
      // distance between two zones
      // flowConnection "from center of FV1 to center of FV2"
      Modelica.SIunits.Length deltaY=abs(port_a.posVec[2] - port_b.posVec[2])
      annotation (HideResult=true);
      // joint area between two zones, depends on the size (parameterization) of the FV
      Modelica.SIunits.Length dx= 0.5 * (port_a.dimVec[1] + port_b.dimVec[1])
      annotation (HideResult=true);
      Modelica.SIunits.Length dz= 0.5 * (port_a.dimVec[3] + port_b.dimVec[3])
      annotation (HideResult=true);

      parameter Real LayFacBC = (if bcWallEast or bcWallWest then LayFac else 1)*(if bcWallNorth or bcWallSouth then LayFac else 1);
      parameter Real LayFacBCs = 0.0008*((if bcWallEast or bcWallWest then LayFac else 0)+(if bcWallNorth or bcWallSouth then LayFac else 0));

    equation
      // Velocity ​​values: Pressure forces + Impulse forces + Viscose forces
      // Type momentum equation
      // Problem Fg: (if time < 1 then time else 1)* Modelica.Constants.g_n*dyGravity
      // Problem Fg: homotopy(actual=  Modelica.Constants.g_n*dyGravity, simplified=  0)
      // Problem Fg: Modelica.Constants.g_n*deltay * tanh(time)

      if VarImEq == 0 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2);
      elseif  VarImEq == 1 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2) - LoFac*sign(v)*v^2;
      elseif VarImEq == 2 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2) - LoFac*sign(v)*v^2*LayFacBC;
      elseif VarImEq == 3 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF);
      elseif VarImEq == 4 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF) - sign(v)*v^2 * LayFacBCs;
      elseif VarImEq == 5 then
       deltaY * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (if gravity then (Modelica.Constants.g_n*deltaY * tanh(rampe.y)) else 0) - (port_b.vVec[2]^2 - port_a.vVec[2]^2) - 0.5*(port_a.ForceVF + port_b.ForceVF) *0.5 - 0.5 * LoFac*sign(v)*v^2*LayFacBC;
      else
       deltaY * der(v) = 0;
      end if;

      port_a.m_flowAir = (0.5*(port_a.rho + port_b.rho))*(dx*dz)*v;
      port_a.m_flowAir + port_b.m_flowAir = 0;

      // Gradients for the viscous force
      port_a.visgr1 = (port_b.vVec[1] - port_a.vVec[1])/(port_b.posVec[2] - port_a.posVec[2]); //dudy
      port_b.visgr1 = (port_b.vVec[1] - port_a.vVec[1])/(port_b.posVec[2] - port_a.posVec[2]); //dudy
      port_a.visgr2 = (port_b.vVec[3] - port_a.vVec[3])/(port_b.posVec[2] - port_a.posVec[2]); //dwdy
      port_b.visgr2 = (port_b.vVec[3] - port_a.vVec[3])/(port_b.posVec[2] - port_a.posVec[2]); //dwdy

    //initial equation
      //deltay * der(V) = - 1.0/(0.5*(port_a.rho + port_b.rho))*dp - Modelica.Constants.g_n*deltay;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                         graphics={Ellipse(
                extent={{80,-40},{-80,40}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                rotation=90),
              Text(
                extent={{-8,66},{6,70}},
                lineColor={0,0,255},
                textString="port 2",
                fontSize=16),
              Text(
                extent={{-6,-72},{8,-68}},
                lineColor={0,0,255},
                fontSize=16,
                textString="port 1")}), Diagram(graphics={
                                   Ellipse(
                extent={{80,-40},{-80,40}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                rotation=90),
              Text(
                extent={{-8,66},{6,70}},
                lineColor={0,0,255},
                textString="port 2",
                fontSize=16),
              Text(
                extent={{-6,-72},{8,-68}},
                lineColor={0,0,255},
                fontSize=16,
                textString="port 1")}));
    end FlowConnectionY;

    model FlowConnectionZ
      extends
        BuildingSystems.Buildings.Airvolumes.Airvolume3D.FlowConnections.FlowConnection;
      // distance between two zones
      // flowConnection "from center of FV1 to center of FV2"
      Modelica.SIunits.Length deltaZ=abs(port_a.posVec[3] - port_b.posVec[3])
      annotation (HideResult=true);
       // joint area between two zones, depends on the size (parameterization) of the FV
      Modelica.SIunits.Length dx= 0.5 * (port_a.dimVec[1] + port_b.dimVec[1])
      annotation (HideResult=true);
      Modelica.SIunits.Length dy= 0.5 * (port_a.dimVec[2] + port_b.dimVec[2])
      annotation (HideResult=true);

      parameter Real LayFacBC = (if bcWallEast or bcWallWest then LayFac else 1)*(if bcWallCeiling or bcWallFloor then LayFac else 1);
      parameter Real LayFacBCs = 0.0008*((if bcWallEast or bcWallWest then LayFac else 0) + (if bcWallCeiling or bcWallFloor then LayFac else 0));

    equation
      // Velocity ��values: Pressure forces + Impulse forces + Viscose forces
      // Type momentum equation

       if VarImEq == 0 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2);
      elseif  VarImEq == 1 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2)- LoFac*sign(v)*v^2;
      elseif VarImEq == 2 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2)- LoFac*sign(v)*v^2*LayFacBC;
      elseif VarImEq == 3 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2)- 0.5*(port_a.ForceVF + port_b.ForceVF);
      elseif VarImEq == 4 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2)- 0.5*(port_a.ForceVF + port_b.ForceVF) - sign(v)*v^2 * LayFacBCs;
      elseif VarImEq == 5 then
       deltaZ * der(v) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp - (port_b.vVec[3]^2 - port_a.vVec[3]^2)- 0.5*(port_a.ForceVF + port_b.ForceVF) *0.5 - 0.5 * LoFac*sign(v)*v^2*LayFacBC;
      else
       deltaZ * der(v) = 0;
      end if;

      port_a.m_flowAir = (0.5*(port_a.rho + port_b.rho))*(dy*dx)*v;
      port_a.m_flowAir + port_b.m_flowAir = 0;

      // Gradients for the viscous force
      port_a.visgr1 = (port_b.vVec[1] - port_a.vVec[1])/(port_b.posVec[3] - port_a.posVec[3]); //dudz
      port_b.visgr1 = (port_b.vVec[1] - port_a.vVec[1])/(port_b.posVec[3] - port_a.posVec[3]); //dudz
      port_a.visgr2 = (port_b.vVec[2] - port_a.vVec[2])/(port_b.posVec[3] - port_a.posVec[3]); //dvdz
      port_b.visgr2 = (port_b.vVec[2] - port_a.vVec[2])/(port_b.posVec[3] - port_a.posVec[3]); //dvdz

    //initial equation
      //deltaz * der(V) = (-1/(0.5*(port_a.rho + port_b.rho)))*dp;

        annotation (Icon(graphics={Ellipse(
                extent={{34,34},{-34,-34}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{12,16},{26,20}},
                lineColor={0,0,255},
                textString="port 2",
                fontSize=16),
              Text(
                extent={{-22,-22},{-8,-18}},
                lineColor={0,0,255},
                fontSize=16,
                textString="port 1")}), Diagram(graphics={
                                   Ellipse(
                extent={{34,38},{-34,-30}},
                lineColor={0,0,255},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{12,20},{26,24}},
                lineColor={0,0,255},
                textString="port 2",
                fontSize=16),
              Text(
                extent={{-22,-18},{-8,-14}},
                lineColor={0,0,255},
                fontSize=16,
                textString="port 1")}));
    end FlowConnectionZ;

    model ZoneHeatConductionX
      "a HeatConduction connector-element between two FV elements."

      // ports
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_a;
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_b;

    equation
      // Qdot = lambda*A/l*(T2-T1)
      //
      port_b.Qdot = 0.0262 *((0.5 *(port_a.dimVec[2] + port_b.dimVec[2])) * (0.5 *(port_a.dimVec[3] + port_b.dimVec[3])))/(abs(port_b.posVec[1] - port_a.posVec[1]))*(port_b.T - port_a.T);
      //
      //Qdot = lambda*(T2-T1)
      //port_b.Qdot = 0.0262 *(port_b.T - port_a.T);
      //port_b.Qdot = 0.0*(port_b.T - port_a.T);
      port_a.Qdot + port_b.Qdot = 0;

    end ZoneHeatConductionX;

    model ZoneHeatConductionY
      "a HeatConduction connector-element between two FV elements."

      // ports
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_a;
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_b;

    equation
      // Qdot = lambda*A/l*(T2-T1)
      //
      port_b.Qdot = 0.0262 *((0.5 *(port_a.dimVec[1] + port_b.dimVec[1])) * (0.5 *(port_a.dimVec[3] + port_b.dimVec[3])))/(abs(port_b.posVec[2] - port_a.posVec[2]))*(port_b.T - port_a.T);
      //
      //Qdot = lambda*(T2-T1)
      //port_b.Qdot = 0.0262 *(port_b.T - port_a.T);
      //port_b.Qdot = 0.0*(port_b.T - port_a.T);
      port_a.Qdot + port_b.Qdot = 0;

    end ZoneHeatConductionY;

    model ZoneHeatConductionZ
      "a HeatConduction connector-element between two FV elements."

      // ports
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_a;
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeatExt
        port_b;

    equation
      // Qdot = lambda*A/l*(T2-T1)
      //
      port_b.Qdot = 0.0262 *((0.5 *(port_a.dimVec[1] + port_b.dimVec[1])) * (0.5 *(port_a.dimVec[2] + port_b.dimVec[2])))/(abs(port_b.posVec[3] - port_a.posVec[3]))*(port_b.T - port_a.T);
      //
      //Qdot = lambda*(T2-T1)
      //port_b.Qdot = 0.0262 *(port_b.T - port_a.T);
      //port_b.Qdot = 0.0*(port_b.T - port_a.T);
      port_a.Qdot + port_b.Qdot = 0;

    end ZoneHeatConductionZ;
  end FlowConnections;

  package Boundaries "Boundary adapter to connect the airvolumes to the walls "
    extends Modelica.Icons.Package;

    partial model SurfaceInside "wall - openings - surfaces"

      parameter Modelica.SIunits.Length posX
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length posY
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length posZ
      annotation (HideResult=true);
      parameter Real dimVec[3]
      annotation (HideResult=true);

      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidFluid portF;
                        // port to Fluid
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidHeat portHeat;
                           // port to Fluid

      parameter Modelica.SIunits.SpecificHeatCapacity cp = 1005.00
      annotation (HideResult=true);
      parameter Modelica.SIunits.MolarMass n = 0.0289644
      annotation (HideResult=true);
      parameter Modelica.SIunits.ThermalConductivity lambdaAir=0.0242
      annotation (HideResult=true);
      parameter Modelica.SIunits.Length cL = (dimVec[1] + dimVec[2] + dimVec[3])/3
      annotation (HideResult=true);
      parameter Modelica.SIunits.CoefficientOfHeatTransfer alpha_i = 7.6;
      parameter Modelica.SIunits.CoefficientOfHeatTransfer alpha_a = 13.5;
      // If outer Wall -> wall-informations
      parameter Modelica.SIunits.Length thickness = 0.02;
      parameter Modelica.SIunits.ThermalConductivity lambdaSolid = 0.0587;
      // Thermal insulation
      parameter Modelica.SIunits.ThermalInsulance R_i = 1/alpha_i annotation (HideResult=true);
      parameter Modelica.SIunits.ThermalInsulance R_a = 1/alpha_a annotation (HideResult=true);
      parameter Modelica.SIunits.ThermalInsulance R_aw = R_a + thickness/lambdaSolid annotation (HideResult=true);
      parameter Modelica.SIunits.ThermalInsulance R_k = R_i + R_a + thickness/lambdaSolid annotation (HideResult=true);

     // water vapor from moisture transfer of surfaces - default/ start value
      parameter Modelica.SIunits.MassFlowRate x_flowAir_start = 0.0 annotation (HideResult=true);

     //intern orientation: south, north, west, east, floor, roof
      parameter String location = " "
      annotation (HideResult=false);

      annotation (
        Icon(graphics={Rectangle(
              extent={{-100,100},{-80,-100}},
              lineColor={0,0,255},
              fillColor={127,0,0},
              fillPattern=FillPattern.Solid)}));
    end SurfaceInside;

    model BoundaryAdapter "Boundary adapter"
      extends
        BuildingSystems.Buildings.Airvolumes.Airvolume3D.Boundaries.SurfaceInside;

      parameter Modelica.SIunits.Temp_K T_in = 293.15;// to specify
      parameter Modelica.SIunits.Velocity[3] vVec = {0,0,0} annotation (HideResult=true);
      parameter Modelica.SIunits.Density rho = 1.2 annotation (HideResult=true);

      BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfToAir(nY = 1,nZ = 1);

    algorithm
      portHeat.Qdot := - surfToAir.heatPort[1,1].Q_flow;

    equation
      if (location == "east" or location == "west") then
      // given velocity, given massflow, ... boundary condition
      portF.m_flowAir = rho*(portF.dimVec[2]*portF.dimVec[3])*vVec[1];
      //
      portF.visgr1 = (2*portF.vVec[2])/(portF.dimVec[1]);
      portF.visgr2 = (2*portF.vVec[3])/(portF.dimVec[1]);

      elseif (location == "roof" or location == "floor") then
      // given velocity, given mass flow, ... boundary condition
      portF.m_flowAir = rho*(portF.dimVec[1]*portF.dimVec[3])*vVec[2];
      //
      portF.visgr1 = (2*portF.vVec[1])/(portF.dimVec[2]);
      portF.visgr2 = (2*portF.vVec[3])/(portF.dimVec[2]);

      elseif (location == "north" or location == "south") then
      // given velocity, given massflow, ... boundary condition
      portF.m_flowAir = rho*(portF.dimVec[1]*portF.dimVec[2])*vVec[3];
      //
      portF.visgr1 = (2*portF.vVec[1])/(portF.dimVec[3]);
      portF.visgr2 = (2*portF.vVec[2])/(portF.dimVec[3]);

      else

      portF.m_flowAir = 0.0;
      portF.visgr1 = 0.0;
      portF.visgr2 = 0.0;

      end if;

    ///////////////////////////////////////////////////////////
    // To Wall Surface
    // question: for flow-path-connections
    //
      surfToAir.vAir[1,1] = 0;
      surfToAir.angleDegAir[1,1] = 0;
      // air temperature of nearby AirVolume
      surfToAir.heatPort[1,1].T = portHeat.T;
      // question: portF.moist.x_flowAir.x
      surfToAir.moisturePort[1,1].x = 0.005;

      ///////////////
      ///////////////
      // To AirVolume
      portF.rho = rho;
      portF.h = cp*surfToAir.heatPort[1,1].T;
      portF.moist.x_flowAir = surfToAir.moisturePort[1,1].m_flow;

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={
            Line(
              points={{-60,-20},{-80,0}},
              color={0,0,255},
              thickness=1,
              smooth=Smooth.None,
              arrow={Arrow.Filled,Arrow.None}),
            Line(
              points={{-80,0},{-60,20}},
              color={0,0,255},
              thickness=1,
              smooth=Smooth.None,
              arrow={Arrow.Filled,Arrow.None}),
                                Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={0,0,255},
                fillColor={244,222,233},
                fillPattern=FillPattern.Solid)}));
    end BoundaryAdapter;
  end Boundaries;

  package Connections "Connectors"
    extends Modelica.Icons.Package;
    connector FluidFluid
      "normal Connection Flowelement-Volumeelement or Wallelement-Volumeelement"
      //General variables
      Modelica.SIunits.Length[3] posVec
      annotation (HideResult=true);
      Modelica.SIunits.Length[3] dimVec
      annotation (HideResult=true);
      // Movement and thermal
      Modelica.SIunits.Pressure p;
      Modelica.SIunits.Velocity[3] vVec;
      flow Modelica.SIunits.MassFlowRate m_flowAir;
      stream Modelica.SIunits.Density rho;
      stream Modelica.SIunits.SpecificEnthalpy h;
      // Hygro-port
      BuildingSystems.Buildings.Airvolumes.Airvolume3D.Connections.FluidMoist moist;
      //
      // Gradients and composed Gradients for the viscous force
      Real visgr1;
      Real visgr2;
      Real ForceVF;
      //
    end FluidFluid;

    connector FluidHeat
      //General variables
      Modelica.SIunits.Temp_K T;
      flow Modelica.SIunits.HeatFlowRate Qdot;
    end FluidHeat;

    connector FluidHeatExt "Heatport + dimVec, pos"
      //General variables
      Modelica.SIunits.Length[3] posVec
      annotation (HideResult=true);
      Modelica.SIunits.Length[3] dimVec
      annotation (HideResult=true);
      Modelica.SIunits.Temp_K T;
      flow Modelica.SIunits.HeatFlowRate Qdot;
    end FluidHeatExt;

    connector FluidMoist "Moist port"
      //General variables
      flow Modelica.SIunits.MassFlowRate x_flowAir;
      Modelica.SIunits.MassFraction x;
    end FluidMoist;

    connector AssessmentPort "VolumeElement-> AssessmentCenter"
      //General variables
      Real Tair;
      Real velMag;
      Real HumRel;
    end AssessmentPort;
  end Connections;
end Airvolume3D;
