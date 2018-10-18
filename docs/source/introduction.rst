.. _introduction:

Introduction
============

This user guide explains the use of the Modelica library BuildingSystems (http://www.modelica-buildingsystems.de),
which is being developed for the dynamic simulation of the energetic behavior of single rooms, buildings and whole districts.

One important part of the library consists of an adaptive building model, which is able to adapt its spatial resolution
(0D, 1D, 3D modelling approach) and also its physical model (e.g. pure thermal or a hygro-thermal calculation) to the
respective problem of the simulation analysis.

.. figure:: /images/ATES_Campus_TUB_UdKB.*
   :scale: 60 %

   Application of the simplified building model (0D modelling approach) for district modeling: 39 buildings
   of the Campus Berlin-Charlottenburg are connected by a district heating grid (ATES project).

**0D modelling approach**: The adaptive building model works in a strongly simplified and abstracted configuration
(low-order or gray box model), which leads to numerically fast calculations. A typical case study is the
simultaneous calculation of the thermal energy demand of a large number of single buildings of a district
in combination with a district heating network (compare with Figure 1.1).

.. figure:: /images/SDE2014TeamRooftop.*
   :scale: 60 %

   The Rooftop building, which was designed for placement on the roof of a Gründerzeit building in Berlin (UdK Berlin/TU Berlin
   contribution to the competition Solar Decathlon Europe 2014)

**1D modelling approach**: In this case the adaptive building model uses more spatially resolved algorithms and models
and also more simulation time for a single building. A typical application is multi-zone-building models,
which calculate the heating and cooling energy demand, the air temperatures and air moistures for each thermal zone as well as
the air exchange between the single thermal zones of a complex building. The Rooftop building in Figure 1.2, for example, has
two air-conditioned and two not air-conditioned rooms, so it could be modelled with four thermal zones.

.. figure:: /images/UCaHS_Zonal_CFD.*
   :scale: 70 %

   Spatially resolved room model of the Aachen Model Room AMoR modelled with the 3D zonal approach
   of the BuildingSystems library (left) and with ANSYS CFD (right) (project UCaHS)

**3D modelling approach**: The most advanced configuration consists of a spatially resolved room model,
which describes the three-dimensional air flow within a room volume, the geometrical long-wave and
short-wave radiation distribution and also the multidimensional heat transport within the building construction.
For example, this model is able to calculate the location-dependent thermal comfort within a room (compare with Figure 1.3).

The BuildingSystems library supports pure thermal or also hygro-thermal calculations for all three modelling approaches.
Mixed thermal and hygro-thermal simulation analysis and different spatial resolutions for different
zones of a building model are also supported.
