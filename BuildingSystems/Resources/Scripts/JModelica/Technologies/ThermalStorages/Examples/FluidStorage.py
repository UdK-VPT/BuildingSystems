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
model_name = 'BuildingSystems.Technologies.ThermalStorages.Examples.FluidStorage'
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

res = myModel.simulate(start_time=0, final_time=2500, options=opts)

# <codecell> plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# mass flows
y1 = res['storage.port_b1.m_flow']
y2 = res['storage.port_HX_1_a.m_flow']
t = res['time']
P.subplot(3,1,1)
P.plot(t, y1, t, y2)
P.legend(['storage.port_b1.m_flow','storage.port_HX_1_a.m_flow'])
P.ylabel('Mass flow (kg/s)')
P.xlabel('Time (s)')
# fluid temperatures
y1 = res['storage.T[1]']
y2 = res['storage.T[2]']
y3 = res['storage.T[3]']
y4 = res['storage.T[4]']
y5 = res['storage.T[5]']
y6 = res['storage.T[6]']
P.subplot(3,1,2)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5, t, y6)
P.legend(['storage.T[1]','storage.T[2]','storage.T[3]','storage.T[4]','storage.T[5]','storage.T[6]'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# heat flows
y1 = res['storage.heatPort.Q_flow']
t = res['time']
P.subplot(3,1,3)
P.plot(t, y1)
P.legend(['storage.heatPort.Q_flow'])
P.ylabel('heat flow (W)')
P.xlabel('Time (s)')
P.show()
