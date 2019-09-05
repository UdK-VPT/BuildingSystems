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
model_name = 'BuildingSystems.Buildings.Constructions.Examples.Door'
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
# Temperatures
y1 = res['ambience.TAirRef']
y2 = res['zone.TAir']
t = res['time']
P.subplot(3,1,1)
P.plot(t, y1, t, y2)
P.legend(['ambience.TAirRef','zone.TAir'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# Mass flow rates
y1 = res['door.port_a1.m_flow']
y2 = res['door.port_b1.m_flow']
P.subplot(3,1,2)
P.plot(t, y1, t, y2)
P.legend(['door.port_a1.m_flow','door.port_b1.m_flow'])
P.ylabel('Mass flow rate (kg/s)')
P.xlabel('Time (s)')
# Heating flow rate
y1 = res['zone.Q_flow_heating']
P.subplot(3,1,3)
P.plot(t, y1)
P.legend(['zone.Q_flow_heating'])
P.ylabel('Heating flow rate (W)')
P.xlabel('Time (s)')
P.show()
