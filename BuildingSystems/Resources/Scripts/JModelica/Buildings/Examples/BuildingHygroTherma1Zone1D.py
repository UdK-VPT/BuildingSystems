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
model_name = 'BuildingSystems.Buildings.Examples.BuildingHygroThermal1Zone1D'
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
y2 = res['building.zone1.TAir']
y3 = res['building.zone1.TOperative']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['ambient.TAirRef','building.zone1.TAir','building.zone1.TOperative'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# absolute moisture
y = {"ambient.xAir","building.zone1.xAir"},
y1 = res['ambient.xAir']
y2 = res['building.zone1.xAir']
P.subplot(2,1,2)
P.plot(t, y1, t, y2)
P.legend(['ambient.xAir','building.zone1.xAir'])
P.ylabel('absolute moisture (kg/kg)')
P.xlabel('Time (s)')
P.show()
