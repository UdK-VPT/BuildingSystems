# <codecell> paths and info
import os, sys
homeDir = os.environ['HOMEPATH']
jmodDir = os.environ['JMODELICA_HOME']
workDir = "Desktop" # has to be adapted by the user !!!
moLiDir = os.path.join(homeDir, workDir, "BuildingSystems")

# give the path to directory where package.mo is stored
moLibs = [os.path.join(jmodDir, "ThirdParty\MSL\Modelica"),
          os.path.join(moLiDir,"BuildingSystems"),
         ]

print(sys.version)
print(all(os.path.isfile(os.path.join(moLib, "package.mo")) for moLib in moLibs))
print(os.getcwd())

# <codecell> compile model to fmu
from pymodelica import compile_fmu
model_name = 'BuildingSystems.Applications.AirConditioningSystems.PhotovoltaicCoolingSystem'
my_fmu = compile_fmu(model_name, moLibs)

# <codecell> simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 8760
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=0.0, final_time=864000, options=opts)

# <codecell> plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# battery
# power
y1 = res['battery.PChargeEff']
y2 = res['battery.PLoadEff']
y3 = res['battery.PGrid']
t = res['time']
P.subplot(6,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['battery.PChargeEff','battery.PLoadEff','battery.PGrid'])
P.ylabel('Power (W)')
P.xlabel('Time (s)')
# state of charge
y1 = res['battery.SOC']
P.subplot(6,1,2)
P.plot(t, y1)
P.legend(['battery.SOC'])
P.ylabel('SOC (1)')
P.xlabel('Time (s)')
# temperatures PV module and chiller
y1 = res['pvField.thermalModel.TAmb']
y2 = res['pvField.thermalModel.TCel']
y3 = res['chiller.volEva.T']
y4 = res['chiller.volCon.T']
t = res['time']
P.subplot(6,1,3)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['pvField.thermalModel.TAmb','pvField.thermalModel.TCel','chiller.volEva.T','chiller.volCon.T'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# solar radiation on collector
y1 = res['chiller.COP']
t = res['time']
P.subplot(6,1,4)
P.plot(t, y1)
P.legend(['chiller.COP'])
P.ylabel('COP (1)')
P.xlabel('Time (s)')
# building temperatures
y1 = res['building.TAir[1]']
y2 = res['building.zone.TOperative']
t = res['time']
P.subplot(6,1,5)
P.plot(t, y1, t, y2)
P.legend(['building.TAir[1]','building.zone.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# cold water storage temperatures
y1 = res['storage.T[1]']
y2 = res['storage.T[3]']
y3 = res['storage.T[5]']
t = res['time']
P.subplot(6,1,6)
P.plot(t, y1, t, y2, t , y3)
P.legend(['storage.T[1]','storage.T[3]','storage.T[5]'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
P.show()
