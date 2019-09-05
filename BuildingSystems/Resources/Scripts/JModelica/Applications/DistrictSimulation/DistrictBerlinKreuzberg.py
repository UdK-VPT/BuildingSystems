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

# necessary for large models
import pymodelica
pymodelica.environ['JVM_ARGS'] = '-Xmx11048m'

# compile model to fmu
from pymodelica import compile_fmu
model_name = 'BuildingSystems.Applications.DistrictSimulation.DistrictBerlinKreuzberg'
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

res = myModel.simulate(start_time=0.0, final_time=864000, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# building
# temperatures
y1 = res['ambience.TAirRef']
y2 = res['building122.zone.TAir']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2)
P.legend(['ambience.TAirRef','building122.zone.TAir'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Heating load
y1 = res['heatingLoad.y']
y2 = res['coolingLoad.y']
t = res['time']
P.subplot(2,1,2)
P.plot(t, y1, t, y2)
P.legend(['heatingLoad.y','coolingLoad.y'])
P.ylabel('Power (W)')
P.xlabel('Time (s)')
P.show()
