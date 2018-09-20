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
model_name = 'BuildingSystems.Buildings.Examples.BuildingThermalMultiZone'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)
value1 = 0.5

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 8760
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=1.5552e7, final_time=1.6416e7, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# building
# temperatures
y1 = res['ambient.TAirRef']
y2 = res['building.office1.TAir']
y3 = res['building.office2.TAir']
y4 = res['building.office3.TAir']
y5 = res['building.office4.TAir']
y6 = res['building.office5.TAir']
y7 = res['building.office6.TAir']
y8 = res['building.office7.TAir']
y9 = res['building.office8.TAir']
y10 = res['building.bullpen.TAir']
y11 = res['building.conferenceRoom.TAir']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5, t, y6, t, y7, t, y8, t, y9, t, y10, t, y11)
P.legend(['ambient.TAirRef','building.office1.TAir','building.office2.TAir',
'building.office3.TAir','building.office4.TAir','building.office5.TAir',
'building.office6.TAir','building.office7.TAir','building.office8.TAir',
'building.bullpen.TAir','building.conferenceRoom.TAir'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating and cooling load
y1 = res['building.bullpen.Q_flow_cooling']
y2 = res['building.conferenceRoom.Q_flow_cooling']
P.subplot(2,1,2)
P.plot(t, y1, t, y2)
P.legend(['building.bullpen.Q_flow_cooling','building.conferenceRoom.Q_flow_cooling'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
P.show()
