within BuildingSystems.Applications.DistrictSimulation;
model HCBC_DHN
  "Model of the university campus Berlin-Charlottenburg (HCBC) with DHN."
  extends BuildingSystems.Applications.DistrictSimulation.HCBC(
    building1(heatSources=true, nHeatSources=1),
    building2(heatSources=true, nHeatSources=1),
    building3(heatSources=true, nHeatSources=1),
    building5(heatSources=true, nHeatSources=1),
    building6(heatSources=true, nHeatSources=1),
    building7(heatSources=true, nHeatSources=1),
    building8(heatSources=true, nHeatSources=1),
    building9(heatSources=true, nHeatSources=1),
    building10(heatSources=true, nHeatSources=1),
    building11(heatSources=true, nHeatSources=1),
    building12(heatSources=true, nHeatSources=1),
    building13(heatSources=true, nHeatSources=1),
    building14(heatSources=true, nHeatSources=1),
    building16(heatSources=true, nHeatSources=1),
    building17(heatSources=true, nHeatSources=1),
    building21(heatSources=true, nHeatSources=1),
    building23(heatSources=true, nHeatSources=1),
    building25(heatSources=true, nHeatSources=1),
    building27(heatSources=true, nHeatSources=1),
    building29(heatSources=true, nHeatSources=1),
    building30(heatSources=true, nHeatSources=1),
    building33(heatSources=true, nHeatSources=1),
    building34(heatSources=true, nHeatSources=1),
    building35(heatSources=true, nHeatSources=1),
    building39(heatSources=true, nHeatSources=1),
    building40(heatSources=true, nHeatSources=1),
    building43(heatSources=true, nHeatSources=1),
    building44(heatSources=true, nHeatSources=1),
    building45(heatSources=true, nHeatSources=1),
    building46(heatSources=true, nHeatSources=1),
    building47(heatSources=true, nHeatSources=1),
    building48(heatSources=true, nHeatSources=1),
    building50(heatSources=true, nHeatSources=1),
    building51(heatSources=true, nHeatSources=1),
    building52(heatSources=true, nHeatSources=1),
    building53(heatSources=true, nHeatSources=1),
    building54(heatSources=true, nHeatSources=1),
    building55(heatSources=true, nHeatSources=1),
    t_set_heating(k=273.15 - 20),
    t_set_heating1(k=273.15 - 20),
    t_set_heating2(k=273.15 - 20),
    t_set_heating3(k=273.15 - 20),
    t_set_heating4(k=273.15 - 20),
    t_set_heating5(k=273.15 - 20),
    t_set_heating6(k=273.15 - 20),
    t_set_heating7(k=273.15 - 20),
    t_set_heating8(k=273.15 - 20),
    t_set_heating9(k=273.15 - 20),
    t_set_heating10(k=273.15 - 20),
    t_set_heating11(k=273.15 - 20),
    t_set_heating12(k=273.15 - 20),
    t_set_heating13(k=273.15 - 20),
    t_set_heating14(k=273.15 - 20),
    t_set_heating15(k=273.15 - 20),
    t_set_heating16(k=273.15 - 20),
    t_set_heating17(k=273.15 - 20),
    t_set_heating18(k=273.15 - 20),
    t_set_heating19(k=273.15 - 20),
    t_set_heating20(k=273.15 - 20),
    t_set_heating21(k=273.15 - 20),
    t_set_heating22(k=273.15 - 20),
    t_set_heating23(k=273.15 - 20),
    t_set_heating24(k=273.15 - 20),
    t_set_heating25(k=273.15 - 20),
    t_set_heating26(k=273.15 - 20),
    t_set_heating27(k=273.15 - 20),
    t_set_heating28(k=273.15 - 20),
    t_set_heating29(k=273.15 - 20),
    t_set_heating30(k=273.15 - 20),
    t_set_heating31(k=273.15 - 20),
    t_set_heating32(k=273.15 - 20),
    t_set_heating33(k=273.15 - 20),
    t_set_heating34(k=273.15 - 20),
    t_set_heating35(k=273.15 - 20),
    t_set_heating36(k=273.15 - 20),
    t_set_heating37(k=273.15 - 20));
  extends BuildingSystems.Technologies.DistrictHeatingNetworks.BaseClasses.DHN_Detailed(
    st13(m_flow_nominal=st13.m_flow_nominalHeating, Q_nominal=parameterMap34.Q_flowHea),
    st7(m_flow_nominal=st7.m_flow_nominalHeating,Q_nominal=parameterMap7.Q_flowHea),
    st29(m_flow_nominal=st29.m_flow_nominalHeating,Q_nominal=parameterMap29.Q_flowHea),
    st52(m_flow_nominal=st52.m_flow_nominalHeating,Q_nominal=parameterMap52.Q_flowHea),
    st39(m_flow_nominal=st39.m_flow_nominalHeating,Q_nominal=parameterMap39.Q_flowHea),
    st51(m_flow_nominal=st51.m_flow_nominalHeating,Q_nominal=parameterMap51.Q_flowHea),
    st48(m_flow_nominal=st48.m_flow_nominalHeating,Q_nominal=parameterMap48.Q_flowHea),
    st23(m_flow_nominal=st23.m_flow_nominalHeating,Q_nominal=parameterMap23.Q_flowHea),
    st45(m_flow_nominal=st45.m_flow_nominalHeating,Q_nominal=parameterMap45.Q_flowHea),
    st44(m_flow_nominal=st44.m_flow_nominalHeating,Q_nominal=parameterMap44.Q_flowHea),
    st54(m_flow_nominal=st54.m_flow_nominalHeating,Q_nominal=parameterMap54.Q_flowHea),
    st53(m_flow_nominal=st53.m_flow_nominalHeating,Q_nominal=parameterMap53.Q_flowHea),
    st50(m_flow_nominal=st50.m_flow_nominalHeating,Q_nominal=parameterMap50.Q_flowHea),
    st30(m_flow_nominal=st30.m_flow_nominalHeating,Q_nominal=parameterMap30.Q_flowHea),
    st46(m_flow_nominal=st46.m_flow_nominalHeating,Q_nominal=parameterMap46.Q_flowHea),
    st6(m_flow_nominal=st6.m_flow_nominalHeating,Q_nominal=parameterMap6.Q_flowHea),
    st2(m_flow_nominal=st2.m_flow_nominalHeating,Q_nominal=parameterMap2.Q_flowHea),
    st3(m_flow_nominal=st3.m_flow_nominalHeating,Q_nominal=parameterMap3.Q_flowHea),
    st9(m_flow_nominal=st9.m_flow_nominalHeating,Q_nominal=parameterMap9.Q_flowHea),
    st55(m_flow_nominal=st55.m_flow_nominalHeating,Q_nominal=parameterMap55.Q_flowHea),
    st35(m_flow_nominal=st35.m_flow_nominalHeating,Q_nominal=parameterMap35.Q_flowHea),
    st1(m_flow_nominal=st1.m_flow_nominalHeating,Q_nominal=parameterMap1.Q_flowHea),
    st40(m_flow_nominal=st40.m_flow_nominalHeating,Q_nominal=parameterMap40.Q_flowHea),
    st43(m_flow_nominal=st43.m_flow_nominalHeating,Q_nominal=parameterMap43.Q_flowHea),
    st47(m_flow_nominal=st47.m_flow_nominalHeating,Q_nominal=parameterMap47.Q_flowHea),
    st27(m_flow_nominal=st27.m_flow_nominalHeating,Q_nominal=parameterMap27.Q_flowHea),
    st10(m_flow_nominal=st10.m_flow_nominalHeating,Q_nominal=parameterMap10.Q_flowHea),
    st34(m_flow_nominal=st34.m_flow_nominalHeating,Q_nominal=parameterMap34.Q_flowHea),
    st25(m_flow_nominal=st25.m_flow_nominalHeating,Q_nominal=parameterMap25.Q_flowHea),
    st11(m_flow_nominal=st11.m_flow_nominalHeating,Q_nominal=parameterMap11.Q_flowHea),
    st33(m_flow_nominal=st33.m_flow_nominalHeating,Q_nominal=parameterMap33.Q_flowHea),
    st21(m_flow_nominal=st21.m_flow_nominalHeating,Q_nominal=parameterMap21.Q_flowHea),
    st16(m_flow_nominal=st16.m_flow_nominalHeating,Q_nominal=parameterMap16.Q_flowHea),
    st12(m_flow_nominal=st12.m_flow_nominalHeating,Q_nominal=parameterMap12.Q_flowHea),
    st17(m_flow_nominal=st17.m_flow_nominalHeating,Q_nominal=parameterMap17.Q_flowHea),
    st5(m_flow_nominal=st5.m_flow_nominalHeating,Q_nominal=parameterMap5.Q_flowHea),
    st14(m_flow_nominal=st14.m_flow_nominalHeating,Q_nominal=parameterMap14.Q_flowHea),
    st8(m_flow_nominal=st8.m_flow_nominalHeating,Q_nominal=parameterMap8.Q_flowHea));
  Modelica.SIunits.Heat Q_buildings(displayUnit="kWh")
    "Heat extracted from the DHN and delivered to the buildings";
  Modelica.SIunits.Heat Q_buildings_effective(displayUnit="kWh")
    "Effective heat that warm up the building (Q_buildings*efficiency)";
  BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyProductionUnits.Central central(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    mProduction_flow_nominal=1000,
    mDHN_flow_nominal=1000,
    dpProduction_nominal=0,
    dpDHN_nominal=0,
    eps=1,
    allowFlowReversal=false,
    T=368.15)
    annotation (Placement(transformation(extent={{230,-110},{210,-90}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=10,
    p_start=600000,
    p=400000)
    annotation (Placement(transformation(extent={{200,-82},{220,-62}})));
equation
  der(Q_buildings) =
     st1.externalIdealHeater.gain1.u
   + st2.externalIdealHeater.gain1.u
   + st3.externalIdealHeater.gain1.u
   + st5.externalIdealHeater.gain1.u
   + st6.externalIdealHeater.gain1.u
   + st7.externalIdealHeater.gain1.u
   + st8.externalIdealHeater.gain1.u
   + st9.externalIdealHeater.gain1.u
   + st10.externalIdealHeater.gain1.u
   + st11.externalIdealHeater.gain1.u
   + st12.externalIdealHeater.gain1.u
   + st13.externalIdealHeater.gain1.u
   + st14.externalIdealHeater.gain1.u
   + st16.externalIdealHeater.gain1.u
   + st17.externalIdealHeater.gain1.u
   + st21.externalIdealHeater.gain1.u
   + st23.externalIdealHeater.gain1.u
   + st25.externalIdealHeater.gain1.u
   + st27.externalIdealHeater.gain1.u
   + st29.externalIdealHeater.gain1.u
   + st30.externalIdealHeater.gain1.u
   + st33.externalIdealHeater.gain1.u
   + st34.externalIdealHeater.gain1.u
   + st35.externalIdealHeater.gain1.u
   + st39.externalIdealHeater.gain1.u
   + st40.externalIdealHeater.gain1.u
   + st43.externalIdealHeater.gain1.u
   + st44.externalIdealHeater.gain1.u
   + st45.externalIdealHeater.gain1.u
   + st46.externalIdealHeater.gain1.u
   + st47.externalIdealHeater.gain1.u
   + st48.externalIdealHeater.gain1.u
   + st50.externalIdealHeater.gain1.u
   + st51.externalIdealHeater.gain1.u
   + st53.externalIdealHeater.gain1.u
   + st54.externalIdealHeater.gain1.u
   + st55.externalIdealHeater.gain1.u;
  der(Q_buildings_effective) =
     st1.externalIdealHeater.gain1.y
   + st2.externalIdealHeater.gain1.y
   + st3.externalIdealHeater.gain1.y
   + st5.externalIdealHeater.gain1.y
   + st6.externalIdealHeater.gain1.y
   + st7.externalIdealHeater.gain1.y
   + st8.externalIdealHeater.gain1.y
   + st9.externalIdealHeater.gain1.y
   + st10.externalIdealHeater.gain1.y
   + st11.externalIdealHeater.gain1.y
   + st12.externalIdealHeater.gain1.y
   + st13.externalIdealHeater.gain1.y
   + st14.externalIdealHeater.gain1.y
   + st16.externalIdealHeater.gain1.y
   + st17.externalIdealHeater.gain1.y
   + st21.externalIdealHeater.gain1.y
   + st23.externalIdealHeater.gain1.y
   + st25.externalIdealHeater.gain1.y
   + st27.externalIdealHeater.gain1.y
   + st29.externalIdealHeater.gain1.y
   + st30.externalIdealHeater.gain1.y
   + st33.externalIdealHeater.gain1.y
   + st34.externalIdealHeater.gain1.y
   + st35.externalIdealHeater.gain1.y
   + st39.externalIdealHeater.gain1.y
   + st40.externalIdealHeater.gain1.y
   + st43.externalIdealHeater.gain1.y
   + st44.externalIdealHeater.gain1.y
   + st45.externalIdealHeater.gain1.y
   + st46.externalIdealHeater.gain1.y
   + st47.externalIdealHeater.gain1.y
   + st48.externalIdealHeater.gain1.y
   + st50.externalIdealHeater.gain1.y
   + st51.externalIdealHeater.gain1.y
   + st53.externalIdealHeater.gain1.y
   + st54.externalIdealHeater.gain1.y
   + st55.externalIdealHeater.gain1.y;

  st43.Tset = building43.parameterMap.TSetHea;
  connect(st43.zoneTAir, building43.zone.TAir);
  connect(st43.ambientTAirRef, ambient.TAirRef);
  connect(st43.Radheat, building43.radHeatSourcesPorts[1]);
  connect(st43.Conheat, building43.conHeatSourcesPorts[1]);

  st35.Tset = building35.parameterMap.TSetHea;
  connect(st35.zoneTAir, building35.zone.TAir);
  connect(st35.ambientTAirRef, ambient.TAirRef);
  connect(st35.Radheat, building35.radHeatSourcesPorts[1]);
  connect(st35.Conheat, building35.conHeatSourcesPorts[1]);

  st47.Tset = building47.parameterMap.TSetHea;
  connect(st47.zoneTAir, building47.zone.TAir);
  connect(st47.ambientTAirRef, ambient.TAirRef);
  connect(st47.Radheat, building47.radHeatSourcesPorts[1]);
  connect(st47.Conheat, building47.conHeatSourcesPorts[1]);

  st55.Tset = building55.parameterMap.TSetHea;
  connect(st55.zoneTAir, building55.zone.TAir);
  connect(st55.ambientTAirRef, ambient.TAirRef);
  connect(st55.Radheat, building55.radHeatSourcesPorts[1]);
  connect(st55.Conheat, building55.conHeatSourcesPorts[1]);

  st12.Tset = building12.parameterMap.TSetHea;
  connect(st12.zoneTAir, building12.zone.TAir);
  connect(st12.ambientTAirRef, ambient.TAirRef);
  connect(st12.Radheat, building12.radHeatSourcesPorts[1]);
  connect(st12.Conheat, building12.conHeatSourcesPorts[1]);

  st16.Tset = building16.parameterMap.TSetHea;
  connect(st16.zoneTAir, building16.zone.TAir);
  connect(st16.ambientTAirRef, ambient.TAirRef);
  connect(st16.Radheat, building16.radHeatSourcesPorts[1]);
  connect(st16.Conheat, building16.conHeatSourcesPorts[1]);

  st17.Tset = building17.parameterMap.TSetHea;
  connect(st17.zoneTAir, building17.zone.TAir);
  connect(st17.ambientTAirRef, ambient.TAirRef);
  connect(st17.Radheat, building17.radHeatSourcesPorts[1]);
  connect(st17.Conheat, building17.conHeatSourcesPorts[1]);

  st14.Tset = building14.parameterMap.TSetHea;
  connect(st14.zoneTAir, building14.zone.TAir);
  connect(st14.ambientTAirRef, ambient.TAirRef);
  connect(st14.Radheat, building14.radHeatSourcesPorts[1]);
  connect(st14.Conheat, building14.conHeatSourcesPorts[1]);

  st21.Tset = building21.parameterMap.TSetHea;
  connect(st21.zoneTAir, building21.zone.TAir);
  connect(st21.ambientTAirRef, ambient.TAirRef);
  connect(st21.Radheat, building21.radHeatSourcesPorts[1]);
  connect(st21.Conheat, building21.conHeatSourcesPorts[1]);

  st1.Tset = building1.parameterMap.TSetHea;
  connect(st1.zoneTAir, building1.zone.TAir);
  connect(st1.ambientTAirRef, ambient.TAirRef);
  connect(st1.Radheat, building1.radHeatSourcesPorts[1]);
  connect(st1.Conheat, building1.conHeatSourcesPorts[1]);

  st25.Tset = building25.parameterMap.TSetHea;
  connect(st25.zoneTAir, building25.zone.TAir);
  connect(st25.ambientTAirRef, ambient.TAirRef);
  connect(st25.Radheat, building25.radHeatSourcesPorts[1]);
  connect(st25.Conheat, building25.conHeatSourcesPorts[1]);

  st27.Tset = building27.parameterMap.TSetHea;
  connect(st27.zoneTAir, building27.zone.TAir);
  connect(st27.ambientTAirRef, ambient.TAirRef);
  connect(st27.Radheat, building27.radHeatSourcesPorts[1]);
  connect(st27.Conheat, building27.conHeatSourcesPorts[1]);

  st33.Tset = building33.parameterMap.TSetHea;
  connect(st33.zoneTAir, building33.zone.TAir);
  connect(st33.ambientTAirRef, ambient.TAirRef);
  connect(st33.Radheat, building33.radHeatSourcesPorts[1]);
  connect(st33.Conheat, building33.conHeatSourcesPorts[1]);

  st34.Tset = building34.parameterMap.TSetHea;
  connect(st34.zoneTAir, building34.zone.TAir);
  connect(st34.ambientTAirRef, ambient.TAirRef);
  connect(st34.Radheat, building34.radHeatSourcesPorts[1]);
  connect(st34.Conheat, building34.conHeatSourcesPorts[1]);

  st40.Tset = building40.parameterMap.TSetHea;
  connect(st40.zoneTAir, building40.zone.TAir);
  connect(st40.ambientTAirRef, ambient.TAirRef);
  connect(st40.Radheat, building40.radHeatSourcesPorts[1]);
  connect(st40.Conheat, building40.conHeatSourcesPorts[1]);

  st11.Tset = building11.parameterMap.TSetHea;
  connect(st11.zoneTAir, building11.zone.TAir);
  connect(st11.ambientTAirRef, ambient.TAirRef);
  connect(st11.Radheat, building11.radHeatSourcesPorts[1]);
  connect(st11.Conheat, building11.conHeatSourcesPorts[1]);

  st5.Tset = building5.parameterMap.TSetHea;
  connect(st5.zoneTAir, building5.zone.TAir);
  connect(st5.ambientTAirRef, ambient.TAirRef);
  connect(st5.Radheat, building5.radHeatSourcesPorts[1]);
  connect(st5.Conheat, building5.conHeatSourcesPorts[1]);

  st8.Tset = building8.parameterMap.TSetHea;
  connect(st8.zoneTAir, building8.zone.TAir);
  connect(st8.ambientTAirRef, ambient.TAirRef);
  connect(st8.Radheat, building8.radHeatSourcesPorts[1]);
  connect(st8.Conheat, building8.conHeatSourcesPorts[1]);

  st10.Tset = building10.parameterMap.TSetHea;
  connect(st10.zoneTAir, building10.zone.TAir);
  connect(st10.ambientTAirRef, ambient.TAirRef);
  connect(st10.Radheat, building10.radHeatSourcesPorts[1]);
  connect(st10.Conheat, building10.conHeatSourcesPorts[1]);

  st44.Tset = building44.parameterMap.TSetHea;
  connect(st44.zoneTAir,building44.zone.TAir);
  connect(st44.ambientTAirRef, ambient.TAirRef);
  connect(st44.Radheat, building44.radHeatSourcesPorts[1]);
  connect(st44.Conheat, building44.conHeatSourcesPorts[1]);

  st45.Tset = building45.parameterMap.TSetHea;
  connect(st45.zoneTAir,building45.zone.TAir);
  connect(st45.ambientTAirRef, ambient.TAirRef);
  connect(st45.Radheat, building45.radHeatSourcesPorts[1]);
  connect(st45.Conheat, building45.conHeatSourcesPorts[1]);

  st46.Tset = building46.parameterMap.TSetHea;
  connect(st46.zoneTAir, building46.zone.TAir);
  connect(st46.ambientTAirRef, ambient.TAirRef);
  connect(st46.Radheat, building46.radHeatSourcesPorts[1]);
  connect(st46.Conheat, building46.conHeatSourcesPorts[1]);

  st53.Tset = building53.parameterMap.TSetHea;
  connect(st53.zoneTAir, building53.zone.TAir);
  connect(st53.ambientTAirRef, ambient.TAirRef);
  connect(st53.Radheat, building53.radHeatSourcesPorts[1]);
  connect(st53.Conheat, building53.conHeatSourcesPorts[1]);

  st3.Tset = building3.parameterMap.TSetHea;
  connect(st3.zoneTAir, building3.zone.TAir);
  connect(st3.ambientTAirRef, ambient.TAirRef);
  connect(st3.Radheat, building3.radHeatSourcesPorts[1]);
  connect(st3.Conheat, building3.conHeatSourcesPorts[1]);

  st50.Tset = building50.parameterMap.TSetHea;
  connect(st50.zoneTAir, building50.zone.TAir);
  connect(st50.ambientTAirRef, ambient.TAirRef);
  connect(st50.Radheat, building50.radHeatSourcesPorts[1]);
  connect(st50.Conheat, building50.conHeatSourcesPorts[1]);

  st30.Tset = building30.parameterMap.TSetHea;
  connect(st30.zoneTAir, building30.zone.TAir);
  connect(st30.ambientTAirRef, ambient.TAirRef);
  connect(st30.Radheat, building30.radHeatSourcesPorts[1]);
  connect(st30.Conheat, building30.conHeatSourcesPorts[1]);

  st54.Tset = building54.parameterMap.TSetHea;
  connect(st54.zoneTAir, building54.zone.TAir);
  connect(st54.ambientTAirRef, ambient.TAirRef);
  connect(st54.Radheat, building54.radHeatSourcesPorts[1]);
  connect(st54.Conheat, building54.conHeatSourcesPorts[1]);

  st6.Tset = building6.parameterMap.TSetHea;
  connect(st6.zoneTAir, building6.zone.TAir);
  connect(st6.ambientTAirRef, ambient.TAirRef);
  connect(st6.Radheat, building6.radHeatSourcesPorts[1]);
  connect(st6.Conheat, building6.conHeatSourcesPorts[1]);

  st2.Tset = building2.parameterMap.TSetHea;
  connect(st2.zoneTAir, building2.zone.TAir);
  connect(st2.ambientTAirRef, ambient.TAirRef);
  connect(st2.Radheat, building2.radHeatSourcesPorts[1]);
  connect(st2.Conheat, building2.conHeatSourcesPorts[1]);

  st9.Tset = building9.parameterMap.TSetHea;
  connect(st9.zoneTAir, building9.zone.TAir);
  connect(st9.ambientTAirRef, ambient.TAirRef);
  connect(st9.Radheat, building9.radHeatSourcesPorts[1]);
  connect(st9.Conheat, building9.conHeatSourcesPorts[1]);

  st48.Tset = building48.parameterMap.TSetHea;
  connect(st48.zoneTAir, building48.zone.TAir);
  connect(st48.ambientTAirRef, ambient.TAirRef);
  connect(st48.Radheat, building48.radHeatSourcesPorts[1]);
  connect(st48.Conheat, building48.conHeatSourcesPorts[1]);

  st23.Tset = building23.parameterMap.TSetHea;
  connect(st23.zoneTAir, building23.zone.TAir);
  connect(st23.ambientTAirRef, ambient.TAirRef);
  connect(st23.Radheat, building23.radHeatSourcesPorts[1]);
  connect(st23.Conheat, building23.conHeatSourcesPorts[1]);

  st39.Tset = building39.parameterMap.TSetHea;
  connect(st39.zoneTAir, building39.zone.TAir);
  connect(st39.ambientTAirRef, ambient.TAirRef);
  connect(st39.Radheat, building39.radHeatSourcesPorts[1]);
  connect(st39.Conheat, building39.conHeatSourcesPorts[1]);

  st13.Tset = building13.parameterMap.TSetHea;
  connect(st13.zoneTAir, building13.zone.TAir);
  connect(st13.ambientTAirRef, ambient.TAirRef);
  connect(st13.Radheat, building13.radHeatSourcesPorts[1]);
  connect(st13.Conheat, building13.conHeatSourcesPorts[1]);

  st52.Tset = building52.parameterMap.TSetHea;
  connect(st52.zoneTAir, building52.zone.TAir);
  connect(st52.ambientTAirRef, ambient.TAirRef);
  connect(st52.Radheat, building52.radHeatSourcesPorts[1]);
  connect(st52.Conheat, building52.conHeatSourcesPorts[1]);

  st51.Tset = building51.parameterMap.TSetHea;
  connect(st51.zoneTAir, building51.zone.TAir);
  connect(st51.ambientTAirRef, ambient.TAirRef);
  connect(st51.Radheat, building51.radHeatSourcesPorts[1]);
  connect(st51.Conheat, building51.conHeatSourcesPorts[1]);

  st29.Tset = building29.parameterMap.TSetHea;
  connect(st29.zoneTAir, building29.zone.TAir);
  connect(st29.ambientTAirRef, ambient.TAirRef);
  connect(st29.Radheat, building29.radHeatSourcesPorts[1]);
  connect(st29.Conheat, building29.conHeatSourcesPorts[1]);

  st7.Tset = building7.parameterMap.TSetHea;
  connect(st7.zoneTAir, building7.zone.TAir);
  connect(st7.ambientTAirRef, ambient.TAirRef);
  connect(st7.Radheat, building7.radHeatSourcesPorts[1]);
  connect(st7.Conheat, building7.conHeatSourcesPorts[1]);

  connect(p1.port_b1, central.port_a) annotation (Line(points={{214.843,
          -136.736},{214.843,-126},{230,-126},{230,-100}},
                                                 color={0,127,255}));
  connect(p8.port_b1, central.port_a) annotation (Line(points={{198.843,
          -117.664},{198.843,-126},{230,-126},{230,-100}},
                                                 color={0,127,255}));
  connect(central.port_b, exp.port_a) annotation (Line(points={{210,-100},{210,-100},
          {210,-88},{210,-82}}, color={0,127,255}));
  connect(p8.port_a2, central.port_b) annotation (Line(points={{203.461,
          -109.666},{210,-109.666},{210,-100}},
                                      color={0,127,255}));
  connect(central.port_b, p1.port_a2)
    annotation (Line(points={{210,-100},{212,-100},{212,-116},{212,-118},
      {216.461,-118},{216.461,-133.934}},color={0,127,255}));

  annotation (__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/DistrictSimulation/HCBC_DHN.mos" "Simulate and plot"),
    experiment(StopTime=86400,__Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
Documentation(info="<html>
<p>
Example that simulates heating and cooling demand of the university campus in Berlin-Charlottenburg (Germany)
interconnected with a district heating network supplied with an ideal source.
</p>
</html>",
revisions="<html>
<ul>
<li>
April 27, 2017, by Carles Ribas Tugores:<br/>
First implementation.
</li>
</ul>
</html>"));
end HCBC_DHN;
