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
model_name = 'BuildingSystems.Buildings.Examples.Building1Zone0D'
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
# building1
# temperatures
y1 = res['ambient1.TAirRef']
y2 = res['building1.zone.TAir']
y3 = res['building1.zone.TOperative']
t = res['time']
P.subplot(3,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['ambient.TAirRef','building1.zone.TAir','building1.zone.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating and cooling load
y1 = res['building1.Q_flow_heating[1]']
y2 = res['building1.Q_flow_cooling[1]']
P.subplot(3,1,2)
P.plot(t, y1, t, y2)
P.legend(['building1.Q_flow_heating','building1.Q_flow_cooling'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
# building2
# temperatures
y1 = res['ambient2.TAirRef']
y2 = res['building2.zone.TAir']
y3 = res['building2.zone.TOperative']
P.subplot(3,1,3)
P.plot(t, y1, t, y2, t, y3)
P.legend(['ambient.TAirRef','building2.zone.TAir','building2.zone.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
P.show()
