# paths and info
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

# compile model to fmu
from pymodelica import compile_fmu
model_name = 'BuildingSystems.Buildings.Examples.BuildingThermal4Zones1DAirpaths'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 500
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=0, final_time=86400, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# building
# temperatures
y1 = res['ambient.TAirRef']
y2 = res['building.zone1.TAir']
y3 = res['building.zone2.TAir']
y4 = res['building.zone3.TAir']
y5 = res['building.zone4.TAir']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['ambient.TAirRef','building.zone1.TAir','building.zone2.TAir','building.zone3.TAir','building.zone4.TAir'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating load
y1 = res['building.zone1.Q_flow_heating']
y2 = res['building.zone2.Q_flow_heating']
y3 = res['building.zone1.Q_flow_heating']
y4 = res['building.zone2.Q_flow_heating']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['building.zone1.Q_flow_heating','building.zone2.Q_flow_heating','building.zone3.Q_flow_heating','building.zone4.Q_flow_heating'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
P.show()
