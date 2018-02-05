within BuildingSystems.Buildings.Airvolumes;
package Parameter
  "Parameter to calibrate the zonal model"
  // this parameter set:

  final constant Real f_lay = 4.00;
  final constant Real f_loss = 0.016;
  final constant Real f_pv = 125;
  final constant Real f_alp = 2.9;

  // is the result of the optimization process using Aachen model room AMoR
  // (RWTH Aachen, E.ON Energy Research Center),
  // and the Optimisation Tool GenOpt
  // (Lawrence Berkeley National Laboratory),
  //
  // described in
  //
  // Mucha K., Nytsch-Geusen, C., Woelki D., and van Treeck C. (2015): A Zonal Room Model In Combined Simulation With A
  // Physiological Human Response Model To Quantify Indoor Heat stress Risks. Proceedings of the 14th International
  // Conference of the International Building Performance Simulation Association, 7-9 December, Hyderabad, India.
  //
  // and - more detailed - in
  //
  // Mucha, K. (2017): Ein Simulationsansatz zur Bewertung von Hitzestressrisiken in Innenraeumen.
  // Weiterentwicklung eines zonalen Modells in Modelica.
  // Dissertation an der Universitaet der Kuenste Berlin,
  // Fakultaet Gestaltung, Fachgebiet Versorgungsplanung und Versorgungstechnik (VPT).
  //
  //
  // To use the zonal model WITHOUT calibration, the paramater set would be
  // final constant Real f_lay = 1;
  // final constant Real f_loss = 0;
  // final constant Real f_pv = 2;
  // final constant Real f_alp = 1;
end Parameter;
