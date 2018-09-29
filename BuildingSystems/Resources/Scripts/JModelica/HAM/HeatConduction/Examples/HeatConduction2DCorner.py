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
model_name = 'BuildingSystems.HAM.HeatConduction.Examples.HeatConduction2DCorner'
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

res = myModel.simulate(start_time=0.0, final_time=172800, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# body
# temperatures
y1 = res['ele11.T']
y2 = res['ele12.T']
y3 = res['ele13.T']
y4 = res['ele14.T']
y5 = res['ele15.T']
y6 = res['ele16.T']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5, t, y6)
P.legend(['ele11.T','ele12.T','ele13.T','ele14.T','ele15.T','ele16.T',])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# temperatures
y1 = res['ele21.T']
y2 = res['ele22.T']
y3 = res['ele23.T']
y4 = res['ele24.T']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['ele21.T','ele22.T','ele23.T','ele24.T'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
P.show()
