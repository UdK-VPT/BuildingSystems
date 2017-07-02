within BuildingSystems.Technologies.Photovoltaics.Data;
package PhotovoltaicModules
  "Data base with photovoltaic module types"
  record DataSetPhotovoltaicModule
    parameter Real c1(unit = "m2/V")
      "1st coefficient IPho";
    parameter Real c2(unit = "m2/(kV.K)")
      "2nd coefficient IPho";
    parameter Real cs1(unit = "A/K3")
      "1st coefficient ISat1";
    parameter Real cs2(unit = "A/(K5)")
      "2nd coefficient ISat2";
    parameter Real Eg(unit = "eV")
      "Band gap";
    parameter Modelica.SIunits.Length height
      "PV module height";
    parameter Modelica.SIunits.ElectricCurrent Ik0
      "Short circuit current under standard conditions";
    parameter Integer nCelSer
      "Number of serial connected cells within the PV module";
    parameter Integer nCelPar
      "Number of parallel connected cells within the PV module";
    parameter Modelica.SIunits.Power PEl_nominal
      "Module power under standard conditions";
    parameter Modelica.SIunits.Resistance RSer
      "Serial resistance";
    parameter Modelica.SIunits.Resistance RPar
      "Parallel resistance";
    parameter Real tIk0
      "Temperature coefficient for the short circuit current in mA/C";
    parameter Real tUl0
      "Temperature coefficient for the open circuit voltage in V/C";
    parameter Modelica.SIunits.Voltage Ul0
      "Open circuit voltage under standard conditions";
    parameter Modelica.SIunits.Length width
      "Module width";
  end DataSetPhotovoltaicModule;

  /* Parameter SiemensSolar M75S */
  record SiemensSolarM75S = DataSetPhotovoltaicModule(
    PEl_nominal = 75.0,
    // With IU-Values based on two characteristic curves (standard)
    RPar = 76.3444785373,
    RSer = 0.00787755654257,
    c1 = 0.00413324897091,
    c2 = 0.00230107942898,
    cs1 = 0.570403402527,
    cs2 = 0.053547441883,
    /*************************************************/
    nCelSer = 36,
    nCelPar = 1,
    height = 1.2,
    width = 0.527,
    Ik0 = 4.8,
    Ul0 = 22.0,
    tIk0 = 1.92,
    tUl0 = -0.0748,
    Eg = 1.107);

  /* Parameter Siemens Solar SR90 12V */
  record SiemensSolarSR9012V = DataSetPhotovoltaicModule(
    PEl_nominal = 90.0,
    RPar = 12.529373276,
    RSer = 0.0102582274069,
    c1 = 0.00646373172774,
    c2 = 1.29804373925e-05,
    cs1 = 102.36896823,
    cs2 = 0.000918183385567,
    nCelSer = 36,
    nCelPar = 1,
    height = 1.498,
    width = 0.594,
    Ik0 = 6.1,
    Ul0 = 21.6,
    tIk0 = 2.1,
    tUl0 = -0.079,
    Eg = 1.107);

  /* Parameter SNI SR90 6V*/
  record SiemensSolarSR906V = DataSetPhotovoltaicModule(
    PEl_nominal = 90.0,
    RPar = 12.529373276,
    RSer = 0.0102582274069,
    c1 = 0.00646373172774,
    c2 = 1.29804373925e-05,
    cs1 = 102.36896823,
    cs2 = 0.000918183385567,
    nCelSer = 18,
    nCelPar = 2,
    height = 1.498,
    width = 0.594,
    Ik0 = 12.2,
    Ul0 = 10.8,
    tIk0 = 2.1,
    tUl0 = -0.079,
    Eg = 1.107);

  /* Parameter Siemens Solar SR100 12V */
  record SiemensSolarSR10012V = DataSetPhotovoltaicModule(
    PEl_nominal  = 100.0,
    RPar = 12.529373276,
    RSer = 0.0102582274069,
    c1 = 0.00646373172774,
    c2 = 1.29804373925e-05,
    cs1 = 102.36896823,
    cs2 = 0.000918183385567,
    nCelSer = 36,
    nCelPar = 1,
    height = 1.498,
    width = 0.594,
    Ik0 = 6.5,
    Ul0 = 21.6,
    tIk0 = 2.1,
    tUl0 = -0.079,
    Eg = 1.107);

    /* Parameter SNI SR100 6V */
  record SiemensSolarSR1006V = DataSetPhotovoltaicModule(
    PEl_nominal = 100.0,
    RPar = 12.529373276,
    RSer = 0.0102582274069,
    c1 = 0.00646373172774,
    c2 = 1.29804373925e-05,
    cs1 = 102.36896823,
    cs2 = 0.000918183385567,
    nCelSer = 18,
    nCelPar = 2,
    height = 1.498,
    width = 0.594,
    Ik0 = 12.4,
    Ul0 = 10.8,
    tIk0 = 2.1,
    tUl0 = -0.079,
    Eg = 1.107);

  /* Parameter ASE-100-DG-UR poly cristalline */
  record ASE100DGURpolycrystal = DataSetPhotovoltaicModule(
    PEl_nominal  = 90.0,
    RPar = 110.256018001,
    RSer = 0.0231468161337,
    c1 = 0.00263267309454,
    c2 = 0.000237330319915,
    cs1 = 6.57081589827,
    cs2 = 0.00743246186477,
    nCelSer = 72,
    nCelPar = 1,
    height = 1.0,
    width = 0.9,
    Ik0 = 2.82,
    Ul0 = 42.6,
    tIk0 = 1.41,
    tUl0 = -0.14484,
    Eg = 1.107);

  /* Parameter ASE-100-DG-UR mono cristalline */
  record ASE100DGURmonocrystal = DataSetPhotovoltaicModule(
    PEl_nominal = 100.0,
    RPar = 7.96499798497,
    RSer = 0.0163310293784,
    c1 = 0.00312389121543,
    c2 = 9.61871636501e-05,
    cs1 = 13.4759450345,
    cs2 = 0.00724761038658,
    nCelSer = 72,
    nCelPar = 1,
    height = 1.0,
    width = 0.9,
    Ik0 = 3.22,
    Ul0 = 43.2,
    tIk0 = 0.966,
    tUl0 = -0.15984,
    Eg = 1.107);

  /* Parameter ASE-300-DG-FT, 315 Wpeak  */
  record ASE300DGFT315Wp = DataSetPhotovoltaicModule(
    PEl_nominal = 315.0,
    RPar = 40.0379433895,
    RSer = 0.00741247450671,
    c1 = 0.0025324851485,
    c2 = 0.00236165845829,
    cs1 = 100.433102949,
    cs2 = 0.0137853503835,
    nCelSer = 108,
    nCelPar = 2,
    height = 1.892,
    width = 1.283,
    Ik0 = 6.7,
    Ul0 = 64.5,
    tIk0 = 6.7,
    tUl0 = -0.2441,
    Eg = 1.107);

  /* Parameter BP585f */
  record BPSolar585f = DataSetPhotovoltaicModule(
    PEl_nominal = 85.0,
    RPar = 7.85288688794,
    RSer = 0.0137310098788,
    c1 = 0.00504648450033,
    c2 = 0.000152415667759,
    cs1 = 34.4880957621,
    cs2 = 0.00463314157705,
    nCelSer = 36,
    nCelPar = 1,
    height = 1.188,
    width = 0.53,
    Ik0 = 5.0,
    Ul0 = 22.03,
    tIk0 = 1.846,           /*based on 151.29 cm2 */
    tUl0 = -0.0756,          /*based on 36 cells  */
    Eg = 1.107);

  /* Parameter BP275f */
  record BPSolar275f = DataSetPhotovoltaicModule(
    PEl_nominal = 75.0,
    RPar = 4.86398038285,
    RSer = 0.0192997740359,
    c1 = 0.00486931107428,
    c2 = 0.000127149804416,
    cs1 = 32.7794065265,
    cs2 = 0.00432330620903,
    nCelSer = 36,
    nCelPar = 1,
    height = 1.188,
    width = 0.53,
    Ik0 = 4.75,
    Ul0 = 21.4,
    tIk0  = 1.3906,           /*based on 156.25 cm2 each cell */
    tUl0 = -0.0792,
    Eg = 1.107);

  /* Parameter ASE-50-ALF/17 */
  record ASE50ALF17 = DataSetPhotovoltaicModule(
    PEl_nominal = 50.0,
    RPar = 5.36699696703,
    RSer = 0.0222485933971,
    c1 = 0.00321216971761,
    c2 = 0.000202931039357,
    cs1 = 42.520886193,
    cs2 = 0.00267354932314,
    nCelSer = 36,
    nCelPar = 1,
    height = 0.96512,
    width = 0.45212,
    Ik0 = 3.2,
    Ul0 = 20.7,
    tIk0 = 3.0,
    tUl0 = -0.079,
    Eg = 1.107);

  /* Parameter Siemens ST10 */
  record SiemensSolarST10CIS = DataSetPhotovoltaicModule(
    PEl_nominal = 10.0,
    RPar = 9.21908843302,
    RSer = 0.0309282623867,
    c1 = 0.000613641954555,
    c2 = 0.000139642340029,
    cs1 = 0.113159968903,
    cs2 = 0.000640010305878,
    nCelSer = 40,
    nCelPar= 1,
    height = 0.328,
    width = 0.387,
    Ik0 = 0.61,
    Ul0 = 25.0,
    tIk0 = 0.26,
    tUl0 = -0.1,
    Eg=1.02);

  /* Parameter TSM 230 PC05 */
  record TSM230PC05 = DataSetPhotovoltaicModule(
    PEl_nominal = 230.0,
    RPar = 9.21908843302, // dummy value
    RSer = 0.0309282623867, // dummy value
    c1 = 0.000613641954555, // dummy value
    c2 = 0.000139642340029, // dummy value
    cs1 = 0.113159968903, // dummy value
    cs2 = 0.000640010305878, // dummy value
    nCelSer = 60,
    nCelPar= 1,
    height = 1.650,
    width = 0.992,
    Ik0 = 8.26,
    Ul0 = 37.0,
    tIk0 = 4.13, // 0.0005 * 8.26 * 1000.0
    tUl0 = -0.1295, // -0.0035 * 37.0
    Eg = 1.02); // dummy value

    /* Parameter Solibro SL2 CIGS 110 */
    record SolibroSL2CIGS110 = DataSetPhotovoltaicModule(
      PEl_nominal = 110.0,
      RPar = 482.5,
      RSer = 0.003,
      c1 = 0.001625,
      c2 = 0.00026,
      cs1 = 0.02,
      cs2 = 0.003,
      nCelSer = 150,
      nCelPar= 1,
      height = 1.190,
      width = 0.7895,
      Ik0 = 1.69,
      Ul0 = 93.3,
      tIk0 = 0.012,
      tUl0 = -0.298,
      Eg = 1.1); // guess value
end PhotovoltaicModules;
