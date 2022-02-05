within BuildingSystems.Applications.DistrictSimulation;
model DistrictBerlinKreuzberg
  "Model of a district in Berlin Kreuzberg (Dragoner Areal)"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building1(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 8.127566,
    width = 5.318865,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{0.0,0.0},{10.0,10.0}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building2(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 48.020794,
    width = 7.903955,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-29.5740985102,1.04020894598},{-19.5740985102,11.040208946}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building3(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 59.737795,
    width = 7.72248,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{37.6113014669,-13.4981711032},{47.6113014669,-3.49817110319}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building4(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 15.4615,
    width = 3.082223,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{-2.81238776189,-117.102424311},{7.18761223811,-107.102424311}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building5(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 9.488727,
    width = 5.407939,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{36.0852786258,-42.3163415296},{46.0852786258,-32.3163415296}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building6(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 7.128467,
    width = 4.948932,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{0.10287757701,-5.15726636443},{10.102877577,4.84273363557}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building7(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 6.128741,
    width = 4.928133,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{0.22087645717,-10.1198433945},{10.2208764572,-0.119843394496}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building8(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 12.189531,
    width = 4.180195,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{54.7132669262,-70.6115350071},{64.7132669262,-60.6115350071}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building9(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 357.726938,
    width = 12.566759,
    heightSto = 3.0,
    nSto = integer(11.0))
    annotation(Placement(transformation(extent={{73.4869197693,-139.568533658},{83.4869197693,-129.568533658}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building10(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 45.849979,
    width = 7.302377,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{-12.2112590979,-125.548010602},{-2.21125909791,-115.548010602}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building11(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 27.126579,
    width = 13.305984,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{-56.4909540056,-90.7056777338},{-46.4909540056,-80.7056777338}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building12(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 22.832766,
    width = 7.134071,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{-60.2283478082,-108.329191476},{-50.2283478082,-98.3291914761}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building13(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 5.03703,
    width = 3.417862,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{-28.4079002897,-58.5097278198},{-18.4079002897,-48.5097278198}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building14(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 41.802091,
    width = 18.741106,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{66.2730744823,3.80532156397},{76.2730744823,13.805321564}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building15(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 19.045086,
    width = 13.085469,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{-27.1928371126,-129.240541623},{-17.1928371126,-119.240541623}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building16(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 39.268113,
    width = 10.313817,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{-51.9505934875,-121.158607772},{-41.9505934875,-111.158607772}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building17(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 63.104997,
    width = 8.373077,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-44.8831864751,-67.8730973862},{-34.8831864751,-57.8730973862}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building18(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 24.872819,
    width = 18.30597,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{14.940952194,17.3580713486},{24.940952194,27.3580713486}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building19(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 48.611628,
    width = 7.011991,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-42.2573729312,-49.6310768947},{-32.2573729312,-39.6310768947}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building20(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 80.159732,
    width = 7.26925,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{-31.5850828518,-34.0000181366},{-21.5850828518,-24.0000181366}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building21(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 23.290573,
    width = 5.934882,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{96.3533468015,-90.9910335345},{106.353346802,-80.9910335345}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building22(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 6.324745,
    width = 2.922832,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{97.0161963708,-109.098065444},{107.016196371,-99.0980654443}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building23(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 4.338969,
    width = 2.219321,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{12.8773826991,-104.523044473},{22.8773826991,-94.5230444735}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building24(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 69.812826,
    width = 7.149677,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{-30.3977650894,-15.7769166222},{-20.3977650894,-5.77691662218}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building25(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 36.060217,
    width = 19.825585,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{70.3341704863,253.871924456},{80.3341704863,263.871924456}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building26(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 21.795585,
    width = 11.705499,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{22.8505852493,237.18997565},{32.8505852493,247.18997565}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building27(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 110.295036,
    width = 8.919332,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{93.9155529424,269.344622082},{103.915552942,279.344622082}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building28(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 26.244367,
    width = 11.653846,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{100.114528146,335.705273865},{110.114528146,345.705273865}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building29(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 32.525675,
    width = 7.364722,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{30.334073638,82.3065803945},{40.334073638,92.3065803945}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building30(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 6.521233,
    width = 5.028118,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{37.5581431991,239.923566332},{47.5581431991,249.923566332}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building31(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 11.22947,
    width = 5.161718,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{55.9684867067,331.222009125},{65.9684867067,341.222009125}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building32(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 23.8588,
    width = 9.056083,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{112.594207874,176.813442037},{122.594207874,186.813442037}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building33(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 25.285,
    width = 7.790652,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{85.1496337738,186.773158867},{95.1496337738,196.773158867}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building34(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 26.325305,
    width = 12.935582,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{69.5634490333,191.872857035},{79.5634490333,201.872857035}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building35(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 29.436291,
    width = 10.958093,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{32.6623323475,200.835180531},{42.6623323475,210.835180531}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building36(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 51.215952,
    width = 16.622698,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{104.472076878,50.1170743275},{114.472076878,60.1170743275}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building37(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 32.948843,
    width = 11.284479,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{5.85505701881,163.10548163},{15.8550570188,173.10548163}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building38(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 30.828376,
    width = 7.927214,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{42.7337324508,154.481843157},{52.7337324508,164.481843157}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building39(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 17.076003,
    width = 4.908402,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{64.0830474127,148.637812891},{74.0830474127,158.637812891}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building40(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 33.428731,
    width = 7.842713,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{27.2448821035,156.733617265},{37.2448821035,166.733617265}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building41(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 36.419169,
    width = 7.3805,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{89.4614694458,138.605593228},{99.4614694458,148.605593228}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building42(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 69.514553,
    width = 6.922764,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{74.3537350213,139.918108943},{84.3537350213,149.918108943}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building43(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 32.606756,
    width = 7.731738,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{103.968875485,138.047764978},{113.968875485,148.047764978}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building44(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 14.408174,
    width = 11.234106,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{-12.9269370238,103.553797212},{-2.92693702382,113.553797212}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building45(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 15.070853,
    width = 11.388879,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{-16.1768343128,89.2225177949},{-6.17683431279,99.2225177949}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building46(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 20.072764,
    width = 11.317459,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{-20.178369469,72.1256427579},{-10.178369469,82.1256427579}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building47(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 41.819902,
    width = 7.680641,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-16.3124774347,55.0260564629},{-6.31247743469,65.0260564629}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building48(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 72.394525,
    width = 11.606506,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{73.1273312127,334.693764952},{83.1273312127,344.693764952}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building49(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 26.17227,
    width = 10.566272,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{80.8964187847,285.787195236},{90.8964187847,295.787195236}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building50(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 19.727245,
    width = 7.229097,
    heightSto = 3.0,
    nSto = integer(3.0))
    annotation(Placement(transformation(extent={{64.3296543115,233.598344327},{74.3296543115,243.598344327}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building51(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 77.605689,
    width = 8.020132,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{80.8767997923,232.124552221},{90.8767997923,242.124552221}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building52(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 46.269245,
    width = 9.277688,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{106.231405305,297.645067433},{116.231405305,307.645067433}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building53(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 15.347851,
    width = 4.628201,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{60.575513754,132.651753413},{70.575513754,142.651753413}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building54(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 6.368734,
    width = 6.035487,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{60.1476355734,202.473116719},{70.1476355734,212.473116719}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building55(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 26.298749,
    width = 8.187112,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{24.3831255971,249.059429045},{34.3831255971,259.059429045}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building56(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 21.079051,
    width = 5.017895,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{51.8931880531,149.64952456},{61.8931880531,159.64952456}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building57(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 14.88811,
    width = 4.774711,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{50.0274601895,131.562983274},{60.0274601895,141.562983274}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building58(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 39.79786,
    width = 6.960491,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{59.3938209031,288.676457014},{69.3938209031,298.676457014}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building59(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 13.89757,
    width = 6.926939,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{53.0188106711,120.100586095},{63.0188106711,130.100586095}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building60(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 15.502213,
    width = 4.394544,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{44.8696096498,122.466615089},{54.8696096498,132.466615089}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building61(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 40.374452,
    width = 7.417218,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{45.2257367408,253.530703629},{55.2257367408,263.530703629}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building62(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 18.808,
    width = 5.633238,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{34.8532915016,141.503743039},{44.8532915016,151.503743039}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building63(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 28.472326,
    width = 9.739662,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{59.0624982333,217.383854715},{69.0624982333,227.383854715}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building64(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 23.39592,
    width = 6.480716,
    heightSto = 3.0,
    nSto = integer(3.0))
    annotation(Placement(transformation(extent={{33.771983296,37.0982550895},{43.771983296,47.0982550895}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building65(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 61.779806,
    width = 9.00027,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{48.2631065223,41.8745641168},{58.2631065223,51.8745641168}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building66(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 24.586438,
    width = 9.638922,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{12.5075569613,42.5523230219},{22.5075569613,52.5523230219}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building67(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 33.278922,
    width = 7.403745,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{18.5581799018,225.028070974},{28.5581799018,235.028070974}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building68(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 25.137776,
    width = 8.126162,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{-31.7444172635,23.0249775974},{-21.7444172635,33.0249775974}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building69(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 28.222351,
    width = 6.094008,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-7.83440145437,23.4930003211},{2.16559854563,33.4930003211}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building70(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 30.623927,
    width = 14.550478,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{52.8211855003,354.971284617},{62.8211855003,364.971284617}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building71(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 21.235401,
    width = 9.661952,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{44.0326466457,338.789779348},{54.0326466457,348.789779348}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building72(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 38.36951,
    width = 8.31176,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{37.1092891356,300.226999478},{47.1092891356,310.226999478}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building73(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 52.404722,
    width = 8.536088,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{33.0590452558,281.488186278},{43.0590452558,291.488186278}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building74(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 34.832071,
    width = 7.409913,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{28.403864063,263.913548808},{38.403864063,273.913548808}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building75(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 60.03753,
    width = 8.924752,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{123.23545887,227.3393062},{133.23545887,237.3393062}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building76(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 20.249323,
    width = 9.905526,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{70.1282893422,68.9847159833},{80.1282893422,78.9847159833}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building77(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 24.990486,
    width = 14.129609,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{14.2256721085,206.175075359},{24.2256721085,216.175075359}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building78(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 35.369644,
    width = 8.146962,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{-24.6615706679,39.3658905197},{-14.6615706679,49.3658905197}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building79(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 27.180554,
    width = 12.944541,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{77.9608504946,88.7611288847},{87.9608504946,98.7611288847}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building80(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 4.270444,
    width = 2.507626,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{9.79934566072,137.9214302},{19.7993456607,147.9214302}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building81(
    UValFac = 0.695,
    UValRoo = 0.442,
    UValGro = 0.679,
    UValWin = fill(3.645,4),
    fWin = 0.255,
    length = 16.916905,
    width = 8.719582,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{96.8857821706,182.504660965},{106.885782171,192.504660965}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building82(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 34.998911,
    width = 9.117895,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{39.6644111788,226.831202472},{49.6644111788,236.831202472}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building83(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 87.134059,
    width = 11.450224,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{97.8196970042,119.811069342},{107.819697004,129.811069342}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building84(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 14.083994,
    width = 9.486197,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{33.7512366466,55.1806070684},{43.7512366466,65.1806070684}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building85(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 60.898236,
    width = 11.416534,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{46.9155916559,87.6960482635},{56.9155916559,97.6960482635}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building86(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 20.273576,
    width = 6.668721,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{23.712800666,137.94170519},{33.712800666,147.94170519}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building87(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 65.233648,
    width = 7.325414,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{2.70370853413,115.119360521},{12.7037085341,125.119360521}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building88(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 47.431582,
    width = 8.638378,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{42.6261477227,322.033846655},{52.6261477227,332.033846655}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building89(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 19.771618,
    width = 10.15963,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{-1.47938662075,146.304616212},{8.52061337925,156.304616212}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building90(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 42.304323,
    width = 8.199086,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{2.65055530798,132.33735948},{12.650555308,142.33735948}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building91(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 5.796691,
    width = 5.086449,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{45.1568697586,132.857811505},{55.1568697586,142.857811505}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building92(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 34.211922,
    width = 5.522946,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{27.4199713713,70.0324131558},{37.4199713713,80.0324131558}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building93(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 40.125663,
    width = 7.339096,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{95.1322957844,307.69484074},{105.132295784,317.69484074}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building94(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 13.564721,
    width = 3.151018,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{15.0441694469,122.894545115},{25.0441694469,132.894545115}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building95(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 5.788912,
    width = 3.627121,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{14.3240529972,151.994561198},{24.3240529972,161.994561198}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building96(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 28.626537,
    width = 6.433903,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{144.82380743,-187.727826398},{154.82380743,-177.727826398}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building97(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 19.108912,
    width = 11.207311,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{130.508477517,-182.079893786},{140.508477517,-172.079893786}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building98(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 47.540239,
    width = 7.780664,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{180.126241524,-175.823548291},{190.126241524,-165.823548291}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building99(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 188.279674,
    width = 13.242984,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{252.037264728,-34.6304869987},{262.037264728,-24.6304869987}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building100(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 19.711685,
    width = 8.885705,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{157.524307721,-191.395704655},{167.524307721,-181.395704655}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building101(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 5.108576,
    width = 3.520393,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{209.142997355,-121.100792853},{219.142997355,-111.100792853}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building102(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 5.523236,
    width = 3.181881,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{164.109418173,-115.260674724},{174.109418173,-105.260674724}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building103(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 13.225878,
    width = 11.641843,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{200.786242634,-34.9006112972},{210.786242634,-24.9006112972}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building104(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 37.848179,
    width = 20.26998,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{160.599130678,-49.2983193118},{170.599130678,-39.2983193118}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building105(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 269.131062,
    width = 21.743774,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{150.699210568,5.75701833889},{160.699210568,15.7570183389}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building106(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 4.648561,
    width = 1.759525,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{152.265742192,-119.121540508},{162.265742192,-109.121540508}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building107(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 5.553572,
    width = 5.18735,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{136.999624031,-104.814822202},{146.999624031,-94.8148222016}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building108(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 111.742396,
    width = 11.720919,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{125.176640282,-66.7857882371},{135.176640282,-56.7857882371}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building109(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 4.111638,
    width = 2.841327,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{204.708471663,-118.590561722},{214.708471663,-108.590561722}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building110(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 17.20472,
    width = 6.879911,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{191.170993341,-120.99011249},{201.170993341,-110.99011249}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building111(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 27.385748,
    width = 10.978017,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{175.297454155,-196.208522502},{185.297454155,-186.208522502}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building112(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 14.193585,
    width = 5.84083,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{167.07780719,-181.414218409},{177.07780719,-171.414218409}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building113(
    UValFac = 1.828,
    UValRoo = 1.228,
    UValGro = 1.198,
    UValWin = fill(3.104,4),
    fWin = 0.294,
    length = 145.837158,
    width = 12.684747,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{181.886460889,-141.676615903},{191.886460889,-131.676615903}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building114(
    UValFac = 0.695,
    UValRoo = 0.442,
    UValGro = 0.679,
    UValWin = fill(3.645,4),
    fWin = 0.255,
    length = 103.918471,
    width = 15.510836,
    heightSto = 3.0,
    nSto = integer(8.0))
    annotation(Placement(transformation(extent={{264.275458787,163.584108503},{274.275458787,173.584108503}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building115(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 54.419219,
    width = 7.792678,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{131.242540432,277.879017386},{141.242540432,287.879017386}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building116(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 38.061319,
    width = 7.941128,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{134.928888919,317.331814899},{144.928888919,327.331814899}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building117(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 24.924409,
    width = 9.80062,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{158.548358465,197.00709514},{168.548358465,207.00709514}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building118(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 89.021075,
    width = 14.150152,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{140.101909153,91.0822599744},{150.101909153,101.082259974}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building119(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 47.097226,
    width = 11.417533,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{187.918807685,107.96655435},{197.918807685,117.96655435}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building120(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 113.2708,
    width = 7.543321,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{182.406355758,33.8076269971},{192.406355758,43.8076269971}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building121(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 8.91135,
    width = 6.417817,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{185.016268322,158.360397704},{195.016268322,168.360397704}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building122(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 50.28796,
    width = 20.124578,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{212.426908578,53.945810358},{222.426908578,63.945810358}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building123(
    UValFac = 0.695,
    UValRoo = 0.442,
    UValGro = 0.679,
    UValWin = fill(3.645,4),
    fWin = 0.255,
    length = 151.845285,
    width = 8.776504,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{244.395759346,223.758784205},{254.395759346,233.758784205}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building124(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 51.462125,
    width = 6.192691,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{135.314286834,297.001767824},{145.314286834,307.001767824}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building125(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 96.389604,
    width = 7.969001,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{167.787814101,271.052151398},{177.787814101,281.052151398}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building126(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 5.888025,
    width = 3.806898,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{143.259904524,133.267514756},{153.259904524,143.267514756}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building127(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 4.619003,
    width = 2.47655,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{143.607799981,136.623888494},{153.607799981,146.623888494}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building128(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 7.419343,
    width = 3.666864,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{191.595840669,271.430933655},{201.595840669,281.430933655}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building129(
    UValFac = 1.623,
    UValRoo = 1.054,
    UValGro = 0.993,
    UValWin = fill(3.515,4),
    fWin = 0.248,
    length = 48.467068,
    width = 14.786116,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{257.975184846,86.4434901392},{267.975184846,96.4434901392}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building130(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 73.455788,
    width = 10.689127,
    heightSto = 3.0,
    nSto = integer(2.0))
    annotation(Placement(transformation(extent={{237.413950505,79.9515617741},{247.413950505,89.9515617741}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building131(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 24.674899,
    width = 9.755711,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{170.542678823,214.741559349},{180.542678823,224.741559349}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building132(
    UValFac = 1.095,
    UValRoo = 0.63,
    UValGro = 1.396,
    UValWin = fill(3.298,4),
    fWin = 0.296,
    length = 46.111738,
    width = 19.780619,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{195.918294501,177.866820296},{205.918294501,187.866820296}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building133(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 21.955054,
    width = 10.18009,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{134.052813908,171.553651066},{144.052813908,181.553651066}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building134(
    UValFac = 0.695,
    UValRoo = 0.442,
    UValGro = 0.679,
    UValWin = fill(3.645,4),
    fWin = 0.255,
    length = 20.781203,
    width = 9.427953,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{208.135053641,269.691390234},{218.135053641,279.691390234}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building135(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 38.2595,
    width = 6.801335,
    heightSto = 3.0,
    nSto = integer(6.0))
    annotation(Placement(transformation(extent={{124.108439514,136.884194563},{134.108439514,146.884194563}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building136(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 29.118717,
    width = 10.156182,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{183.79494126,234.330058334},{193.79494126,244.330058334}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building137(
    UValFac = 0.695,
    UValRoo = 0.442,
    UValGro = 0.679,
    UValWin = fill(3.645,4),
    fWin = 0.255,
    length = 32.399026,
    width = 9.104441,
    heightSto = 3.0,
    nSto = integer(8.0))
    annotation(Placement(transformation(extent={{212.50605988,287.686005156},{222.50605988,297.686005156}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building138(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 43.727358,
    width = 6.843687,
    heightSto = 3.0,
    nSto = integer(4.0))
    annotation(Placement(transformation(extent={{145.666735918,311.751427242},{155.666735918,321.751427242}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building139(
    UValFac = 0.371,
    UValRoo = 0.269,
    UValGro = 0.4,
    UValWin = fill(1.575,4),
    fWin = 0.21,
    length = 24.289856,
    width = 5.510872,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{172.901797052,260.178361311},{182.901797052,270.178361311}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building140(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 24.81693,
    width = 12.086927,
    heightSto = 3.0,
    nSto = integer(5.0))
    annotation(Placement(transformation(extent={{161.394960744,309.190670343},{171.394960744,319.190670343}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building141(
    UValFac = 1.83,
    UValRoo = 1.23,
    UValGro = 1.2,
    UValWin = fill(3.1,4),
    fWin = 0.294,
    length = 47.631844,
    width = 8.825172,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{116.418641688,326.358977234},{126.418641688,336.358977234}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building142(
    UValFac = 1.503,
    UValRoo = 1.157,
    UValGro = 1.283,
    UValWin = fill(3.5,4),
    fWin = 0.249,
    length = 6.940196,
    width = 3.055742,
    heightSto = 3.0,
    nSto = integer(1.0))
    annotation(Placement(transformation(extent={{226.515498604,149.451230788},{236.515498604,159.451230788}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building143(
    UValFac = 1.25,
    UValRoo = 1.35,
    UValGro = 1.85,
    UValWin = fill(3.5,4),
    fWin = 0.248,
    length = 24.812316,
    width = 9.763661,
    heightSto = 3.0,
    nSto = integer(7.0))
    annotation(Placement(transformation(extent={{197.073662587,253.958799021},{207.073662587,263.958799021}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0DDistrict building144(
    UValFac = 1.85,
    UValRoo = 1.874,
    UValGro = 1.626,
    UValWin = fill(3.298,4),
    fWin = 0.15,
    length = 52.338078,
    width = 8.335935,
    heightSto = 3.0,
    nSto = integer(3.5))
    annotation(Placement(transformation(extent={{189.897014821,293.530775788},{199.897014821,303.530775788}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0);
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0);
  Modelica.Blocks.Sources.Constant airchange(k=0.5);
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces = 720,
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII);
  Modelica.Blocks.Math.MultiSum heatingLoad(nu=144);
  Modelica.Blocks.Math.MultiSum coolingLoad(nu=144);
equation
  connect(heatingLoad.u[1],building1.Q_flow_heating[1]);
  connect(heatingLoad.u[2],building2.Q_flow_heating[1]);
  connect(heatingLoad.u[3],building3.Q_flow_heating[1]);
  connect(heatingLoad.u[4],building4.Q_flow_heating[1]);
  connect(heatingLoad.u[5],building5.Q_flow_heating[1]);
  connect(heatingLoad.u[6],building6.Q_flow_heating[1]);
  connect(heatingLoad.u[7],building7.Q_flow_heating[1]);
  connect(heatingLoad.u[8],building8.Q_flow_heating[1]);
  connect(heatingLoad.u[9],building9.Q_flow_heating[1]);
  connect(heatingLoad.u[10],building10.Q_flow_heating[1]);
  connect(heatingLoad.u[11],building11.Q_flow_heating[1]);
  connect(heatingLoad.u[12],building12.Q_flow_heating[1]);
  connect(heatingLoad.u[13],building13.Q_flow_heating[1]);
  connect(heatingLoad.u[14],building14.Q_flow_heating[1]);
  connect(heatingLoad.u[15],building15.Q_flow_heating[1]);
  connect(heatingLoad.u[16],building16.Q_flow_heating[1]);
  connect(heatingLoad.u[17],building17.Q_flow_heating[1]);
  connect(heatingLoad.u[18],building18.Q_flow_heating[1]);
  connect(heatingLoad.u[19],building19.Q_flow_heating[1]);
  connect(heatingLoad.u[20],building20.Q_flow_heating[1]);
  connect(heatingLoad.u[21],building21.Q_flow_heating[1]);
  connect(heatingLoad.u[22],building22.Q_flow_heating[1]);
  connect(heatingLoad.u[23],building23.Q_flow_heating[1]);
  connect(heatingLoad.u[24],building24.Q_flow_heating[1]);
  connect(heatingLoad.u[25],building25.Q_flow_heating[1]);
  connect(heatingLoad.u[26],building26.Q_flow_heating[1]);
  connect(heatingLoad.u[27],building27.Q_flow_heating[1]);
  connect(heatingLoad.u[28],building28.Q_flow_heating[1]);
  connect(heatingLoad.u[29],building29.Q_flow_heating[1]);
  connect(heatingLoad.u[30],building30.Q_flow_heating[1]);
  connect(heatingLoad.u[31],building31.Q_flow_heating[1]);
  connect(heatingLoad.u[32],building32.Q_flow_heating[1]);
  connect(heatingLoad.u[33],building33.Q_flow_heating[1]);
  connect(heatingLoad.u[34],building34.Q_flow_heating[1]);
  connect(heatingLoad.u[35],building35.Q_flow_heating[1]);
  connect(heatingLoad.u[36],building36.Q_flow_heating[1]);
  connect(heatingLoad.u[37],building37.Q_flow_heating[1]);
  connect(heatingLoad.u[38],building38.Q_flow_heating[1]);
  connect(heatingLoad.u[39],building39.Q_flow_heating[1]);
  connect(heatingLoad.u[40],building40.Q_flow_heating[1]);
  connect(heatingLoad.u[41],building41.Q_flow_heating[1]);
  connect(heatingLoad.u[42],building42.Q_flow_heating[1]);
  connect(heatingLoad.u[43],building43.Q_flow_heating[1]);
  connect(heatingLoad.u[44],building44.Q_flow_heating[1]);
  connect(heatingLoad.u[45],building45.Q_flow_heating[1]);
  connect(heatingLoad.u[46],building46.Q_flow_heating[1]);
  connect(heatingLoad.u[47],building47.Q_flow_heating[1]);
  connect(heatingLoad.u[48],building48.Q_flow_heating[1]);
  connect(heatingLoad.u[49],building49.Q_flow_heating[1]);
  connect(heatingLoad.u[50],building50.Q_flow_heating[1]);
  connect(heatingLoad.u[51],building51.Q_flow_heating[1]);
  connect(heatingLoad.u[52],building52.Q_flow_heating[1]);
  connect(heatingLoad.u[53],building53.Q_flow_heating[1]);
  connect(heatingLoad.u[54],building54.Q_flow_heating[1]);
  connect(heatingLoad.u[55],building55.Q_flow_heating[1]);
  connect(heatingLoad.u[56],building56.Q_flow_heating[1]);
  connect(heatingLoad.u[57],building57.Q_flow_heating[1]);
  connect(heatingLoad.u[58],building58.Q_flow_heating[1]);
  connect(heatingLoad.u[59],building59.Q_flow_heating[1]);
  connect(heatingLoad.u[60],building60.Q_flow_heating[1]);
  connect(heatingLoad.u[61],building61.Q_flow_heating[1]);
  connect(heatingLoad.u[62],building62.Q_flow_heating[1]);
  connect(heatingLoad.u[63],building63.Q_flow_heating[1]);
  connect(heatingLoad.u[64],building64.Q_flow_heating[1]);
  connect(heatingLoad.u[65],building65.Q_flow_heating[1]);
  connect(heatingLoad.u[66],building66.Q_flow_heating[1]);
  connect(heatingLoad.u[67],building67.Q_flow_heating[1]);
  connect(heatingLoad.u[68],building68.Q_flow_heating[1]);
  connect(heatingLoad.u[69],building69.Q_flow_heating[1]);
  connect(heatingLoad.u[70],building70.Q_flow_heating[1]);
  connect(heatingLoad.u[71],building71.Q_flow_heating[1]);
  connect(heatingLoad.u[72],building72.Q_flow_heating[1]);
  connect(heatingLoad.u[73],building73.Q_flow_heating[1]);
  connect(heatingLoad.u[74],building74.Q_flow_heating[1]);
  connect(heatingLoad.u[75],building75.Q_flow_heating[1]);
  connect(heatingLoad.u[76],building76.Q_flow_heating[1]);
  connect(heatingLoad.u[77],building77.Q_flow_heating[1]);
  connect(heatingLoad.u[78],building78.Q_flow_heating[1]);
  connect(heatingLoad.u[79],building79.Q_flow_heating[1]);
  connect(heatingLoad.u[80],building80.Q_flow_heating[1]);
  connect(heatingLoad.u[81],building81.Q_flow_heating[1]);
  connect(heatingLoad.u[82],building82.Q_flow_heating[1]);
  connect(heatingLoad.u[83],building83.Q_flow_heating[1]);
  connect(heatingLoad.u[84],building84.Q_flow_heating[1]);
  connect(heatingLoad.u[85],building85.Q_flow_heating[1]);
  connect(heatingLoad.u[86],building86.Q_flow_heating[1]);
  connect(heatingLoad.u[87],building87.Q_flow_heating[1]);
  connect(heatingLoad.u[88],building88.Q_flow_heating[1]);
  connect(heatingLoad.u[89],building89.Q_flow_heating[1]);
  connect(heatingLoad.u[90],building90.Q_flow_heating[1]);
  connect(heatingLoad.u[91],building91.Q_flow_heating[1]);
  connect(heatingLoad.u[92],building92.Q_flow_heating[1]);
  connect(heatingLoad.u[93],building93.Q_flow_heating[1]);
  connect(heatingLoad.u[94],building94.Q_flow_heating[1]);
  connect(heatingLoad.u[95],building95.Q_flow_heating[1]);
  connect(heatingLoad.u[96],building96.Q_flow_heating[1]);
  connect(heatingLoad.u[97],building97.Q_flow_heating[1]);
  connect(heatingLoad.u[98],building98.Q_flow_heating[1]);
  connect(heatingLoad.u[99],building99.Q_flow_heating[1]);
  connect(heatingLoad.u[100],building100.Q_flow_heating[1]);
  connect(heatingLoad.u[101],building101.Q_flow_heating[1]);
  connect(heatingLoad.u[102],building102.Q_flow_heating[1]);
  connect(heatingLoad.u[103],building103.Q_flow_heating[1]);
  connect(heatingLoad.u[104],building104.Q_flow_heating[1]);
  connect(heatingLoad.u[105],building105.Q_flow_heating[1]);
  connect(heatingLoad.u[106],building106.Q_flow_heating[1]);
  connect(heatingLoad.u[107],building107.Q_flow_heating[1]);
  connect(heatingLoad.u[108],building108.Q_flow_heating[1]);
  connect(heatingLoad.u[109],building109.Q_flow_heating[1]);
  connect(heatingLoad.u[110],building110.Q_flow_heating[1]);
  connect(heatingLoad.u[111],building111.Q_flow_heating[1]);
  connect(heatingLoad.u[112],building112.Q_flow_heating[1]);
  connect(heatingLoad.u[113],building113.Q_flow_heating[1]);
  connect(heatingLoad.u[114],building114.Q_flow_heating[1]);
  connect(heatingLoad.u[115],building115.Q_flow_heating[1]);
  connect(heatingLoad.u[116],building116.Q_flow_heating[1]);
  connect(heatingLoad.u[117],building117.Q_flow_heating[1]);
  connect(heatingLoad.u[118],building118.Q_flow_heating[1]);
  connect(heatingLoad.u[119],building119.Q_flow_heating[1]);
  connect(heatingLoad.u[120],building120.Q_flow_heating[1]);
  connect(heatingLoad.u[121],building121.Q_flow_heating[1]);
  connect(heatingLoad.u[122],building122.Q_flow_heating[1]);
  connect(heatingLoad.u[123],building123.Q_flow_heating[1]);
  connect(heatingLoad.u[124],building124.Q_flow_heating[1]);
  connect(heatingLoad.u[125],building125.Q_flow_heating[1]);
  connect(heatingLoad.u[126],building126.Q_flow_heating[1]);
  connect(heatingLoad.u[127],building127.Q_flow_heating[1]);
  connect(heatingLoad.u[128],building128.Q_flow_heating[1]);
  connect(heatingLoad.u[129],building129.Q_flow_heating[1]);
  connect(heatingLoad.u[130],building130.Q_flow_heating[1]);
  connect(heatingLoad.u[131],building131.Q_flow_heating[1]);
  connect(heatingLoad.u[132],building132.Q_flow_heating[1]);
  connect(heatingLoad.u[133],building133.Q_flow_heating[1]);
  connect(heatingLoad.u[134],building134.Q_flow_heating[1]);
  connect(heatingLoad.u[135],building135.Q_flow_heating[1]);
  connect(heatingLoad.u[136],building136.Q_flow_heating[1]);
  connect(heatingLoad.u[137],building137.Q_flow_heating[1]);
  connect(heatingLoad.u[138],building138.Q_flow_heating[1]);
  connect(heatingLoad.u[139],building139.Q_flow_heating[1]);
  connect(heatingLoad.u[140],building140.Q_flow_heating[1]);
  connect(heatingLoad.u[141],building141.Q_flow_heating[1]);
  connect(heatingLoad.u[142],building142.Q_flow_heating[1]);
  connect(heatingLoad.u[143],building143.Q_flow_heating[1]);
  connect(heatingLoad.u[144],building144.Q_flow_heating[1]);

  connect(coolingLoad.u[1],building1.Q_flow_cooling[1]);
  connect(coolingLoad.u[2],building2.Q_flow_cooling[1]);
  connect(coolingLoad.u[3],building3.Q_flow_cooling[1]);
  connect(coolingLoad.u[4],building4.Q_flow_cooling[1]);
  connect(coolingLoad.u[5],building5.Q_flow_cooling[1]);
  connect(coolingLoad.u[6],building6.Q_flow_cooling[1]);
  connect(coolingLoad.u[7],building7.Q_flow_cooling[1]);
  connect(coolingLoad.u[8],building8.Q_flow_cooling[1]);
  connect(coolingLoad.u[9],building9.Q_flow_cooling[1]);
  connect(coolingLoad.u[10],building10.Q_flow_cooling[1]);
  connect(coolingLoad.u[11],building11.Q_flow_cooling[1]);
  connect(coolingLoad.u[12],building12.Q_flow_cooling[1]);
  connect(coolingLoad.u[13],building13.Q_flow_cooling[1]);
  connect(coolingLoad.u[14],building14.Q_flow_cooling[1]);
  connect(coolingLoad.u[15],building15.Q_flow_cooling[1]);
  connect(coolingLoad.u[16],building16.Q_flow_cooling[1]);
  connect(coolingLoad.u[17],building17.Q_flow_cooling[1]);
  connect(coolingLoad.u[18],building18.Q_flow_cooling[1]);
  connect(coolingLoad.u[19],building19.Q_flow_cooling[1]);
  connect(coolingLoad.u[20],building20.Q_flow_cooling[1]);
  connect(coolingLoad.u[21],building21.Q_flow_cooling[1]);
  connect(coolingLoad.u[22],building22.Q_flow_cooling[1]);
  connect(coolingLoad.u[23],building23.Q_flow_cooling[1]);
  connect(coolingLoad.u[24],building24.Q_flow_cooling[1]);
  connect(coolingLoad.u[25],building25.Q_flow_cooling[1]);
  connect(coolingLoad.u[26],building26.Q_flow_cooling[1]);
  connect(coolingLoad.u[27],building27.Q_flow_cooling[1]);
  connect(coolingLoad.u[28],building28.Q_flow_cooling[1]);
  connect(coolingLoad.u[29],building29.Q_flow_cooling[1]);
  connect(coolingLoad.u[30],building30.Q_flow_cooling[1]);
  connect(coolingLoad.u[31],building31.Q_flow_cooling[1]);
  connect(coolingLoad.u[32],building32.Q_flow_cooling[1]);
  connect(coolingLoad.u[33],building33.Q_flow_cooling[1]);
  connect(coolingLoad.u[34],building34.Q_flow_cooling[1]);
  connect(coolingLoad.u[35],building35.Q_flow_cooling[1]);
  connect(coolingLoad.u[36],building36.Q_flow_cooling[1]);
  connect(coolingLoad.u[37],building37.Q_flow_cooling[1]);
  connect(coolingLoad.u[38],building38.Q_flow_cooling[1]);
  connect(coolingLoad.u[39],building39.Q_flow_cooling[1]);
  connect(coolingLoad.u[40],building40.Q_flow_cooling[1]);
  connect(coolingLoad.u[41],building41.Q_flow_cooling[1]);
  connect(coolingLoad.u[42],building42.Q_flow_cooling[1]);
  connect(coolingLoad.u[43],building43.Q_flow_cooling[1]);
  connect(coolingLoad.u[44],building44.Q_flow_cooling[1]);
  connect(coolingLoad.u[45],building45.Q_flow_cooling[1]);
  connect(coolingLoad.u[46],building46.Q_flow_cooling[1]);
  connect(coolingLoad.u[47],building47.Q_flow_cooling[1]);
  connect(coolingLoad.u[48],building48.Q_flow_cooling[1]);
  connect(coolingLoad.u[49],building49.Q_flow_cooling[1]);
  connect(coolingLoad.u[50],building50.Q_flow_cooling[1]);
  connect(coolingLoad.u[51],building51.Q_flow_cooling[1]);
  connect(coolingLoad.u[52],building52.Q_flow_cooling[1]);
  connect(coolingLoad.u[53],building53.Q_flow_cooling[1]);
  connect(coolingLoad.u[54],building54.Q_flow_cooling[1]);
  connect(coolingLoad.u[55],building55.Q_flow_cooling[1]);
  connect(coolingLoad.u[56],building56.Q_flow_cooling[1]);
  connect(coolingLoad.u[57],building57.Q_flow_cooling[1]);
  connect(coolingLoad.u[58],building58.Q_flow_cooling[1]);
  connect(coolingLoad.u[59],building59.Q_flow_cooling[1]);
  connect(coolingLoad.u[60],building60.Q_flow_cooling[1]);
  connect(coolingLoad.u[61],building61.Q_flow_cooling[1]);
  connect(coolingLoad.u[62],building62.Q_flow_cooling[1]);
  connect(coolingLoad.u[63],building63.Q_flow_cooling[1]);
  connect(coolingLoad.u[64],building64.Q_flow_cooling[1]);
  connect(coolingLoad.u[65],building65.Q_flow_cooling[1]);
  connect(coolingLoad.u[66],building66.Q_flow_cooling[1]);
  connect(coolingLoad.u[67],building67.Q_flow_cooling[1]);
  connect(coolingLoad.u[68],building68.Q_flow_cooling[1]);
  connect(coolingLoad.u[69],building69.Q_flow_cooling[1]);
  connect(coolingLoad.u[70],building70.Q_flow_cooling[1]);
  connect(coolingLoad.u[71],building71.Q_flow_cooling[1]);
  connect(coolingLoad.u[72],building72.Q_flow_cooling[1]);
  connect(coolingLoad.u[73],building73.Q_flow_cooling[1]);
  connect(coolingLoad.u[74],building74.Q_flow_cooling[1]);
  connect(coolingLoad.u[75],building75.Q_flow_cooling[1]);
  connect(coolingLoad.u[76],building76.Q_flow_cooling[1]);
  connect(coolingLoad.u[77],building77.Q_flow_cooling[1]);
  connect(coolingLoad.u[78],building78.Q_flow_cooling[1]);
  connect(coolingLoad.u[79],building79.Q_flow_cooling[1]);
  connect(coolingLoad.u[80],building80.Q_flow_cooling[1]);
  connect(coolingLoad.u[81],building81.Q_flow_cooling[1]);
  connect(coolingLoad.u[82],building82.Q_flow_cooling[1]);
  connect(coolingLoad.u[83],building83.Q_flow_cooling[1]);
  connect(coolingLoad.u[84],building84.Q_flow_cooling[1]);
  connect(coolingLoad.u[85],building85.Q_flow_cooling[1]);
  connect(coolingLoad.u[86],building86.Q_flow_cooling[1]);
  connect(coolingLoad.u[87],building87.Q_flow_cooling[1]);
  connect(coolingLoad.u[88],building88.Q_flow_cooling[1]);
  connect(coolingLoad.u[89],building89.Q_flow_cooling[1]);
  connect(coolingLoad.u[90],building90.Q_flow_cooling[1]);
  connect(coolingLoad.u[91],building91.Q_flow_cooling[1]);
  connect(coolingLoad.u[92],building92.Q_flow_cooling[1]);
  connect(coolingLoad.u[93],building93.Q_flow_cooling[1]);
  connect(coolingLoad.u[94],building94.Q_flow_cooling[1]);
  connect(coolingLoad.u[95],building95.Q_flow_cooling[1]);
  connect(coolingLoad.u[96],building96.Q_flow_cooling[1]);
  connect(coolingLoad.u[97],building97.Q_flow_cooling[1]);
  connect(coolingLoad.u[98],building98.Q_flow_cooling[1]);
  connect(coolingLoad.u[99],building99.Q_flow_cooling[1]);
  connect(coolingLoad.u[100],building100.Q_flow_cooling[1]);
  connect(coolingLoad.u[101],building101.Q_flow_cooling[1]);
  connect(coolingLoad.u[102],building102.Q_flow_cooling[1]);
  connect(coolingLoad.u[103],building103.Q_flow_cooling[1]);
  connect(coolingLoad.u[104],building104.Q_flow_cooling[1]);
  connect(coolingLoad.u[105],building105.Q_flow_cooling[1]);
  connect(coolingLoad.u[106],building106.Q_flow_cooling[1]);
  connect(coolingLoad.u[107],building107.Q_flow_cooling[1]);
  connect(coolingLoad.u[108],building108.Q_flow_cooling[1]);
  connect(coolingLoad.u[109],building109.Q_flow_cooling[1]);
  connect(coolingLoad.u[110],building110.Q_flow_cooling[1]);
  connect(coolingLoad.u[111],building111.Q_flow_cooling[1]);
  connect(coolingLoad.u[112],building112.Q_flow_cooling[1]);
  connect(coolingLoad.u[113],building113.Q_flow_cooling[1]);
  connect(coolingLoad.u[114],building114.Q_flow_cooling[1]);
  connect(coolingLoad.u[115],building115.Q_flow_cooling[1]);
  connect(coolingLoad.u[116],building116.Q_flow_cooling[1]);
  connect(coolingLoad.u[117],building117.Q_flow_cooling[1]);
  connect(coolingLoad.u[118],building118.Q_flow_cooling[1]);
  connect(coolingLoad.u[119],building119.Q_flow_cooling[1]);
  connect(coolingLoad.u[120],building120.Q_flow_cooling[1]);
  connect(coolingLoad.u[121],building121.Q_flow_cooling[1]);
  connect(coolingLoad.u[122],building122.Q_flow_cooling[1]);
  connect(coolingLoad.u[123],building123.Q_flow_cooling[1]);
  connect(coolingLoad.u[124],building124.Q_flow_cooling[1]);
  connect(coolingLoad.u[125],building125.Q_flow_cooling[1]);
  connect(coolingLoad.u[126],building126.Q_flow_cooling[1]);
  connect(coolingLoad.u[127],building127.Q_flow_cooling[1]);
  connect(coolingLoad.u[128],building128.Q_flow_cooling[1]);
  connect(coolingLoad.u[129],building129.Q_flow_cooling[1]);
  connect(coolingLoad.u[130],building130.Q_flow_cooling[1]);
  connect(coolingLoad.u[131],building131.Q_flow_cooling[1]);
  connect(coolingLoad.u[132],building132.Q_flow_cooling[1]);
  connect(coolingLoad.u[133],building133.Q_flow_cooling[1]);
  connect(coolingLoad.u[134],building134.Q_flow_cooling[1]);
  connect(coolingLoad.u[135],building135.Q_flow_cooling[1]);
  connect(coolingLoad.u[136],building136.Q_flow_cooling[1]);
  connect(coolingLoad.u[137],building137.Q_flow_cooling[1]);
  connect(coolingLoad.u[138],building138.Q_flow_cooling[1]);
  connect(coolingLoad.u[139],building139.Q_flow_cooling[1]);
  connect(coolingLoad.u[140],building140.Q_flow_cooling[1]);
  connect(coolingLoad.u[141],building141.Q_flow_cooling[1]);
  connect(coolingLoad.u[142],building142.Q_flow_cooling[1]);
  connect(coolingLoad.u[143],building143.Q_flow_cooling[1]);
  connect(coolingLoad.u[144],building144.Q_flow_cooling[1]);

  connect(ambience.toSurfacePorts[1:5], building1.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[1:5], building1.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building1.TAirAmb);
  connect(ambience.xAir, building1.xAirAmb);
  connect(building1.airchange[1], airchange.y);
  connect(building1.T_setHeating[1], TSetHeating.y);
  connect(building1.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[6:10], building2.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[6:10], building2.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building2.TAirAmb);
  connect(ambience.xAir, building2.xAirAmb);
  connect(building2.airchange[1], airchange.y);
  connect(building2.T_setHeating[1], TSetHeating.y);
  connect(building2.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[11:15], building3.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[11:15], building3.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building3.TAirAmb);
  connect(ambience.xAir, building3.xAirAmb);
  connect(building3.airchange[1], airchange.y);
  connect(building3.T_setHeating[1], TSetHeating.y);
  connect(building3.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[16:20], building4.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[16:20], building4.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building4.TAirAmb);
  connect(ambience.xAir, building4.xAirAmb);
  connect(building4.airchange[1], airchange.y);
  connect(building4.T_setHeating[1], TSetHeating.y);
  connect(building4.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[21:25], building5.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[21:25], building5.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building5.TAirAmb);
  connect(ambience.xAir, building5.xAirAmb);
  connect(building5.airchange[1], airchange.y);
  connect(building5.T_setHeating[1], TSetHeating.y);
  connect(building5.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[26:30], building6.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[26:30], building6.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building6.TAirAmb);
  connect(ambience.xAir, building6.xAirAmb);
  connect(building6.airchange[1], airchange.y);
  connect(building6.T_setHeating[1], TSetHeating.y);
  connect(building6.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[31:35], building7.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[31:35], building7.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building7.TAirAmb);
  connect(ambience.xAir, building7.xAirAmb);
  connect(building7.airchange[1], airchange.y);
  connect(building7.T_setHeating[1], TSetHeating.y);
  connect(building7.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[36:40], building8.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[36:40], building8.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building8.TAirAmb);
  connect(ambience.xAir, building8.xAirAmb);
  connect(building8.airchange[1], airchange.y);
  connect(building8.T_setHeating[1], TSetHeating.y);
  connect(building8.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[41:45], building9.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[41:45], building9.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building9.TAirAmb);
  connect(ambience.xAir, building9.xAirAmb);
  connect(building9.airchange[1], airchange.y);
  connect(building9.T_setHeating[1], TSetHeating.y);
  connect(building9.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[46:50], building10.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[46:50], building10.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building10.TAirAmb);
  connect(ambience.xAir, building10.xAirAmb);
  connect(building10.airchange[1], airchange.y);
  connect(building10.T_setHeating[1], TSetHeating.y);
  connect(building10.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[51:55], building11.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[51:55], building11.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building11.TAirAmb);
  connect(ambience.xAir, building11.xAirAmb);
  connect(building11.airchange[1], airchange.y);
  connect(building11.T_setHeating[1], TSetHeating.y);
  connect(building11.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[56:60], building12.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[56:60], building12.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building12.TAirAmb);
  connect(ambience.xAir, building12.xAirAmb);
  connect(building12.airchange[1], airchange.y);
  connect(building12.T_setHeating[1], TSetHeating.y);
  connect(building12.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[61:65], building13.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[61:65], building13.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building13.TAirAmb);
  connect(ambience.xAir, building13.xAirAmb);
  connect(building13.airchange[1], airchange.y);
  connect(building13.T_setHeating[1], TSetHeating.y);
  connect(building13.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[66:70], building14.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[66:70], building14.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building14.TAirAmb);
  connect(ambience.xAir, building14.xAirAmb);
  connect(building14.airchange[1], airchange.y);
  connect(building14.T_setHeating[1], TSetHeating.y);
  connect(building14.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[71:75], building15.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[71:75], building15.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building15.TAirAmb);
  connect(ambience.xAir, building15.xAirAmb);
  connect(building15.airchange[1], airchange.y);
  connect(building15.T_setHeating[1], TSetHeating.y);
  connect(building15.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[76:80], building16.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[76:80], building16.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building16.TAirAmb);
  connect(ambience.xAir, building16.xAirAmb);
  connect(building16.airchange[1], airchange.y);
  connect(building16.T_setHeating[1], TSetHeating.y);
  connect(building16.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[81:85], building17.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[81:85], building17.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building17.TAirAmb);
  connect(ambience.xAir, building17.xAirAmb);
  connect(building17.airchange[1], airchange.y);
  connect(building17.T_setHeating[1], TSetHeating.y);
  connect(building17.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[86:90], building18.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[86:90], building18.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building18.TAirAmb);
  connect(ambience.xAir, building18.xAirAmb);
  connect(building18.airchange[1], airchange.y);
  connect(building18.T_setHeating[1], TSetHeating.y);
  connect(building18.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[91:95], building19.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[91:95], building19.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building19.TAirAmb);
  connect(ambience.xAir, building19.xAirAmb);
  connect(building19.airchange[1], airchange.y);
  connect(building19.T_setHeating[1], TSetHeating.y);
  connect(building19.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[96:100], building20.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[96:100], building20.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building20.TAirAmb);
  connect(ambience.xAir, building20.xAirAmb);
  connect(building20.airchange[1], airchange.y);
  connect(building20.T_setHeating[1], TSetHeating.y);
  connect(building20.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[101:105], building21.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[101:105], building21.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building21.TAirAmb);
  connect(ambience.xAir, building21.xAirAmb);
  connect(building21.airchange[1], airchange.y);
  connect(building21.T_setHeating[1], TSetHeating.y);
  connect(building21.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[106:110], building22.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[106:110], building22.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building22.TAirAmb);
  connect(ambience.xAir, building22.xAirAmb);
  connect(building22.airchange[1], airchange.y);
  connect(building22.T_setHeating[1], TSetHeating.y);
  connect(building22.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[111:115], building23.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[111:115], building23.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building23.TAirAmb);
  connect(ambience.xAir, building23.xAirAmb);
  connect(building23.airchange[1], airchange.y);
  connect(building23.T_setHeating[1], TSetHeating.y);
  connect(building23.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[116:120], building24.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[116:120], building24.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building24.TAirAmb);
  connect(ambience.xAir, building24.xAirAmb);
  connect(building24.airchange[1], airchange.y);
  connect(building24.T_setHeating[1], TSetHeating.y);
  connect(building24.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[121:125], building25.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[121:125], building25.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building25.TAirAmb);
  connect(ambience.xAir, building25.xAirAmb);
  connect(building25.airchange[1], airchange.y);
  connect(building25.T_setHeating[1], TSetHeating.y);
  connect(building25.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[126:130], building26.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[126:130], building26.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building26.TAirAmb);
  connect(ambience.xAir, building26.xAirAmb);
  connect(building26.airchange[1], airchange.y);
  connect(building26.T_setHeating[1], TSetHeating.y);
  connect(building26.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[131:135], building27.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[131:135], building27.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building27.TAirAmb);
  connect(ambience.xAir, building27.xAirAmb);
  connect(building27.airchange[1], airchange.y);
  connect(building27.T_setHeating[1], TSetHeating.y);
  connect(building27.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[136:140], building28.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[136:140], building28.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building28.TAirAmb);
  connect(ambience.xAir, building28.xAirAmb);
  connect(building28.airchange[1], airchange.y);
  connect(building28.T_setHeating[1], TSetHeating.y);
  connect(building28.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[141:145], building29.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[141:145], building29.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building29.TAirAmb);
  connect(ambience.xAir, building29.xAirAmb);
  connect(building29.airchange[1], airchange.y);
  connect(building29.T_setHeating[1], TSetHeating.y);
  connect(building29.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[146:150], building30.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[146:150], building30.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building30.TAirAmb);
  connect(ambience.xAir, building30.xAirAmb);
  connect(building30.airchange[1], airchange.y);
  connect(building30.T_setHeating[1], TSetHeating.y);
  connect(building30.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[151:155], building31.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[151:155], building31.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building31.TAirAmb);
  connect(ambience.xAir, building31.xAirAmb);
  connect(building31.airchange[1], airchange.y);
  connect(building31.T_setHeating[1], TSetHeating.y);
  connect(building31.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[156:160], building32.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[156:160], building32.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building32.TAirAmb);
  connect(ambience.xAir, building32.xAirAmb);
  connect(building32.airchange[1], airchange.y);
  connect(building32.T_setHeating[1], TSetHeating.y);
  connect(building32.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[161:165], building33.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[161:165], building33.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building33.TAirAmb);
  connect(ambience.xAir, building33.xAirAmb);
  connect(building33.airchange[1], airchange.y);
  connect(building33.T_setHeating[1], TSetHeating.y);
  connect(building33.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[166:170], building34.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[166:170], building34.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building34.TAirAmb);
  connect(ambience.xAir, building34.xAirAmb);
  connect(building34.airchange[1], airchange.y);
  connect(building34.T_setHeating[1], TSetHeating.y);
  connect(building34.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[171:175], building35.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[171:175], building35.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building35.TAirAmb);
  connect(ambience.xAir, building35.xAirAmb);
  connect(building35.airchange[1], airchange.y);
  connect(building35.T_setHeating[1], TSetHeating.y);
  connect(building35.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[176:180], building36.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[176:180], building36.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building36.TAirAmb);
  connect(ambience.xAir, building36.xAirAmb);
  connect(building36.airchange[1], airchange.y);
  connect(building36.T_setHeating[1], TSetHeating.y);
  connect(building36.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[181:185], building37.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[181:185], building37.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building37.TAirAmb);
  connect(ambience.xAir, building37.xAirAmb);
  connect(building37.airchange[1], airchange.y);
  connect(building37.T_setHeating[1], TSetHeating.y);
  connect(building37.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[186:190], building38.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[186:190], building38.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building38.TAirAmb);
  connect(ambience.xAir, building38.xAirAmb);
  connect(building38.airchange[1], airchange.y);
  connect(building38.T_setHeating[1], TSetHeating.y);
  connect(building38.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[191:195], building39.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[191:195], building39.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building39.TAirAmb);
  connect(ambience.xAir, building39.xAirAmb);
  connect(building39.airchange[1], airchange.y);
  connect(building39.T_setHeating[1], TSetHeating.y);
  connect(building39.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[196:200], building40.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[196:200], building40.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building40.TAirAmb);
  connect(ambience.xAir, building40.xAirAmb);
  connect(building40.airchange[1], airchange.y);
  connect(building40.T_setHeating[1], TSetHeating.y);
  connect(building40.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[201:205], building41.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[201:205], building41.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building41.TAirAmb);
  connect(ambience.xAir, building41.xAirAmb);
  connect(building41.airchange[1], airchange.y);
  connect(building41.T_setHeating[1], TSetHeating.y);
  connect(building41.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[206:210], building42.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[206:210], building42.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building42.TAirAmb);
  connect(ambience.xAir, building42.xAirAmb);
  connect(building42.airchange[1], airchange.y);
  connect(building42.T_setHeating[1], TSetHeating.y);
  connect(building42.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[211:215], building43.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[211:215], building43.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building43.TAirAmb);
  connect(ambience.xAir, building43.xAirAmb);
  connect(building43.airchange[1], airchange.y);
  connect(building43.T_setHeating[1], TSetHeating.y);
  connect(building43.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[216:220], building44.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[216:220], building44.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building44.TAirAmb);
  connect(ambience.xAir, building44.xAirAmb);
  connect(building44.airchange[1], airchange.y);
  connect(building44.T_setHeating[1], TSetHeating.y);
  connect(building44.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[221:225], building45.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[221:225], building45.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building45.TAirAmb);
  connect(ambience.xAir, building45.xAirAmb);
  connect(building45.airchange[1], airchange.y);
  connect(building45.T_setHeating[1], TSetHeating.y);
  connect(building45.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[226:230], building46.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[226:230], building46.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building46.TAirAmb);
  connect(ambience.xAir, building46.xAirAmb);
  connect(building46.airchange[1], airchange.y);
  connect(building46.T_setHeating[1], TSetHeating.y);
  connect(building46.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[231:235], building47.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[231:235], building47.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building47.TAirAmb);
  connect(ambience.xAir, building47.xAirAmb);
  connect(building47.airchange[1], airchange.y);
  connect(building47.T_setHeating[1], TSetHeating.y);
  connect(building47.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[236:240], building48.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[236:240], building48.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building48.TAirAmb);
  connect(ambience.xAir, building48.xAirAmb);
  connect(building48.airchange[1], airchange.y);
  connect(building48.T_setHeating[1], TSetHeating.y);
  connect(building48.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[241:245], building49.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[241:245], building49.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building49.TAirAmb);
  connect(ambience.xAir, building49.xAirAmb);
  connect(building49.airchange[1], airchange.y);
  connect(building49.T_setHeating[1], TSetHeating.y);
  connect(building49.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[246:250], building50.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[246:250], building50.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building50.TAirAmb);
  connect(ambience.xAir, building50.xAirAmb);
  connect(building50.airchange[1], airchange.y);
  connect(building50.T_setHeating[1], TSetHeating.y);
  connect(building50.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[251:255], building51.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[251:255], building51.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building51.TAirAmb);
  connect(ambience.xAir, building51.xAirAmb);
  connect(building51.airchange[1], airchange.y);
  connect(building51.T_setHeating[1], TSetHeating.y);
  connect(building51.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[256:260], building52.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[256:260], building52.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building52.TAirAmb);
  connect(ambience.xAir, building52.xAirAmb);
  connect(building52.airchange[1], airchange.y);
  connect(building52.T_setHeating[1], TSetHeating.y);
  connect(building52.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[261:265], building53.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[261:265], building53.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building53.TAirAmb);
  connect(ambience.xAir, building53.xAirAmb);
  connect(building53.airchange[1], airchange.y);
  connect(building53.T_setHeating[1], TSetHeating.y);
  connect(building53.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[266:270], building54.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[266:270], building54.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building54.TAirAmb);
  connect(ambience.xAir, building54.xAirAmb);
  connect(building54.airchange[1], airchange.y);
  connect(building54.T_setHeating[1], TSetHeating.y);
  connect(building54.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[271:275], building55.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[271:275], building55.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building55.TAirAmb);
  connect(ambience.xAir, building55.xAirAmb);
  connect(building55.airchange[1], airchange.y);
  connect(building55.T_setHeating[1], TSetHeating.y);
  connect(building55.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[276:280], building56.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[276:280], building56.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building56.TAirAmb);
  connect(ambience.xAir, building56.xAirAmb);
  connect(building56.airchange[1], airchange.y);
  connect(building56.T_setHeating[1], TSetHeating.y);
  connect(building56.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[281:285], building57.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[281:285], building57.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building57.TAirAmb);
  connect(ambience.xAir, building57.xAirAmb);
  connect(building57.airchange[1], airchange.y);
  connect(building57.T_setHeating[1], TSetHeating.y);
  connect(building57.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[286:290], building58.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[286:290], building58.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building58.TAirAmb);
  connect(ambience.xAir, building58.xAirAmb);
  connect(building58.airchange[1], airchange.y);
  connect(building58.T_setHeating[1], TSetHeating.y);
  connect(building58.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[291:295], building59.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[291:295], building59.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building59.TAirAmb);
  connect(ambience.xAir, building59.xAirAmb);
  connect(building59.airchange[1], airchange.y);
  connect(building59.T_setHeating[1], TSetHeating.y);
  connect(building59.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[296:300], building60.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[296:300], building60.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building60.TAirAmb);
  connect(ambience.xAir, building60.xAirAmb);
  connect(building60.airchange[1], airchange.y);
  connect(building60.T_setHeating[1], TSetHeating.y);
  connect(building60.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[301:305], building61.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[301:305], building61.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building61.TAirAmb);
  connect(ambience.xAir, building61.xAirAmb);
  connect(building61.airchange[1], airchange.y);
  connect(building61.T_setHeating[1], TSetHeating.y);
  connect(building61.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[306:310], building62.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[306:310], building62.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building62.TAirAmb);
  connect(ambience.xAir, building62.xAirAmb);
  connect(building62.airchange[1], airchange.y);
  connect(building62.T_setHeating[1], TSetHeating.y);
  connect(building62.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[311:315], building63.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[311:315], building63.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building63.TAirAmb);
  connect(ambience.xAir, building63.xAirAmb);
  connect(building63.airchange[1], airchange.y);
  connect(building63.T_setHeating[1], TSetHeating.y);
  connect(building63.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[316:320], building64.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[316:320], building64.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building64.TAirAmb);
  connect(ambience.xAir, building64.xAirAmb);
  connect(building64.airchange[1], airchange.y);
  connect(building64.T_setHeating[1], TSetHeating.y);
  connect(building64.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[321:325], building65.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[321:325], building65.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building65.TAirAmb);
  connect(ambience.xAir, building65.xAirAmb);
  connect(building65.airchange[1], airchange.y);
  connect(building65.T_setHeating[1], TSetHeating.y);
  connect(building65.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[326:330], building66.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[326:330], building66.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building66.TAirAmb);
  connect(ambience.xAir, building66.xAirAmb);
  connect(building66.airchange[1], airchange.y);
  connect(building66.T_setHeating[1], TSetHeating.y);
  connect(building66.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[331:335], building67.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[331:335], building67.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building67.TAirAmb);
  connect(ambience.xAir, building67.xAirAmb);
  connect(building67.airchange[1], airchange.y);
  connect(building67.T_setHeating[1], TSetHeating.y);
  connect(building67.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[336:340], building68.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[336:340], building68.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building68.TAirAmb);
  connect(ambience.xAir, building68.xAirAmb);
  connect(building68.airchange[1], airchange.y);
  connect(building68.T_setHeating[1], TSetHeating.y);
  connect(building68.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[341:345], building69.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[341:345], building69.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building69.TAirAmb);
  connect(ambience.xAir, building69.xAirAmb);
  connect(building69.airchange[1], airchange.y);
  connect(building69.T_setHeating[1], TSetHeating.y);
  connect(building69.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[346:350], building70.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[346:350], building70.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building70.TAirAmb);
  connect(ambience.xAir, building70.xAirAmb);
  connect(building70.airchange[1], airchange.y);
  connect(building70.T_setHeating[1], TSetHeating.y);
  connect(building70.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[351:355], building71.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[351:355], building71.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building71.TAirAmb);
  connect(ambience.xAir, building71.xAirAmb);
  connect(building71.airchange[1], airchange.y);
  connect(building71.T_setHeating[1], TSetHeating.y);
  connect(building71.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[356:360], building72.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[356:360], building72.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building72.TAirAmb);
  connect(ambience.xAir, building72.xAirAmb);
  connect(building72.airchange[1], airchange.y);
  connect(building72.T_setHeating[1], TSetHeating.y);
  connect(building72.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[361:365], building73.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[361:365], building73.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building73.TAirAmb);
  connect(ambience.xAir, building73.xAirAmb);
  connect(building73.airchange[1], airchange.y);
  connect(building73.T_setHeating[1], TSetHeating.y);
  connect(building73.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[366:370], building74.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[366:370], building74.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building74.TAirAmb);
  connect(ambience.xAir, building74.xAirAmb);
  connect(building74.airchange[1], airchange.y);
  connect(building74.T_setHeating[1], TSetHeating.y);
  connect(building74.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[371:375], building75.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[371:375], building75.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building75.TAirAmb);
  connect(ambience.xAir, building75.xAirAmb);
  connect(building75.airchange[1], airchange.y);
  connect(building75.T_setHeating[1], TSetHeating.y);
  connect(building75.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[376:380], building76.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[376:380], building76.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building76.TAirAmb);
  connect(ambience.xAir, building76.xAirAmb);
  connect(building76.airchange[1], airchange.y);
  connect(building76.T_setHeating[1], TSetHeating.y);
  connect(building76.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[381:385], building77.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[381:385], building77.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building77.TAirAmb);
  connect(ambience.xAir, building77.xAirAmb);
  connect(building77.airchange[1], airchange.y);
  connect(building77.T_setHeating[1], TSetHeating.y);
  connect(building77.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[386:390], building78.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[386:390], building78.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building78.TAirAmb);
  connect(ambience.xAir, building78.xAirAmb);
  connect(building78.airchange[1], airchange.y);
  connect(building78.T_setHeating[1], TSetHeating.y);
  connect(building78.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[391:395], building79.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[391:395], building79.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building79.TAirAmb);
  connect(ambience.xAir, building79.xAirAmb);
  connect(building79.airchange[1], airchange.y);
  connect(building79.T_setHeating[1], TSetHeating.y);
  connect(building79.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[396:400], building80.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[396:400], building80.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building80.TAirAmb);
  connect(ambience.xAir, building80.xAirAmb);
  connect(building80.airchange[1], airchange.y);
  connect(building80.T_setHeating[1], TSetHeating.y);
  connect(building80.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[401:405], building81.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[401:405], building81.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building81.TAirAmb);
  connect(ambience.xAir, building81.xAirAmb);
  connect(building81.airchange[1], airchange.y);
  connect(building81.T_setHeating[1], TSetHeating.y);
  connect(building81.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[406:410], building82.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[406:410], building82.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building82.TAirAmb);
  connect(ambience.xAir, building82.xAirAmb);
  connect(building82.airchange[1], airchange.y);
  connect(building82.T_setHeating[1], TSetHeating.y);
  connect(building82.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[411:415], building83.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[411:415], building83.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building83.TAirAmb);
  connect(ambience.xAir, building83.xAirAmb);
  connect(building83.airchange[1], airchange.y);
  connect(building83.T_setHeating[1], TSetHeating.y);
  connect(building83.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[416:420], building84.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[416:420], building84.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building84.TAirAmb);
  connect(ambience.xAir, building84.xAirAmb);
  connect(building84.airchange[1], airchange.y);
  connect(building84.T_setHeating[1], TSetHeating.y);
  connect(building84.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[421:425], building85.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[421:425], building85.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building85.TAirAmb);
  connect(ambience.xAir, building85.xAirAmb);
  connect(building85.airchange[1], airchange.y);
  connect(building85.T_setHeating[1], TSetHeating.y);
  connect(building85.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[426:430], building86.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[426:430], building86.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building86.TAirAmb);
  connect(ambience.xAir, building86.xAirAmb);
  connect(building86.airchange[1], airchange.y);
  connect(building86.T_setHeating[1], TSetHeating.y);
  connect(building86.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[431:435], building87.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[431:435], building87.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building87.TAirAmb);
  connect(ambience.xAir, building87.xAirAmb);
  connect(building87.airchange[1], airchange.y);
  connect(building87.T_setHeating[1], TSetHeating.y);
  connect(building87.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[436:440], building88.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[436:440], building88.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building88.TAirAmb);
  connect(ambience.xAir, building88.xAirAmb);
  connect(building88.airchange[1], airchange.y);
  connect(building88.T_setHeating[1], TSetHeating.y);
  connect(building88.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[441:445], building89.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[441:445], building89.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building89.TAirAmb);
  connect(ambience.xAir, building89.xAirAmb);
  connect(building89.airchange[1], airchange.y);
  connect(building89.T_setHeating[1], TSetHeating.y);
  connect(building89.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[446:450], building90.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[446:450], building90.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building90.TAirAmb);
  connect(ambience.xAir, building90.xAirAmb);
  connect(building90.airchange[1], airchange.y);
  connect(building90.T_setHeating[1], TSetHeating.y);
  connect(building90.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[451:455], building91.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[451:455], building91.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building91.TAirAmb);
  connect(ambience.xAir, building91.xAirAmb);
  connect(building91.airchange[1], airchange.y);
  connect(building91.T_setHeating[1], TSetHeating.y);
  connect(building91.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[456:460], building92.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[456:460], building92.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building92.TAirAmb);
  connect(ambience.xAir, building92.xAirAmb);
  connect(building92.airchange[1], airchange.y);
  connect(building92.T_setHeating[1], TSetHeating.y);
  connect(building92.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[461:465], building93.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[461:465], building93.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building93.TAirAmb);
  connect(ambience.xAir, building93.xAirAmb);
  connect(building93.airchange[1], airchange.y);
  connect(building93.T_setHeating[1], TSetHeating.y);
  connect(building93.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[466:470], building94.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[466:470], building94.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building94.TAirAmb);
  connect(ambience.xAir, building94.xAirAmb);
  connect(building94.airchange[1], airchange.y);
  connect(building94.T_setHeating[1], TSetHeating.y);
  connect(building94.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[471:475], building95.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[471:475], building95.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building95.TAirAmb);
  connect(ambience.xAir, building95.xAirAmb);
  connect(building95.airchange[1], airchange.y);
  connect(building95.T_setHeating[1], TSetHeating.y);
  connect(building95.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[476:480], building96.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[476:480], building96.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building96.TAirAmb);
  connect(ambience.xAir, building96.xAirAmb);
  connect(building96.airchange[1], airchange.y);
  connect(building96.T_setHeating[1], TSetHeating.y);
  connect(building96.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[481:485], building97.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[481:485], building97.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building97.TAirAmb);
  connect(ambience.xAir, building97.xAirAmb);
  connect(building97.airchange[1], airchange.y);
  connect(building97.T_setHeating[1], TSetHeating.y);
  connect(building97.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[486:490], building98.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[486:490], building98.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building98.TAirAmb);
  connect(ambience.xAir, building98.xAirAmb);
  connect(building98.airchange[1], airchange.y);
  connect(building98.T_setHeating[1], TSetHeating.y);
  connect(building98.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[491:495], building99.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[491:495], building99.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building99.TAirAmb);
  connect(ambience.xAir, building99.xAirAmb);
  connect(building99.airchange[1], airchange.y);
  connect(building99.T_setHeating[1], TSetHeating.y);
  connect(building99.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[496:500], building100.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[496:500], building100.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building100.TAirAmb);
  connect(ambience.xAir, building100.xAirAmb);
  connect(building100.airchange[1], airchange.y);
  connect(building100.T_setHeating[1], TSetHeating.y);
  connect(building100.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[501:505], building101.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[501:505], building101.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building101.TAirAmb);
  connect(ambience.xAir, building101.xAirAmb);
  connect(building101.airchange[1], airchange.y);
  connect(building101.T_setHeating[1], TSetHeating.y);
  connect(building101.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[506:510], building102.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[506:510], building102.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building102.TAirAmb);
  connect(ambience.xAir, building102.xAirAmb);
  connect(building102.airchange[1], airchange.y);
  connect(building102.T_setHeating[1], TSetHeating.y);
  connect(building102.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[511:515], building103.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[511:515], building103.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building103.TAirAmb);
  connect(ambience.xAir, building103.xAirAmb);
  connect(building103.airchange[1], airchange.y);
  connect(building103.T_setHeating[1], TSetHeating.y);
  connect(building103.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[516:520], building104.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[516:520], building104.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building104.TAirAmb);
  connect(ambience.xAir, building104.xAirAmb);
  connect(building104.airchange[1], airchange.y);
  connect(building104.T_setHeating[1], TSetHeating.y);
  connect(building104.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[521:525], building105.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[521:525], building105.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building105.TAirAmb);
  connect(ambience.xAir, building105.xAirAmb);
  connect(building105.airchange[1], airchange.y);
  connect(building105.T_setHeating[1], TSetHeating.y);
  connect(building105.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[526:530], building106.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[526:530], building106.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building106.TAirAmb);
  connect(ambience.xAir, building106.xAirAmb);
  connect(building106.airchange[1], airchange.y);
  connect(building106.T_setHeating[1], TSetHeating.y);
  connect(building106.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[531:535], building107.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[531:535], building107.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building107.TAirAmb);
  connect(ambience.xAir, building107.xAirAmb);
  connect(building107.airchange[1], airchange.y);
  connect(building107.T_setHeating[1], TSetHeating.y);
  connect(building107.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[536:540], building108.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[536:540], building108.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building108.TAirAmb);
  connect(ambience.xAir, building108.xAirAmb);
  connect(building108.airchange[1], airchange.y);
  connect(building108.T_setHeating[1], TSetHeating.y);
  connect(building108.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[541:545], building109.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[541:545], building109.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building109.TAirAmb);
  connect(ambience.xAir, building109.xAirAmb);
  connect(building109.airchange[1], airchange.y);
  connect(building109.T_setHeating[1], TSetHeating.y);
  connect(building109.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[546:550], building110.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[546:550], building110.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building110.TAirAmb);
  connect(ambience.xAir, building110.xAirAmb);
  connect(building110.airchange[1], airchange.y);
  connect(building110.T_setHeating[1], TSetHeating.y);
  connect(building110.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[551:555], building111.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[551:555], building111.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building111.TAirAmb);
  connect(ambience.xAir, building111.xAirAmb);
  connect(building111.airchange[1], airchange.y);
  connect(building111.T_setHeating[1], TSetHeating.y);
  connect(building111.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[556:560], building112.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[556:560], building112.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building112.TAirAmb);
  connect(ambience.xAir, building112.xAirAmb);
  connect(building112.airchange[1], airchange.y);
  connect(building112.T_setHeating[1], TSetHeating.y);
  connect(building112.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[561:565], building113.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[561:565], building113.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building113.TAirAmb);
  connect(ambience.xAir, building113.xAirAmb);
  connect(building113.airchange[1], airchange.y);
  connect(building113.T_setHeating[1], TSetHeating.y);
  connect(building113.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[566:570], building114.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[566:570], building114.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building114.TAirAmb);
  connect(ambience.xAir, building114.xAirAmb);
  connect(building114.airchange[1], airchange.y);
  connect(building114.T_setHeating[1], TSetHeating.y);
  connect(building114.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[571:575], building115.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[571:575], building115.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building115.TAirAmb);
  connect(ambience.xAir, building115.xAirAmb);
  connect(building115.airchange[1], airchange.y);
  connect(building115.T_setHeating[1], TSetHeating.y);
  connect(building115.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[576:580], building116.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[576:580], building116.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building116.TAirAmb);
  connect(ambience.xAir, building116.xAirAmb);
  connect(building116.airchange[1], airchange.y);
  connect(building116.T_setHeating[1], TSetHeating.y);
  connect(building116.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[581:585], building117.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[581:585], building117.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building117.TAirAmb);
  connect(ambience.xAir, building117.xAirAmb);
  connect(building117.airchange[1], airchange.y);
  connect(building117.T_setHeating[1], TSetHeating.y);
  connect(building117.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[586:590], building118.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[586:590], building118.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building118.TAirAmb);
  connect(ambience.xAir, building118.xAirAmb);
  connect(building118.airchange[1], airchange.y);
  connect(building118.T_setHeating[1], TSetHeating.y);
  connect(building118.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[591:595], building119.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[591:595], building119.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building119.TAirAmb);
  connect(ambience.xAir, building119.xAirAmb);
  connect(building119.airchange[1], airchange.y);
  connect(building119.T_setHeating[1], TSetHeating.y);
  connect(building119.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[596:600], building120.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[596:600], building120.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building120.TAirAmb);
  connect(ambience.xAir, building120.xAirAmb);
  connect(building120.airchange[1], airchange.y);
  connect(building120.T_setHeating[1], TSetHeating.y);
  connect(building120.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[601:605], building121.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[601:605], building121.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building121.TAirAmb);
  connect(ambience.xAir, building121.xAirAmb);
  connect(building121.airchange[1], airchange.y);
  connect(building121.T_setHeating[1], TSetHeating.y);
  connect(building121.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[606:610], building122.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[606:610], building122.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building122.TAirAmb);
  connect(ambience.xAir, building122.xAirAmb);
  connect(building122.airchange[1], airchange.y);
  connect(building122.T_setHeating[1], TSetHeating.y);
  connect(building122.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[611:615], building123.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[611:615], building123.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building123.TAirAmb);
  connect(ambience.xAir, building123.xAirAmb);
  connect(building123.airchange[1], airchange.y);
  connect(building123.T_setHeating[1], TSetHeating.y);
  connect(building123.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[616:620], building124.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[616:620], building124.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building124.TAirAmb);
  connect(ambience.xAir, building124.xAirAmb);
  connect(building124.airchange[1], airchange.y);
  connect(building124.T_setHeating[1], TSetHeating.y);
  connect(building124.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[621:625], building125.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[621:625], building125.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building125.TAirAmb);
  connect(ambience.xAir, building125.xAirAmb);
  connect(building125.airchange[1], airchange.y);
  connect(building125.T_setHeating[1], TSetHeating.y);
  connect(building125.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[626:630], building126.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[626:630], building126.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building126.TAirAmb);
  connect(ambience.xAir, building126.xAirAmb);
  connect(building126.airchange[1], airchange.y);
  connect(building126.T_setHeating[1], TSetHeating.y);
  connect(building126.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[631:635], building127.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[631:635], building127.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building127.TAirAmb);
  connect(ambience.xAir, building127.xAirAmb);
  connect(building127.airchange[1], airchange.y);
  connect(building127.T_setHeating[1], TSetHeating.y);
  connect(building127.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[636:640], building128.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[636:640], building128.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building128.TAirAmb);
  connect(ambience.xAir, building128.xAirAmb);
  connect(building128.airchange[1], airchange.y);
  connect(building128.T_setHeating[1], TSetHeating.y);
  connect(building128.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[641:645], building129.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[641:645], building129.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building129.TAirAmb);
  connect(ambience.xAir, building129.xAirAmb);
  connect(building129.airchange[1], airchange.y);
  connect(building129.T_setHeating[1], TSetHeating.y);
  connect(building129.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[646:650], building130.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[646:650], building130.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building130.TAirAmb);
  connect(ambience.xAir, building130.xAirAmb);
  connect(building130.airchange[1], airchange.y);
  connect(building130.T_setHeating[1], TSetHeating.y);
  connect(building130.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[651:655], building131.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[651:655], building131.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building131.TAirAmb);
  connect(ambience.xAir, building131.xAirAmb);
  connect(building131.airchange[1], airchange.y);
  connect(building131.T_setHeating[1], TSetHeating.y);
  connect(building131.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[656:660], building132.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[656:660], building132.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building132.TAirAmb);
  connect(ambience.xAir, building132.xAirAmb);
  connect(building132.airchange[1], airchange.y);
  connect(building132.T_setHeating[1], TSetHeating.y);
  connect(building132.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[661:665], building133.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[661:665], building133.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building133.TAirAmb);
  connect(ambience.xAir, building133.xAirAmb);
  connect(building133.airchange[1], airchange.y);
  connect(building133.T_setHeating[1], TSetHeating.y);
  connect(building133.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[666:670], building134.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[666:670], building134.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building134.TAirAmb);
  connect(ambience.xAir, building134.xAirAmb);
  connect(building134.airchange[1], airchange.y);
  connect(building134.T_setHeating[1], TSetHeating.y);
  connect(building134.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[671:675], building135.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[671:675], building135.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building135.TAirAmb);
  connect(ambience.xAir, building135.xAirAmb);
  connect(building135.airchange[1], airchange.y);
  connect(building135.T_setHeating[1], TSetHeating.y);
  connect(building135.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[676:680], building136.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[676:680], building136.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building136.TAirAmb);
  connect(ambience.xAir, building136.xAirAmb);
  connect(building136.airchange[1], airchange.y);
  connect(building136.T_setHeating[1], TSetHeating.y);
  connect(building136.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[681:685], building137.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[681:685], building137.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building137.TAirAmb);
  connect(ambience.xAir, building137.xAirAmb);
  connect(building137.airchange[1], airchange.y);
  connect(building137.T_setHeating[1], TSetHeating.y);
  connect(building137.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[686:690], building138.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[686:690], building138.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building138.TAirAmb);
  connect(ambience.xAir, building138.xAirAmb);
  connect(building138.airchange[1], airchange.y);
  connect(building138.T_setHeating[1], TSetHeating.y);
  connect(building138.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[691:695], building139.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[691:695], building139.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building139.TAirAmb);
  connect(ambience.xAir, building139.xAirAmb);
  connect(building139.airchange[1], airchange.y);
  connect(building139.T_setHeating[1], TSetHeating.y);
  connect(building139.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[696:700], building140.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[696:700], building140.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building140.TAirAmb);
  connect(ambience.xAir, building140.xAirAmb);
  connect(building140.airchange[1], airchange.y);
  connect(building140.T_setHeating[1], TSetHeating.y);
  connect(building140.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[701:705], building141.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[701:705], building141.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building141.TAirAmb);
  connect(ambience.xAir, building141.xAirAmb);
  connect(building141.airchange[1], airchange.y);
  connect(building141.T_setHeating[1], TSetHeating.y);
  connect(building141.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[706:710], building142.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[706:710], building142.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building142.TAirAmb);
  connect(ambience.xAir, building142.xAirAmb);
  connect(building142.airchange[1], airchange.y);
  connect(building142.T_setHeating[1], TSetHeating.y);
  connect(building142.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[711:715], building143.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[711:715], building143.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building143.TAirAmb);
  connect(ambience.xAir, building143.xAirAmb);
  connect(building143.airchange[1], airchange.y);
  connect(building143.T_setHeating[1], TSetHeating.y);
  connect(building143.T_setCooling[1], TSetCooling.y);
  connect(ambience.toSurfacePorts[716:720], building144.toAmbienceSurfacesPorts[1:5]);
  connect(ambience.toAirPorts[716:720], building144.toAmbienceAirPorts[1:5]);
  connect(ambience.TAirRef, building144.TAirAmb);
  connect(ambience.xAir, building144.xAirAmb);
  connect(building144.airchange[1], airchange.y);
  connect(building144.T_setHeating[1], TSetHeating.y);
  connect(building144.T_setCooling[1], TSetCooling.y);

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/DistrictSimulation/DistrictBerlinKreuzberg.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-320},{400,450}}),
    graphics={Bitmap(extent={{-152,-278},{438,436}},
    fileName="modelica://BuildingSystems/Resources/Images/Applications/DistrictSimulation/DistrictBerlinKreuzberg.PNG"),
    Text(extent={{-86,-276},{368,-324}},lineColor={28,108,200},textString="City district model with 144 building models")}),
Documentation(info="<html>
<p>
Example that simulates heating and cooling demand of a city district in Berlin-Kreuzberg (Germany).
</p>
</html>",
revisions="<html>
<ul>
<li>
February 15, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end DistrictBerlinKreuzberg;
