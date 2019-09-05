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
model_name = 'BuildingSystems.Buildings.Zones.Examples.SingleZoneThermal3D3x3x3'
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

res = myModel.simulate(start_time=0.0, final_time=86400.0, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# zone
# air element temperatures
y1 = res['ambience.TAirRef']
y2 = res['zone.airvolume.airEle212.fluid.T']
y3 = res['zone.airvolume.airEle222.fluid.T']
y4 = res['zone.airvolume.airEle232.fluid.T']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['ambience.TAirRef','zone.airvolume.airEle212.fluid.T','zone.airvolume.airEle222.fluid.T','zone.airvolume.airEle232.fluid.T'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# air velocities
y1 = res['zone.airvolume.airEle212.velMag']
y2 = res['zone.airvolume.airEle222.velMag']
y3 = res['zone.airvolume.airEle232.velMag']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3)
P.legend(['zone.airvolume.airEle212.velMag','zone.airvolume.airEle222.velMag','zone.airvolume.airEle232.velMag'])
P.ylabel('velocity (m/s)')
P.xlabel('Time (s)')
P.show()
