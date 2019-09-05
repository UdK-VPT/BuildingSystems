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
model_name = 'BuildingSystems.Buildings.Constructions.Examples.WallThermal1DNodesFlexGeo'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 240
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
# wall
# temperatures
y1 = res['ambience.TAirRef']
y2 = res['wall.construction.layer[1].T[1]']
y3 = res['wall.construction.layer[1].T[2]']
y4 = res['wall.construction.layer[2].T[1]']
y5 = res['wall.construction.layer[2].T[2]']
t = res['time']
P.subplot(3,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5)
P.legend(['ambience.TAirRef','wall.construction.layer[1].T[1]','wall.construction.layer[1].T[2]','wall.construction.layer[2].T[1]','wall.construction.layer[2].T[2]'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# wall
# heat flows
y1 = res['wall.construction.heatPort_x1.Q_flow']
y2 = res['wall.construction.heatPort_x1.Q_flow']
P.subplot(3,1,2)
P.plot(t, y1, t, y2)
P.legend(['wall.construction.heatPort_x1.Q_flow','wall.construction.heatPort_x1.Q_flow'])
P.ylabel('Heat flow (W)')
P.xlabel('Time (s)')
# wall
# geometry
y1 = res['wall.ASur']
y2 = res['wall.width_internal']
y3 = res['wall.height_internal']
t = res['time']
P.subplot(3,1,3)
P.plot(t, y1, t, y2, t, y3)
P.legend(['wall.ASur','wall.width_internal','wall.height_internal'])
P.ylabel('Length (m) and area (m2)')
P.xlabel('Time (s)')
P.show()
