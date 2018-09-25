# paths and info
import os, sys
homeDir = os.environ['HOMEPATH']
workDir = "Desktop" # has to be adapted by the user !!!
moLibsDir = os.path.join(homeDir, workDir, "BuildingSystems")

# give the path to directory where package.mo is stored
moLibs = [os.path.normpath("C:\JModelica.org-2.2\install\ThirdParty\MSL\Modelica"),
		  os.path.join(moLibsDir,"BuildingSystems"),
         ]

print(sys.version)
print(all(os.path.isfile(os.path.join(moLib, "package.mo")) for moLib in moLibs))
print(os.getcwd())

# compile model to fmu
from pymodelica import compile_fmu
model_name = 'BuildingSystems.Applications.HeatingSystems.SolarHeatingSystem'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
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

res = myModel.simulate(start_time=0.0, final_time=31536000, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# building
# temperatures
y1 = res['ambient.TAirRef']
y2 = res['building.zone.TAir']
y3 = res['building.zone.TOperative']
t = res['time']
P.subplot(4,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['ambient.TAirRef','building.zone.TAir','building.zone.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating load
y1 = res['rad.Q_flow']
P.subplot(4,1,2)
P.plot(t, y1)
P.legend(['rad.Q_flow'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
# temperatures solar thermal system
y1 = res['collector.vol[10].T']
y2 = res['storage.T[1]']
y3 = res['storage.T[10]']
t = res['time']
P.subplot(4,1,3)
P.plot(t, y1, t, y2, t, y3)
P.legend(['collector.vol[10].T','storage.T[1]','storage.T[10]'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# solar radiation on collector
y1 = res['collector.radiationPort.IrrDir']
y2 = res['collector.radiationPort.IrrDif']
t = res['time']
P.subplot(4,1,4)
P.plot(t, y1, t, y2)
P.legend(['collector.radiationPort.IrrDir','collector.radiationPort.IrrDif'])
P.ylabel('Radiation (W/m2)')
P.xlabel('Time (s)')
P.show()
