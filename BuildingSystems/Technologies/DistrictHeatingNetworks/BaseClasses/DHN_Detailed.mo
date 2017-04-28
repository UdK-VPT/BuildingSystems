within BuildingSystems.Technologies.DistrictHeatingNetworks.BaseClasses;
partial model DHN_Detailed "partial model of a DHN"
 package Medium = BuildingSystems.Media.Water;
  //
 parameter Modelica.Media.Interfaces.Types.Temperature T_start = 273.15 + 90 "Initial conditions of the suooky side";

  // Different Variables uses to facilitate results check
  Modelica.SIunits.Heat Q_DHN_I "Energy loss in DHN part I";
  Modelica.SIunits.Heat Q_DHN_II "Energy loss in DHN part II";
  Modelica.SIunits.Heat Q_DHN_III "Energy loss in DHN part III";
  Modelica.SIunits.Heat Q_DHN "Total energy loss in DHN";

//Boundary:
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollectorDHN(m=71)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={312,256})));

//Pipes and stations:
  UndergroundPipes.ParallelPipes
                              p8(redeclare package Medium = Medium,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    d_o =      0.324,
    U1_constant =      0.523),
    length=60.7,
    m_flow_nominal=181.5)         annotation (Placement(
        transformation(
        extent={{-1.33013,7.69615},{1.33013,-7.69615}},
        rotation=-30,
        origin={200,-113})));

  UndergroundPipes.ParallelPipes
                              p9(redeclare package Medium = Medium,
    length=64.3,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.432,
    d_o =      0.168),
    m_flow_nominal=35.7)              annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=90,
        origin={184,-95})));
  UndergroundPipes.ParallelPipes
                              p11(redeclare package Medium = Medium,
    length=87.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.432,
    d_o =      0.168),
    m_flow_nominal=32.24)              annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={152,-89})));
  UndergroundPipes.ParallelPipes
                              p14(redeclare package Medium = Medium,
    length=217.2,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.432,
    d_o =      0.168),
    m_flow_nominal=17.7)             annotation (Placement(
        transformation(
        extent={{4,4},{-4,-4}},
        rotation=180,
        origin={42,-106})));
  UndergroundPipes.ParallelPipes
                              p10(redeclare package Medium = Medium,
    length=41.8,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089),
    m_flow_nominal=3.44)            annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=270,
        origin={158,-117})));
  UndergroundPipes.ParallelPipes
                              p12(redeclare package Medium = Medium,
    length=78.4,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.04,
    d_o =      0.048,
    U1_constant =      0.216),
    m_flow_nominal=1.22)            annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={114,-105})));
  UndergroundPipes.ParallelPipes
                              p13(redeclare package Medium = Medium,
    length=17.8,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.365,
    d_o =      0.14),
    m_flow_nominal=13.3)               annotation (Placement(
        transformation(
        extent={{4,4},{-4,-4}},
        rotation=180,
        origin={94,-76})));
  UndergroundPipes.ParallelPipes
                              p15(redeclare package Medium = Medium,
    length=238.4,
    m_flow_nominal=145.9,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    U1_constant =      0.5233,
    d_o =      0.324))                annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=270,
        origin={162,-175})));
  UndergroundPipes.ParallelPipes
                              p1(
    redeclare package Medium = Medium,
    length=98.6,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114),
    m_flow_nominal=15.74)
       annotation (Placement(transformation(
        extent={{-7.33013,-2.69615},{7.33013,2.69615}},
        rotation=150,
        origin={222,-139})));
  UndergroundPipes.ParallelPipes
                              p2(
    redeclare package Medium = Medium,
    length=35,
    m_flow_nominal=2.2,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))
           annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=180,
        origin={268,-153})));
  UndergroundPipes.ParallelPipes
                              p7(
    redeclare package Medium = Medium,
    length=174.5,
    m_flow_nominal=4.66,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    d_o =      0.089,
    U1_constant =      0.298))
                   annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=270,
        origin={336,-103})));
  UndergroundPipes.ParallelPipes
                              p3(
    redeclare package Medium = Medium,
    length=15,
    m_flow_nominal=13.53,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=90,
        origin={250,-163})));
  UndergroundPipes.ParallelPipes
                              p4(
    redeclare package Medium = Medium,
    length=76.8,
    m_flow_nominal=8.87,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))
          annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=90,
        origin={252,-183})));
  UndergroundPipes.ParallelPipes
                              p6(
    redeclare package Medium = Medium,
    length=175.24,
    m_flow_nominal=4.56,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))
          annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=90,
        origin={200,-237})));
  UndergroundPipes.ParallelPipes
                              p5(
    redeclare package Medium = Medium,
    length=17.4,
    m_flow_nominal=4.3,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))
          annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={232,-195})));
  UndergroundPipes.ParallelPipes
                              p16(
    redeclare package Medium = Medium,
    length=36.6,
    m_flow_nominal=17.1,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{6,-5},{-6,5}},
        rotation=270,
        origin={74,-257})));
  UndergroundPipes.ParallelPipes
                              p17(
    redeclare package Medium = Medium,
    length=36.2,
    m_flow_nominal=12.4,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{6,-5},{-6,5}},
        rotation=270,
        origin={62,-277})));
  UndergroundPipes.ParallelPipes
                              p19(
    redeclare package Medium = Medium,
    length=101,
    m_flow_nominal=10.33,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.365,
    d_o =      0.14))
           annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=0,
        origin={14,-257})));
  UndergroundPipes.ParallelPipes
                              p21(
    redeclare package Medium = Medium,
    length=54.6,
    m_flow_nominal=128.7,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    U1_constant =      0.523,
    d_o =      0.324))     annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={62,-227})));
  UndergroundPipes.ParallelPipes
                              p24(
    redeclare package Medium = Medium,
    length=206,
    m_flow_nominal=122.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    U1_constant =      0.523,
    d_o =      0.324))
           annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={10,-203})));
  UndergroundPipes.ParallelPipes
                              p23(
    redeclare package Medium = Medium,
    length=87.6,
    m_flow_nominal=1.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.04,
    U1_constant =      0.216,
    d_o =      0.048))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={50,-199})));
  UndergroundPipes.ParallelPipes
                              p22(
    redeclare package Medium = Medium,
    length=36.8,
    m_flow_nominal=4.7,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={34,-189})));
  UndergroundPipes.ParallelPipes
                              p25(
    redeclare package Medium = Medium,
    length=13.34,
    m_flow_nominal=7.3,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-54,-175})));
  UndergroundPipes.ParallelPipes
                              p26(
    redeclare package Medium = Medium,
    length=145.6,
    m_flow_nominal=115,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    U1_constant =      0.5233,
    d_o =      0.324))
           annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-78,-129})));
  UndergroundPipes.ParallelPipes
                              p34(
    redeclare package Medium = Medium,
    length=81.9,
    m_flow_nominal=85.2,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.2,
    U1_constant =      0.477,
    d_o =      0.22))
            annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={-94,-99})));
  UndergroundPipes.ParallelPipes
                              p35(
    redeclare package Medium = Medium,
    length=200.5,
    m_flow_nominal=76.22,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.3,
    U1_constant =      0.523,
    d_o =      0.324))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=270,
        origin={-82,-33})));
  UndergroundPipes.ParallelPipes
                              p36(
    redeclare package Medium = Medium,
    length=157.4,
    m_flow_nominal=13.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-160,-11})));
  UndergroundPipes.ParallelPipes
                              p39(
    redeclare package Medium = Medium,
    length=46,
    m_flow_nominal=5.9,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-210,-1})));
  UndergroundPipes.ParallelPipes
                              p40(redeclare package Medium = Medium,
    length=165.3,
    m_flow_nominal=4.13,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))                 annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-274,-1})));
  UndergroundPipes.ParallelPipes
                              p41(redeclare package Medium = Medium,
    length=162.4,
    m_flow_nominal=1.72,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))                  annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-240,49})));
  UndergroundPipes.ParallelPipes
                              p37(
    redeclare package Medium = Medium,
    length=21,
    m_flow_nominal=7.62,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-196,33})));
  UndergroundPipes.ParallelPipes
                              p27(
    redeclare package Medium = Medium,
    length=28.6,
    m_flow_nominal=30,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.2,
    U1_constant =      0.477,
    d_o =      0.22))
            annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={-104,-129})));
  UndergroundPipes.ParallelPipes
                              p30(
    redeclare package Medium = Medium,
    length=41,
    m_flow_nominal=10.7,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.365,
    d_o =      0.14))
           annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={-156,-109})));
  UndergroundPipes.ParallelPipes
                              p31(
    redeclare package Medium = Medium,
    length=35.8,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.02,
    U1_constant =      0.179,
    d_o =      0.027),
    m_flow_nominal=0.34)
       annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=270,
        origin={-152,-135})));
  UndergroundPipes.ParallelPipes
                              p29(
    redeclare package Medium = Medium,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089),
    length=16.76,
    m_flow_nominal=11.04)
  annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={-136,-121})));
  UndergroundPipes.ParallelPipes
                              p28(
    redeclare package Medium = Medium,
    length=50.2,
    m_flow_nominal=29.1,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.2,
    U1_constant =      0.477,
    d_o =      0.22))
            annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={-122,-133})));
  UndergroundPipes.ParallelPipes
                              p32(
    redeclare package Medium = Medium,
    length=19.17,
    m_flow_nominal=18.1,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.432,
    d_o =      0.168))
          annotation (Placement(transformation(
        extent={{6,5},{-6,-5}},
        rotation=270,
        origin={-142,-173})));
  UndergroundPipes.ParallelPipes
                              p33(
    redeclare package Medium = Medium,
    length=104,
    m_flow_nominal=17.64,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.431,
    d_o =      0.168))
          annotation (Placement(transformation(
        extent={{-6,5},{6,-5}},
        rotation=180,
        origin={-130,-193})));
  UndergroundPipes.ParallelPipes
                              p57(redeclare package Medium = Medium,
    length=230,
    m_flow_nominal=4.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))                 annotation (Placement(
        transformation(
        extent={{-6,5},{6,-5}},
        rotation=-30,
        origin={-220,253})));
  UndergroundPipes.ParallelPipes
                              p55(redeclare package Medium = Medium,
    length=102.6,
    m_flow_nominal=10.6,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))                annotation (Placement(
        transformation(
        extent={{-1.33013,7.69615},{1.33013,-7.69615}},
        rotation=-30,
        origin={-180,231})));
  UndergroundPipes.ParallelPipes
                              p42(
    redeclare package Medium = Medium,
    length=100,
    m_flow_nominal=62.7,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.2,
    U1_constant =      0.477,
    d_o =      0.22))
              annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-138,15})));
  UndergroundPipes.ParallelPipes
                              p43(
    redeclare package Medium = Medium,
    length=41,
    m_flow_nominal=2.63,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-182,77})));
  UndergroundPipes.ParallelPipes
                              p44(
    redeclare package Medium = Medium,
    length=84.5,
    m_flow_nominal=60.1,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.2,
    U1_constant =      0.477,
    d_o =      0.22))
            annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-116,75})));
  UndergroundPipes.ParallelPipes
                              p48(redeclare package Medium = Medium,
    length=20.2,
    m_flow_nominal=4.47,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))                annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-160,173})));
  UndergroundPipes.ParallelPipes
                              p46(redeclare package Medium = Medium,
    length=13,
    m_flow_nominal=1.8,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))                  annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-158,115})));
  UndergroundPipes.ParallelPipes
                              p45(redeclare package Medium = Medium,
    length=34,
    m_flow_nominal=22,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.365,
    d_o =      0.14))                      annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-136,107})));
  UndergroundPipes.ParallelPipes
                              p58(
    redeclare package Medium = Medium,
    length=14.2,
    m_flow_nominal=38.15,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.431,
    d_o =      0.168))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-122,119})));
  UndergroundPipes.ParallelPipes
                              p60(redeclare package Medium = Medium,
    length=34,
    m_flow_nominal=37.6,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.431,
    d_o =      0.168))                annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=0,
        origin={-104,127})));
  UndergroundPipes.ParallelPipes
                              p61(
    redeclare package Medium = Medium,
    length=17.5,
    m_flow_nominal=1.24,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.04,
    U1_constant =      0.216,
    d_o =      0.048))
       annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-92,139})));
  UndergroundPipes.ParallelPipes
                              p62(redeclare package Medium = Medium,
    length=66,
    m_flow_nominal=36.4,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.432,
    d_o =      0.168))                annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=0,
        origin={-80,117})));
  UndergroundPipes.ParallelPipes
                              p47(redeclare package Medium = Medium,
    length=110,
    m_flow_nominal=20.2,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))                annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-146,155})));
  UndergroundPipes.ParallelPipes
                              p49(
    redeclare package Medium = Medium,
    length=32,
    m_flow_nominal=15.7,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))
          annotation (Placement(transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={-140,177})));
  UndergroundPipes.ParallelPipes
                              p50(redeclare package Medium = Medium,
    length=41.5,
    m_flow_nominal=5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))                 annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={-116,179})));
  UndergroundPipes.ParallelPipes
                              p51(redeclare package Medium = Medium,
    length=66.6,
    m_flow_nominal=2.9,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))                annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={-82,181})));
  UndergroundPipes.ParallelPipes
                              p54(redeclare package Medium = Medium,
    length=77,
    m_flow_nominal=0.3,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.02,
    U1_constant =      0.179,
    d_o =      0.027))                annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={-88,225})));
  UndergroundPipes.ParallelPipes
                              p53(
    redeclare package Medium = Medium,
    length=13.4,
    m_flow_nominal=1.9,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))
           annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-126,215})));
  UndergroundPipes.ParallelPipes
                              p52(
    redeclare package Medium = Medium,
    length=27,
    m_flow_nominal=2.2,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.04,
    U1_constant =      0.216,
    d_o =      0.048))
          annotation (Placement(transformation(
        extent={{-6,-5},{6,5}},
        rotation=-90,
        origin={-102,195})));
  UndergroundPipes.ParallelPipes
                              p64(redeclare package Medium = Medium,
    length=42.42,
    m_flow_nominal=34,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.15,
    U1_constant =      0.431,
    d_o =      0.168))                annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=0,
        origin={-54,103})));
  UndergroundPipes.ParallelPipes
                              p70(redeclare package Medium = Medium,
    length=88,
    m_flow_nominal=14.45,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))                annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={2,45})));
  UndergroundPipes.ParallelPipes
                              p68(redeclare package Medium = Medium,
    length=47.5,
    m_flow_nominal=24.52,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.364,
    d_o =      0.14))                  annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=-90,
        origin={-18,89})));
  UndergroundPipes.ParallelPipes
                              p67(redeclare package Medium = Medium,
    length=82.1,
    m_flow_nominal=7.5,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))                annotation (Placement(
        transformation(
        extent={{-6,5},{6,-5}},
        rotation=-90,
        origin={-28,131})));
  UndergroundPipes.ParallelPipes
                              p66(redeclare package Medium = Medium,
    length=11,
    m_flow_nominal=1.97,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))                  annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=180,
        origin={-42,119})));
  UndergroundPipes.ParallelPipes
                              p72(redeclare package Medium = Medium,
    length=20.3,
    m_flow_nominal=11,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.125,
    U1_constant =      0.364,
    d_o =      0.14))                  annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={26,49})));
  UndergroundPipes.ParallelPipes
                              p73(redeclare package Medium = Medium,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076),
    length=37,
    m_flow_nominal=3)                  annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={44,47})));
  UndergroundPipes.ParallelPipes
                              p74(redeclare package Medium = Medium,
    length=13,
    m_flow_nominal=0.9,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.032,
    U1_constant =      0.188,
    d_o =      0.0424))              annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=0,
        origin={68,61})));
  UndergroundPipes.ParallelPipes
                              p75(redeclare package Medium = Medium,
    length=122,
    m_flow_nominal=2.14,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.05,
    U1_constant =      0.242,
    d_o =      0.06))                   annotation (Placement(
        transformation(
        extent={{6,-5},{-6,5}},
        rotation=-90,
        origin={68,35})));
  UndergroundPipes.ParallelPipes
                              p69(redeclare package Medium = Medium,
    length=26.3,
    m_flow_nominal=10.1,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.1,
    U1_constant =      0.31,
    d_o =      0.114))                annotation (Placement(
        transformation(
        extent={{-6,-5},{6,5}},
        rotation=0,
        origin={-30,51})));
  UndergroundPipes.ParallelPipes
                              p71(redeclare package Medium = Medium,
    length=69.5,
    m_flow_nominal=3.46,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))                annotation (Placement(
        transformation(
        extent={{-6,5},{6,-5}},
        rotation=-90,
        origin={14,65})));
  UndergroundPipes.ParallelPipes
                              p65(redeclare package Medium = Medium,
    length=25.2,
    m_flow_nominal=9.51,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.08,
    U1_constant =      0.298,
    d_o =      0.089))                annotation (Placement(
        transformation(
        extent={{-6,5},{6,-5}},
        rotation=-90,
        origin={-24,111})));
  UndergroundPipes.ParallelPipes
                              p63(redeclare package Medium = Medium,
    length=60.68,
    m_flow_nominal=2.34,
    redeclare UndergroundPipes.BaseClasses.DHN_Umodels.UPrescribed Umodel(
    d_i =      0.065,
    U1_constant =      0.288,
    d_o =      0.076))                annotation (Placement(
        transformation(
        extent={{6,5},{-6,-5}},
        rotation=-90,
        origin={-80,79})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st13(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{-6,-122},{12,-112}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st7(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{56,-76},{74,-66}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st29(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{84,-108},{102,-98}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st52(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{132,-138},{150,-128}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st39(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{360,-94},{342,-84}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st51(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{202,-200},{220,-190}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st48(    redeclare package
      Medium =                                                                                                                                     Medium)
    annotation (Placement(transformation(extent={{224,-254},{206,-244}})));

   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st23(redeclare package Medium =        Medium)
    annotation (Placement(transformation(extent={{296,-158},{278,-148}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st45(    redeclare package
      Medium =                                                                      Medium)
    annotation (Placement(transformation(extent={{-16,-262},{2,-252}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st44(    redeclare package
      Medium =                                                                      Medium)
    annotation (Placement(transformation(extent={{88,-300},{70,-290}})));

   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st54(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{80,-190},{62,-180}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st53(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{10,-182},{28,-172}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st50(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-88,-176},{-70,-166}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st30(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-94,-198},{-112,-188}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st46(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-176,-156},{-158,-146}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st6(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-186,-114},{-168,-104}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st2(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-124,-174},{-106,-164}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st3(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-86,-152},{-104,-142}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st9(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-130,-92},{-112,-82}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st55(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-260,64},{-242,74}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st35(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-310,0},{-292,10}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st1(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-218,42},{-200,52}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st40(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-224,74},{-206,84}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st43(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-252,264},{-234,274}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st47(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{96,20},{78,30}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st27(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{98,58},{80,68}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st10(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{30,78},{12,88}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st34(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{54,24},{36,34}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st25(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-58,52},{-40,62}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st11(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-6,140},{-24,150}})));

   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st33(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-58,224},{-76,234}})));

   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st21(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-158,212},{-140,222}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st16(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-50,178},{-68,188}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st12(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-182,184},{-164,194}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st17(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-192,116},{-174,126}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st5(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-104,154},{-86,164}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st14(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-100,52},{-82,62}})));
   BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow
                                                st8(redeclare package Medium =
        Medium)
    annotation (Placement(transformation(extent={{-68,130},{-50,140}})));
  BoundaryConditions.GroundTemperature0D groundTemperature0D(
    A=8.71875,
    z=1,
    t0(displayUnit="d") = 15552000,
    Tmean=282.9,
    m=1) annotation (Placement(transformation(extent={{380,246},{360,266}})));

equation
  //equation to sum up consumption.
  der(Q_DHN_I) = p1.port_a.Q_flow + p2.port_a.Q_flow + p3.port_a.Q_flow + p4.port_a.Q_flow + p5.port_a.Q_flow + p6.port_a.Q_flow + p7.port_a.Q_flow + p8.port_a.Q_flow + p9.port_a.Q_flow + p10.port_a.Q_flow + p11.port_a.Q_flow + p12.port_a.Q_flow + p13.port_a.Q_flow + p14.port_a.Q_flow;
  der(Q_DHN_II) = p15.port_a.Q_flow + p16.port_a.Q_flow + p17.port_a.Q_flow + p19.port_a.Q_flow + p21.port_a.Q_flow + p22.port_a.Q_flow + p23.port_a.Q_flow + p24.port_a.Q_flow + p25.port_a.Q_flow + p26.port_a.Q_flow + p27.port_a.Q_flow + p28.port_a.Q_flow + p29.port_a.Q_flow + p30.port_a.Q_flow + p31.port_a.Q_flow + p32.port_a.Q_flow + p33.port_a.Q_flow + p34.port_a.Q_flow;
  der(Q_DHN_III) = p35.port_a.Q_flow + p36.port_a.Q_flow + p37.port_a.Q_flow + p39.port_a.Q_flow + p40.port_a.Q_flow + p41.port_a.Q_flow + p42.port_a.Q_flow + p43.port_a.Q_flow + p44.port_a.Q_flow + p45.port_a.Q_flow + p46.port_a.Q_flow + p47.port_a.Q_flow + p48.port_a.Q_flow + p49.port_a.Q_flow + p50.port_a.Q_flow + p51.port_a.Q_flow + p52.port_a.Q_flow + p53.port_a.Q_flow + p54.port_a.Q_flow + p55.port_a.Q_flow + p57.port_a.Q_flow + p58.port_a.Q_flow + p60.port_a.Q_flow + p61.port_a.Q_flow + p62.port_a.Q_flow + p63.port_a.Q_flow + p64.port_a.Q_flow + p65.port_a.Q_flow + p66.port_a.Q_flow + p67.port_a.Q_flow + p68.port_a.Q_flow + p69.port_a.Q_flow + p70.port_a.Q_flow + p71.port_a.Q_flow + p72.port_a.Q_flow + p73.port_a.Q_flow + p74.port_a.Q_flow + p75.port_a.Q_flow;
  der(Q_DHN)=der(Q_DHN_I)+der(Q_DHN_II)+der(Q_DHN_III);

//Hidraulic connections
  connect(st13.port_b, p14.port_a1) annotation (Line(
      points={{12,-117},{20,-117},{20,-114},{32,-114},{32,-103.6},{38,-103.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p14.port_b1, p11.port_a1) annotation (Line(
      points={{46,-103.6},{78,-103.6},{78,-86},{146,-86}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p13.port_b1, p11.port_a1) annotation (Line(
      points={{98,-73.6},{98,-74},{106,-74},{106,-74},{126,-74},{126,-86},{146,-86}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p12.port_b1, p11.port_a1) annotation (Line(
      points={{120,-102},{122,-102},{122,-86},{146,-86}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st7.port_b, p13.port_a1) annotation (Line(
      points={{74,-71},{78.7188,-71},{78.7188,-73.6},{90,-73.6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st29.port_b, p12.port_a1) annotation (Line(
      points={{102,-103},{102,-102},{108,-102}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p11.port_b1, p9.port_a1) annotation (Line(
      points={{158,-86},{186,-86},{186,-90},{186,-90},{186,-89},{187,-89}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p8.port_a1, p9.port_b1) annotation (Line(
      points={{196.539,-116.334},{187,-116.334},{187,-101}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p10.port_b1, p8.port_a1) annotation (Line(
      points={{155,-111},{155,-104},{196.539,-104},{196.539,-116.334}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p1.port_a1, p3.port_b1) annotation (Line(
      points={{227.539,-144.066},{227.539,-154},{252,-154},{252,-157},{253,-157}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p2.port_b1, p1.port_a1) annotation (Line(
      points={{262,-150},{256,-150},{256,-154},{227.539,-154},{227.539,-144.066}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p3.port_a1, p4.port_b1) annotation (Line(
      points={{253,-169},{253,-174},{254,-174},{254,-177.6},{255,-177.6},{255,-177}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p5.port_b1, p4.port_a1) annotation (Line(
      points={{238,-192},{255,-192},{255,-189}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p6.port_b1, p4.port_a1) annotation (Line(
      points={{203,-231},{203,-212},{255,-212},{255,-189}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p3.port_a1, p7.port_b1) annotation (Line(
      points={{253,-169},{253,-172},{300,-172},{300,-162},{333,-162},{333,-109}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p15.port_b1, p8.port_a1) annotation (Line(
      points={{159,-169},{159,-162},{168,-162},{168,-116.334},{196.539,-116.334}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p21.port_b1, p15.port_a1) annotation (Line(
      points={{68,-224},{134,-224},{134,-210},{150,-210},{150,-196},{159,-196},{
          159,-181}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p16.port_b1, p15.port_a1) annotation (Line(
      points={{77,-251},{77,-234},{134,-234},{134,-210},{150,-210},{150,-196},{159,
          -196},{159,-181}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p17.port_b1, p16.port_a1) annotation (Line(
      points={{65,-271},{65,-270},{77,-270},{77,-263}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p19.port_b1, p17.port_a1) annotation (Line(
      points={{20,-260},{32,-260},{32,-290},{64,-290},{64,-283},{65,-283}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p21.port_a1, p23.port_b1) annotation (Line(
      points={{56,-224},{50,-224},{50,-209},{53,-209},{53,-205}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p21.port_a1, p22.port_b1) annotation (Line(
      points={{56,-224},{37,-224},{37,-195}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p24.port_b1, p21.port_a1) annotation (Line(
      points={{16,-200},{22,-200},{22,-224},{56,-224}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p24.port_a1, p25.port_b1) annotation (Line(
      points={{4,-200},{-18,-200},{-18,-172},{-48,-172}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p26.port_b1, p24.port_a1) annotation (Line(
      points={{-72,-126},{-52,-126},{-52,-146},{-36,-146},{-36,-166},{-8,-166},{
          -8,-200},{4,-200}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p26.port_a1, p27.port_b1) annotation (Line(
      points={{-84,-126},{-90,-126},{-90,-126},{-94,-126},{-94,-126},{-98,-126}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p28.port_b1, p27.port_a1) annotation (Line(
      points={{-116,-130},{-114,-130},{-114,-126},{-112,-126},{-112,-126},{-110,
          -126},{-110,-126}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p28.port_a1, p29.port_b1) annotation (Line(
      points={{-128,-130},{-128,-118},{-130,-118}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p31.port_b1, p29.port_a1) annotation (Line(
      points={{-155,-129},{-155,-118},{-142,-118}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p29.port_a1, p30.port_b1) annotation (Line(
      points={{-142,-118},{-142,-106},{-150,-106}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p26.port_a1, p34.port_b1) annotation (Line(
      points={{-84,-126},{-90,-126},{-90,-124},{-91,-124},{-91,-105}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p32.port_b1, p28.port_a1) annotation (Line(
      points={{-145,-167},{-144,-167},{-144,-130},{-128,-130},{-128,-130}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p32.port_a1, p33.port_b1) annotation (Line(
      points={{-145,-179},{-145,-190},{-136,-190}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p34.port_a1, p35.port_b1) annotation (Line(
      points={{-91,-93},{-91,-76},{-79,-76},{-79,-39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p35.port_a1, p36.port_b1) annotation (Line(
      points={{-79,-27},{-79,-8},{-154,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p39.port_b1, p36.port_a1) annotation (Line(
      points={{-204,2},{-188,2},{-188,-8},{-166,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p36.port_a1, p37.port_b1) annotation (Line(
      points={{-166,-8},{-188,-8},{-188,10},{-193,10},{-193,27}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p39.port_a1, p40.port_b1) annotation (Line(
      points={{-216,2},{-230,2},{-230,2.75},{-244,2.75},{-244,2},{-268,2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p39.port_a1, p41.port_b1) annotation (Line(
      points={{-216,2},{-237,2},{-237,43}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p35.port_a1, p42.port_b1) annotation (Line(
      points={{-79,-27},{-79,-18},{-135,-18},{-135,9}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p42.port_a1, p43.port_b1) annotation (Line(
      points={{-135,21},{-135,80},{-176,80}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p42.port_a1, p44.port_b1) annotation (Line(
      points={{-135,21},{-135,62},{-113,62},{-113,69}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p44.port_a1, p58.port_b1) annotation (Line(
      points={{-113,81},{-113,104},{-119,104},{-119,113}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p44.port_a1, p45.port_b1) annotation (Line(
      points={{-113,81},{-113,110},{-130,110}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p45.port_a1, p46.port_b1) annotation (Line(
      points={{-142,110},{-150,110},{-150,118},{-152,118}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p45.port_a1, p47.port_b1) annotation (Line(
      points={{-142,110},{-143,110},{-143,149}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p47.port_a1, p48.port_b1) annotation (Line(
      points={{-143,161},{-142,161},{-142,164},{-156,164},{-156,167},{-157,167}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p47.port_a1, p49.port_b1) annotation (Line(
      points={{-143,161},{-143,168},{-150,168},{-150,180},{-146,180},{-146,180}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p49.port_a1, p50.port_b1) annotation (Line(
      points={{-134,180},{-134,182},{-122,182}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p49.port_a1, p55.port_b1) annotation (Line(
      points={{-134,180},{-132,180},{-132,194},{-160,194},{-160,222},{-181.157,
          222},{-181.157,226.336}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p55.port_a1, p57.port_b1) annotation (Line(
      points={{-183.461,227.666},{-202,227.666},{-202,247.402},{-216.304,
          247.402}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p50.port_a1, p51.port_b1) annotation (Line(
      points={{-110,182},{-102,182},{-102,184},{-88,184}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p50.port_a1, p52.port_b1) annotation (Line(
      points={{-110,182},{-99,182},{-99,189}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p52.port_a1, p53.port_b1) annotation (Line(
      points={{-99,201},{-100,201},{-100,214},{-112,214},{-112,221},{-120,221},{
          -120,218}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p52.port_a1, p54.port_b1) annotation (Line(
      points={{-99,201},{-99,230},{-94,230},{-94,228}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p58.port_a1, p60.port_b1) annotation (Line(
      points={{-119,125},{-119,124},{-110,124}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p60.port_a1, p62.port_b1) annotation (Line(
      points={{-98,124},{-98,113},{-86,113},{-86,114}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p60.port_a1, p61.port_b1) annotation (Line(
      points={{-98,124},{-89,124},{-89,133}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p62.port_a1, p64.port_b1) annotation (Line(
      points={{-74,114},{-64,114},{-64,100},{-60,100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p62.port_a1, p63.port_b1) annotation (Line(
      points={{-74,114},{-74,114},{-74,102},{-74,102},{-74,100},{-82,100},{-82,85},
          {-83,85}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p64.port_a1, p65.port_b1) annotation (Line(
      points={{-48,100},{-28,100},{-28,105.6},{-27,105.6},{-27,105}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p65.port_a1, p67.port_b1) annotation (Line(
      points={{-27,117},{-27,122},{-31,122},{-31,125}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p65.port_a1, p66.port_b1) annotation (Line(
      points={{-27,117},{-27,118},{-30,118},{-30,122},{-36,122}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p64.port_a1, p68.port_b1) annotation (Line(
      points={{-48,100},{-22,100},{-22,98},{-22,98},{-22,95},{-21,95}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p68.port_a1, p69.port_b1) annotation (Line(
      points={{-21,83},{-21,54},{-24,54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p68.port_a1, p70.port_b1) annotation (Line(
      points={{-21,83},{-21,48},{-4,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p70.port_a1, p72.port_b1) annotation (Line(
      points={{8,48},{8,52},{20,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p72.port_a1, p73.port_b1) annotation (Line(
      points={{32,52},{32,52},{36,52},{36,50},{38,50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p70.port_a1, p71.port_b1) annotation (Line(
      points={{8,48},{12,48},{12,54},{11,54},{11,59}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p73.port_a1, p75.port_b1) annotation (Line(
      points={{50,50},{70.7,50},{70.7,41},{71,41}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p73.port_a1, p74.port_b1) annotation (Line(
      points={{50,50},{56,50},{56,64},{62,64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st52.port_b, p10.port_a1) annotation (Line(
      points={{150,-133},{155,-133},{155,-123}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p6.port_a1,st48. port_b) annotation (Line(
      points={{203,-243},{203,-249},{206,-249}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st51.port_b, p5.port_a1) annotation (Line(
      points={{220,-195},{222,-195},{222,-192},{226,-192}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p2.port_a1, st23.port_b) annotation (Line(
      points={{274,-150},{274,-150},{274,-153},{278,-153}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p7.port_a1, st39.port_b) annotation (Line(
      points={{333,-97},{333,-89},{342,-89}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st45.port_b, p19.port_a1) annotation (Line(
      points={{2,-257},{4,-257},{4,-260},{8,-260}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p17.port_a1,st44. port_b) annotation (Line(
      points={{65,-283},{65,-295},{70,-295}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st53.port_b, p22.port_a1) annotation (Line(
      points={{28,-177},{37,-177},{37,-183}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p23.port_a1, st54.port_b) annotation (Line(
      points={{53,-193},{53,-185},{62,-185}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st50.port_b, p25.port_a1) annotation (Line(
      points={{-70,-171},{-70,-170.125},{-60,-170.125},{-60,-172}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p33.port_a1, st30.port_b) annotation (Line(
      points={{-124,-190},{-122,-190},{-122,-193},{-112,-193}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st46.port_b, p31.port_a1) annotation (Line(
      points={{-158,-151},{-155,-151},{-155,-141}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st6.port_b, p30.port_a1) annotation (Line(
      points={{-168,-109},{-168,-106},{-162,-106}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p32.port_a1, st2.port_b) annotation (Line(
      points={{-145,-179},{-146,-179},{-146,-180},{-146,-180},{-146,-182},{-106,
          -182},{-106,-169}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p27.port_a1, st3.port_b) annotation (Line(
      points={{-110,-126},{-110,-126},{-112,-126},{-112,-126},{-112,-126},{-112,
          -146},{-104,-146},{-104,-147}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p34.port_a1, st9.port_b) annotation (Line(
      points={{-91,-93},{-91,-90},{-92,-90},{-92,-87},{-112,-87}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st55.port_b, p41.port_a1) annotation (Line(
      points={{-242,69},{-237,69},{-237,55}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st1.port_b, p37.port_a1) annotation (Line(
      points={{-200,47},{-193,47},{-193,39}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st40.port_b, p43.port_a1) annotation (Line(
      points={{-206,79},{-206,80},{-188,80}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st43.port_b, p57.port_a1) annotation (Line(
      points={{-234,269},{-226.696,269},{-226.696,253.402}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p75.port_a1, st47.port_b) annotation (Line(
      points={{71,29},{71,25},{78,25}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p74.port_a1, st27.port_b) annotation (Line(
      points={{74,64},{80,64},{80,63}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p71.port_a1, st10.port_b) annotation (Line(
      points={{11,71},{11,74},{12,74},{12,83}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p72.port_a1, st34.port_b) annotation (Line(
      points={{32,52},{34,52},{34,30},{36,30},{36,29}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st25.port_b, p69.port_a1) annotation (Line(
      points={{-40,57},{-40,54},{-36,54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p67.port_a1, st11.port_b) annotation (Line(
      points={{-31,137},{-31,145},{-24,145}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p54.port_a1, st33.port_b) annotation (Line(
      points={{-82,228},{-80,228},{-80,229},{-76,229}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st21.port_b, p53.port_a1) annotation (Line(
      points={{-140,217},{-136,217},{-136,218},{-132,218}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p51.port_a1, st16.port_b) annotation (Line(
      points={{-76,184},{-76,183},{-68,183}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st12.port_b, p48.port_a1) annotation (Line(
      points={{-164,189},{-157,189},{-157,179}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st17.port_b, p46.port_a1) annotation (Line(
      points={{-174,121},{-174,118},{-164,118}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(p61.port_a1, st5.port_b) annotation (Line(
      points={{-89,145},{-89,146.2},{-86,146.2},{-86,159}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st14.port_b, p63.port_a1) annotation (Line(
      points={{-82,57},{-83,57},{-83,73}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(st8.port_b, p66.port_a1) annotation (Line(
      points={{-50,135},{-50,122},{-48,122}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(st52.port_a, p10.port_b2) annotation (Line(points={{132,-133},{128,-133},
          {128,-136},{128,-144},{161,-144},{161,-123}}, color={0,127,255}));
  connect(st29.port_a, p12.port_b2) annotation (Line(points={{84,-103},{84,-103},
          {84,-104},{84,-118},{86,-118},{108,-118},{108,-108}}, color={0,127,255}));
  connect(st7.port_a, p13.port_b2) annotation (Line(points={{56,-71},{52,-71},{52,
          -72},{52,-78.4},{90,-78.4}}, color={0,127,255}));
  connect(p12.port_a2, p11.port_b2) annotation (Line(points={{120,-108},{132,-108},
          {132,-92},{146,-92}}, color={0,127,255}));
  connect(p11.port_a2, p9.port_b2) annotation (Line(points={{158,-92},{170,-92},
          {170,-89},{181,-89}}, color={0,127,255}));
  connect(p10.port_a2, p8.port_b2) annotation (Line(points={{161,-111},{199.5,
          -111},{199.5,-108.336},{201.157,-108.336}},
                                                color={0,127,255}));
  connect(p9.port_a2, p8.port_b2) annotation (Line(points={{181,-101},{181,-106},
          {201.157,-106},{201.157,-108.336}}, color={0,127,255}));
  connect(p13.port_a2, p11.port_b2) annotation (Line(points={{98,-78.4},{108,-78.4},
          {108,-78},{114,-78},{114,-92},{146,-92}}, color={0,127,255}));
  connect(st13.port_a, p14.port_b2) annotation (Line(points={{-6,-117},{-10,-117},
          {-10,-118},{-10,-130},{38,-130},{38,-108.4}}, color={0,127,255}));
  connect(p14.port_a2, p11.port_b2) annotation (Line(points={{46,-108.4},{62,-108.4},
          {62,-108},{82,-108},{82,-92},{146,-92}}, color={0,127,255}));
  connect(p7.port_b2, st39.port_a) annotation (Line(points={{339,-97},{366,-97},
          {366,-89},{360,-89}}, color={0,127,255}));
  connect(p7.port_a2, p3.port_b2) annotation (Line(points={{339,-109},{339,-174},
          {236,-174},{236,-169},{247,-169}}, color={0,127,255}));
  connect(p4.port_a2, p3.port_b2) annotation (Line(points={{249,-177},{249,-173.5},
          {247,-173.5},{247,-169}}, color={0,127,255}));
  connect(p3.port_a2, p1.port_b2) annotation (Line(points={{247,-157},{247,
          -141.264},{229.157,-141.264}},
                               color={0,127,255}));
  connect(p2.port_a2, p1.port_b2) annotation (Line(points={{262,-156},{258,-156},
          {258,-141.264},{229.157,-141.264}}, color={0,127,255}));
  connect(p2.port_b2, st23.port_a) annotation (Line(points={{274,-156},{276,-156},
          {276,-162},{276,-164},{296,-164},{296,-153}}, color={0,127,255}));
  connect(st51.port_a, p5.port_b2) annotation (Line(points={{202,-195},{198,-195},
          {198,-196},{198,-204},{226,-204},{226,-198}}, color={0,127,255}));
  connect(p5.port_a2, p4.port_b2) annotation (Line(points={{238,-198},{249,-198},
          {249,-189}}, color={0,127,255}));
  connect(st48.port_a, p6.port_b2) annotation (Line(points={{224,-249},{230,-249},
          {230,-248},{230,-262},{197,-262},{197,-243}}, color={0,127,255}));
  connect(p6.port_a2, p4.port_b2) annotation (Line(points={{197,-231},{197,-210},
          {249,-210},{249,-189}}, color={0,127,255}));
  connect(p15.port_a2, p8.port_b2) annotation (Line(points={{165,-169},{176,
          -169},{176,-108.336},{201.157,-108.336}},
                                              color={0,127,255}));
  connect(st45.port_a, p19.port_b2) annotation (Line(points={{-16,-257},{-22,-257},
          {-22,-256},{-22,-244},{0,-244},{8,-244},{8,-254}}, color={0,127,255}));
  connect(st44.port_a, p17.port_b2) annotation (Line(points={{88,-295},{92,-295},
          {92,-296},{92,-308},{59,-308},{59,-283}}, color={0,127,255}));
  connect(p17.port_a2, p16.port_b2) annotation (Line(points={{59,-271},{59,-266},
          {71,-266},{71,-263}}, color={0,127,255}));
  connect(p19.port_a2, p16.port_b2) annotation (Line(points={{20,-254},{46,-254},
          {46,-263},{71,-263}}, color={0,127,255}));
  connect(p24.port_a2, p21.port_b2) annotation (Line(points={{16,-206},{16,-206},
          {16,-230},{16,-230},{56,-230}}, color={0,127,255}));
  connect(p23.port_b2, st54.port_a) annotation (Line(points={{47,-193},{47,-172},
          {90,-172},{90,-185},{80,-185}}, color={0,127,255}));
  connect(p23.port_a2, p21.port_b2) annotation (Line(points={{47,-205},{47,-230},
          {56,-230}}, color={0,127,255}));
  connect(p22.port_b2, st53.port_a) annotation (Line(points={{31,-183},{6,-183},
          {6,-177},{10,-177}}, color={0,127,255}));
  connect(p22.port_a2, p21.port_b2) annotation (Line(points={{31,-195},{31,-230},
          {56,-230}}, color={0,127,255}));
  connect(p15.port_b2, p21.port_a2) annotation (Line(points={{165,-181},{165,-230},
          {68,-230}}, color={0,127,255}));
  connect(p16.port_a2, p15.port_b2) annotation (Line(points={{71,-251},{71,-230},
          {165,-230},{165,-181}}, color={0,127,255}));
  connect(st50.port_a, p25.port_b2) annotation (Line(points={{-88,-171},{-88,-171},
          {-88,-182},{-60,-182},{-60,-178}}, color={0,127,255}));
  connect(p25.port_a2, p24.port_b2) annotation (Line(points={{-48,-178},{-48,-206},
          {4,-206}}, color={0,127,255}));
  connect(st30.port_a, p33.port_b2) annotation (Line(points={{-94,-193},{-88,-193},
          {-88,-206},{-124,-206},{-124,-196}}, color={0,127,255}));
  connect(p32.port_b2, st2.port_a) annotation (Line(points={{-139,-179},{-124,-179},
          {-124,-169}}, color={0,127,255}));
  connect(p33.port_a2, p32.port_b2) annotation (Line(points={{-136,-196},{-139,-196},
          {-139,-179}}, color={0,127,255}));
  connect(st46.port_a, p31.port_b2) annotation (Line(points={{-176,-151},{-182,-151},
          {-182,-152},{-182,-164},{-176,-164},{-149,-164},{-149,-141}}, color={0,
          127,255}));
  connect(p30.port_b2, st6.port_a) annotation (Line(points={{-162,-112},{-162,-120},
          {-186,-120},{-186,-109}}, color={0,127,255}));
  connect(p30.port_a2, p29.port_b2) annotation (Line(points={{-150,-112},{-146,-112},
          {-146,-124},{-142,-124}}, color={0,127,255}));
  connect(p31.port_a2, p29.port_b2) annotation (Line(points={{-149,-129},{-149,-124},
          {-142,-124}}, color={0,127,255}));
  connect(p29.port_a2, p28.port_b2) annotation (Line(points={{-130,-124},{-130,-136},
          {-128,-136}}, color={0,127,255}));
  connect(p32.port_a2, p28.port_b2) annotation (Line(points={{-139,-167},{-139,-136},
          {-128,-136}}, color={0,127,255}));
  connect(p28.port_a2, p27.port_b2) annotation (Line(points={{-116,-136},{-110,-136},
          {-110,-132}}, color={0,127,255}));
  connect(st3.port_a, p27.port_b2) annotation (Line(points={{-86,-147},{-84,-147},
          {-84,-156},{-110,-156},{-110,-132}}, color={0,127,255}));
  connect(p27.port_a2, p26.port_b2) annotation (Line(points={{-98,-132},{-98,-136},
          {-84,-136},{-84,-132}}, color={0,127,255}));
  connect(st9.port_a, p34.port_b2) annotation (Line(points={{-130,-87},{-132,-87},
          {-132,-88},{-132,-96},{-108,-96},{-108,-93},{-97,-93}}, color={0,127,255}));
  connect(p26.port_b2, p34.port_a2) annotation (Line(points={{-84,-132},{-97,-132},
          {-97,-105}}, color={0,127,255}));
  connect(p26.port_a2, p24.port_b2) annotation (Line(points={{-72,-132},{-56,-132},
          {-56,-150},{-38,-150},{-38,-170},{-12,-170},{-12,-206},{4,-206}},
        color={0,127,255}));
  connect(p34.port_b2, p35.port_a2) annotation (Line(points={{-97,-93},{-97,-72},
          {-86,-72},{-86,-39},{-85,-39}}, color={0,127,255}));
  connect(p35.port_b2, p36.port_a2) annotation (Line(points={{-85,-27},{-85,-14},
          {-154,-14}}, color={0,127,255}));
  connect(p35.port_b2, p42.port_a2) annotation (Line(points={{-85,-27},{-85,-14},
          {-141,-14},{-141,9}}, color={0,127,255}));
  connect(p39.port_a2, p36.port_b2) annotation (Line(points={{-204,-4},{-198,-4},
          {-198,-14},{-166,-14}}, color={0,127,255}));
  connect(p36.port_b2, p37.port_a2) annotation (Line(points={{-166,-14},{-199,-14},
          {-199,27}}, color={0,127,255}));
  connect(p40.port_a2, p39.port_b2) annotation (Line(points={{-268,-4},{-242,-4},
          {-216,-4}}, color={0,127,255}));
  connect(st35.port_a, p40.port_b2) annotation (Line(points={{-310,5},{-314,5},
          {-314,2},{-314,-8},{-312,-8},{-312,-6},{-280,-6},{-280,-4}},color={0,127,
          255}));
  connect(p41.port_a2, p39.port_b2) annotation (Line(points={{-243,43},{-242,43},
          {-242,-4},{-216,-4}}, color={0,127,255}));
  connect(p41.port_b2, st55.port_a) annotation (Line(points={{-243,55},{-260,55},
          {-260,69}}, color={0,127,255}));
  connect(st40.port_a, p43.port_b2) annotation (Line(points={{-224,79},{-226,79},
          {-226,78},{-226,68},{-192,68},{-192,74},{-188,74}}, color={0,127,255}));
  connect(p37.port_b2, st1.port_a)  annotation (Line(points={{-199,39},{-204,39},
          {-204,34},{-218,34},{-218,47}}, color={0,127,255}));
  connect(p43.port_a2, p42.port_b2) annotation (Line(points={{-176,74},{-166,74},
          {-141,74},{-141,21}}, color={0,127,255}));
  connect(p42.port_b2, p44.port_a2) annotation (Line(points={{-141,21},{-141,66},
          {-119,66},{-119,69}}, color={0,127,255}));
  connect(st14.port_a, p63.port_b2) annotation (Line(points={{-100,57},{-102,57},
          {-102,56},{-102,44},{-76,44},{-76,73},{-77,73}}, color={0,127,255}));
  connect(p45.port_a2, p44.port_b2) annotation (Line(points={{-130,104},{-124,104},
          {-124,86},{-119,86},{-119,81}}, color={0,127,255}));
  connect(p44.port_b2, p58.port_a2) annotation (Line(points={{-119,81},{-119,90},
          {-125,90},{-125,113}}, color={0,127,255}));
  connect(p58.port_b2, p60.port_a2) annotation (Line(points={{-125,125},{-125,130},
          {-110,130}}, color={0,127,255}));
  connect(p45.port_b2, p47.port_a2) annotation (Line(points={{-142,104},{-149,104},
          {-149,149}}, color={0,127,255}));
  connect(p46.port_a2, p45.port_b2) annotation (Line(points={{-152,112},{-152,104},
          {-142,104}}, color={0,127,255}));
  connect(st17.port_a, p46.port_b2) annotation (Line(points={{-192,121},{-196,121},
          {-196,120},{-196,110},{-164,110},{-164,112}}, color={0,127,255}));
  connect(p48.port_a2, p47.port_b2) annotation (Line(points={{-163,167},{-163,161},
          {-149,161}}, color={0,127,255}));
  connect(st12.port_a, p48.port_b2) annotation (Line(points={{-182,189},{-182,179},
          {-163,179}}, color={0,127,255}));
  connect(p60.port_b2, p61.port_a2) annotation (Line(points={{-98,130},{-96,130},
          {-96,133},{-95,133}}, color={0,127,255}));
  connect(p61.port_b2, st5.port_a)  annotation (Line(points={{-95,145},{-104,145},
          {-104,159}}, color={0,127,255}));
  connect(p60.port_b2, p62.port_a2) annotation (Line(points={{-98,130},{-84,130},
          {-84,120},{-86,120}}, color={0,127,255}));
  connect(p62.port_b2, p64.port_a2) annotation (Line(points={{-74,120},{-70,120},
          {-70,118},{-60,118},{-60,106}}, color={0,127,255}));
  connect(p63.port_a2, p62.port_b2) annotation (Line(points={{-77,85},{-77,90},{
          -70,90},{-70,120},{-74,120}}, color={0,127,255}));
  connect(st25.port_a, p69.port_b2) annotation (Line(points={{-58,57},{-62,57},
          {-62,56},{-62,48},{-36,48}},         color={0,127,255}));
  connect(p69.port_a2, p68.port_b2) annotation (Line(points={{-24,48},{-24,40},{
          -15,40},{-15,83}}, color={0,127,255}));
  connect(p70.port_a2, p68.port_b2)
    annotation (Line(points={{-4,42},{-15,42},{-15,83}}, color={0,127,255}));
  connect(p70.port_b2, p71.port_a2)
    annotation (Line(points={{8,42},{17,42},{17,59}}, color={0,127,255}));
  connect(p71.port_b2, st10.port_a) annotation (Line(points={{17,71},{34,71},{34,
          83},{30,83}}, color={0,127,255}));
  connect(p74.port_b2, st27.port_a) annotation (Line(points={{74,58},{74,48},{102,
          48},{102,63},{98,63}}, color={0,127,255}));
  connect(p73.port_b2, p74.port_a2)
    annotation (Line(points={{50,44},{62,44},{62,58}}, color={0,127,255}));
  connect(p73.port_b2, p75.port_a2)
    annotation (Line(points={{50,44},{65,44},{65,41}}, color={0,127,255}));
  connect(p75.port_b2, st47.port_a) annotation (Line(points={{65,29},{65,16},{102,
          16},{102,25},{96,25}}, color={0,127,255}));
  connect(p72.port_b2, p73.port_a2) annotation (Line(points={{32,46},{36,46},{36,
          44},{38,44}}, color={0,127,255}));
  connect(p72.port_b2, st34.port_a) annotation (Line(points={{32,46},{32,46},{
          32,20},{56,20},{56,29},{54,29}},      color={0,127,255}));
  connect(p70.port_b2, p72.port_a2)
    annotation (Line(points={{8,42},{20,42},{20,46}}, color={0,127,255}));
  connect(p67.port_b2, st11.port_a)
    annotation (Line(points={{-25,137},{-6,137},{-6,145}}, color={0,127,255}));
  connect(st8.port_a, p66.port_b2) annotation (Line(points={{-68,135},{-70,135},
          {-70,134},{-70,126},{-54,126},{-54,120},{-54,116},{-48,116}}, color={0,
          127,255}));
  connect(p51.port_b2, st16.port_a) annotation (Line(points={{-76,178},{-74,178},
          {-74,174},{-44,174},{-44,183},{-50,183}}, color={0,127,255}));
  connect(st21.port_a, p53.port_b2) annotation (Line(points={{-158,217},{-158,217},
          {-158,208},{-132,208},{-132,212}},            color={0,127,255}));
  connect(p54.port_b2, st33.port_a) annotation (Line(points={{-82,222},{-78,222},
          {-78,220},{-58,220},{-58,229}}, color={0,127,255}));
  connect(p52.port_b2, p54.port_a2) annotation (Line(points={{-105,201},{-105,222},
          {-94,222}}, color={0,127,255}));
  connect(p53.port_a2, p52.port_b2) annotation (Line(points={{-120,212},{-120,201},
          {-105,201}}, color={0,127,255}));
  connect(p50.port_b2, p52.port_a2) annotation (Line(points={{-110,176},{-105,176},
          {-105,189}}, color={0,127,255}));
  connect(p50.port_b2, p51.port_a2) annotation (Line(points={{-110,176},{-100,176},
          {-100,178},{-88,178}}, color={0,127,255}));
  connect(p49.port_b2, p50.port_a2) annotation (Line(points={{-134,174},{-128,
          174},{-128,176},{-122,176}},
                                  color={0,127,255}));
  connect(st43.port_a, p57.port_b2) annotation (Line(points={{-252,269},{-256,
          269},{-256,268},{-260,268},{-260,258.598},{-223.696,258.598}},
                                                                    color={0,127,
          255}));
  connect(p57.port_a2, p55.port_b2) annotation (Line(points={{-213.304,252.598},
          {-186,252.598},{-186,235.664},{-178.843,235.664}}, color={0,127,255}));
  connect(p55.port_a2, p49.port_b2) annotation (Line(points={{-176.539,234.334},
          {-164,234.334},{-164,196},{-128,196},{-128,174},{-134,174}}, color={0,
          127,255}));
  connect(p66.port_a2, p65.port_b2) annotation (Line(points={{-36,116},{-34,116},
          {-34,116},{-34,116},{-34,120},{-21,120},{-21,117}}, color={0,127,255}));
  connect(p67.port_a2, p65.port_b2) annotation (Line(points={{-25,125},{-21,125},
          {-21,117}}, color={0,127,255}));
  connect(p64.port_b2, p65.port_a2) annotation (Line(points={{-48,106},{-40,106},
          {-40,102},{-21,102},{-21,105}}, color={0,127,255}));
  connect(p68.port_a2, p64.port_b2) annotation (Line(points={{-15,95},{-15,102},
          {-40,102},{-40,106},{-48,106}}, color={0,127,255}));

// (no annotations) Connections Boundary conditions to pipes:
  connect(p8.port_a, thermalCollectorDHN.port_a[1]);
  connect(p9.port_a, thermalCollectorDHN.port_a[2]);
  connect(p11.port_a, thermalCollectorDHN.port_a[3]);
  connect(p14.port_a, thermalCollectorDHN.port_a[4]);
  connect(p10.port_a, thermalCollectorDHN.port_a[5]);
  connect(p12.port_a, thermalCollectorDHN.port_a[6]);
  connect(p13.port_a, thermalCollectorDHN.port_a[7]);
  connect(p15.port_a, thermalCollectorDHN.port_a[8]);
  connect(p1.port_a, thermalCollectorDHN.port_a[9]);
  connect(p2.port_a, thermalCollectorDHN.port_a[10]);
  connect(p7.port_a, thermalCollectorDHN.port_a[11]);
  connect(p3.port_a, thermalCollectorDHN.port_a[12]);
  connect(p4.port_a, thermalCollectorDHN.port_a[13]);
  connect(p6.port_a, thermalCollectorDHN.port_a[14]);
  connect(p5.port_a, thermalCollectorDHN.port_a[15]);
  connect(p16.port_a, thermalCollectorDHN.port_a[16]);
  connect(p17.port_a, thermalCollectorDHN.port_a[17]);
  connect(p19.port_a, thermalCollectorDHN.port_a[18]);
  connect(p21.port_a, thermalCollectorDHN.port_a[19]);
  connect(p24.port_a, thermalCollectorDHN.port_a[20]);
  connect(p23.port_a, thermalCollectorDHN.port_a[21]);
  connect(p22.port_a, thermalCollectorDHN.port_a[22]);
  connect(p25.port_a, thermalCollectorDHN.port_a[23]);
  connect(p26.port_a, thermalCollectorDHN.port_a[24]);
  connect(p34.port_a, thermalCollectorDHN.port_a[25]);
  connect(p35.port_a, thermalCollectorDHN.port_a[26]);
  connect(p36.port_a, thermalCollectorDHN.port_a[27]);
  connect(p39.port_a, thermalCollectorDHN.port_a[28]);
  connect(p40.port_a, thermalCollectorDHN.port_a[29]);
  connect(p41.port_a, thermalCollectorDHN.port_a[30]);
  connect(p37.port_a, thermalCollectorDHN.port_a[31]);
  connect(p27.port_a, thermalCollectorDHN.port_a[32]);
  connect(p30.port_a, thermalCollectorDHN.port_a[33]);
  connect(p31.port_a, thermalCollectorDHN.port_a[34]);
  connect(p29.port_a, thermalCollectorDHN.port_a[35]);
  connect(p28.port_a, thermalCollectorDHN.port_a[36]);
  connect(p32.port_a, thermalCollectorDHN.port_a[37]);
  connect(p33.port_a, thermalCollectorDHN.port_a[38]);
  connect(p57.port_a, thermalCollectorDHN.port_a[39]);
  connect(p55.port_a, thermalCollectorDHN.port_a[40]);
  connect(p42.port_a, thermalCollectorDHN.port_a[41]);
  connect(p43.port_a, thermalCollectorDHN.port_a[42]);
  connect(p44.port_a, thermalCollectorDHN.port_a[43]);
  connect(p48.port_a, thermalCollectorDHN.port_a[44]);
  connect(p46.port_a, thermalCollectorDHN.port_a[45]);
  connect(p45.port_a, thermalCollectorDHN.port_a[46]);
  connect(p58.port_a, thermalCollectorDHN.port_a[48]);
  connect(p60.port_a, thermalCollectorDHN.port_a[49]);
  connect(p61.port_a, thermalCollectorDHN.port_a[50]);
  connect(p62.port_a, thermalCollectorDHN.port_a[51]);
  connect(p47.port_a, thermalCollectorDHN.port_a[52]);
  connect(p49.port_a, thermalCollectorDHN.port_a[53]);
  connect(p50.port_a, thermalCollectorDHN.port_a[54]);
  connect(p51.port_a, thermalCollectorDHN.port_a[55]);
  connect(p54.port_a, thermalCollectorDHN.port_a[56]);
  connect(p53.port_a, thermalCollectorDHN.port_a[57]);
  connect(p52.port_a, thermalCollectorDHN.port_a[58]);
  connect(p64.port_a, thermalCollectorDHN.port_a[59]);
  connect(p70.port_a, thermalCollectorDHN.port_a[60]);
  connect(p68.port_a, thermalCollectorDHN.port_a[61]);
  connect(p67.port_a, thermalCollectorDHN.port_a[62]);
  connect(p66.port_a, thermalCollectorDHN.port_a[63]);
  connect(p72.port_a, thermalCollectorDHN.port_a[64]);
  connect(p73.port_a, thermalCollectorDHN.port_a[65]);
  connect(p74.port_a, thermalCollectorDHN.port_a[66]);
  connect(p75.port_a, thermalCollectorDHN.port_a[67]);
  connect(p69.port_a, thermalCollectorDHN.port_a[68]);
  connect(p71.port_a, thermalCollectorDHN.port_a[69]);
  connect(p65.port_a, thermalCollectorDHN.port_a[70]);
  connect(p63.port_a, thermalCollectorDHN.port_a[71]);
  connect(thermalCollectorDHN.port_b, groundTemperature0D.port[1])
    annotation (Line(points={{322,256},{361,256}}, color={191,0,0}));

  connect(st35.port_b, p40.port_a1)
    annotation (Line(points={{-292,5},{-292,2},{-280,2}}, color={0,127,255}));
  connect(p47.port_b2, p49.port_a2) annotation (Line(points={{-149,161},{-149,
          166},{-146,166},{-146,174}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-400,
            -400},{400,400}})),        Documentation(info="<html>
<p>
Partial model of a district heating network to be extended in the <code>HCBC_DHN</code> model.
</p>
</html>"),
    experiment(StopTime=3.1536e+007, Interval=1800),
    __Dymola_experimentSetupOutput(events=false));
end DHN_Detailed;
