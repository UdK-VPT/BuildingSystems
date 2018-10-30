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
model_name = 'BuildingSystems.Technologies.Chillers.Examples.CompressionChiller'
my_fmu = compile_fmu(model_name, moLibs)

# <codecell> simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 120
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=0, final_time=7200.0, options=opts)

# <codecell> plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# temperatures chiller
y1 = res['senTemEvaIn.T']
y2 = res['senTemEvaOut.T']
y3 = res['senTemConIn.T']
y4 = res['senTemConOut.T']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4)
P.legend(['senTemEvaIn.T','senTemEvaOut.T','senTemConIn.T','senTemConOut'])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# COP chiller
y1 = res['chiller.COP']
P.subplot(2,1,2)
P.plot(t, y1)
P.legend(['chiller.COP'])
P.ylabel('COP (1)')
P.xlabel('Time (s)')
P.show()
