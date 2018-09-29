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
model_name = 'BuildingSystems.HAM.HeatAndMoistureTransport.Examples.HeatAndMoistureTransport3D'
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
opts['CVode_options']['atol'] = 1e-4
opts['CVode_options']['rtol'] = 1e-4

res = myModel.simulate(start_time=0.0, final_time=172800, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# body
# temperatures
y1 = res['el21.T']
y2 = res['el22.T']
y3 = res['el23.T']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3)
P.legend(['el21.T','el22.T','el23.T',])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# water content
y1 = res['el21.w']
y2 = res['el22.w']
y3 = res['el23.w']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3)
P.legend(['el21.w','el22.w','el23.w'])
P.ylabel('water content (kg/kg)')
P.xlabel('Time (s)')
P.show()
