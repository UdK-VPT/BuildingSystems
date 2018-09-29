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
model_name = 'BuildingSystems.HAM.HeatAndMoistureTransport.Examples.HeatAndMoistureTransport1DNodes'
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

res = myModel.simulate(start_time=0.0, final_time=8640000, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# body
# temperatures
y1 = res['TAmb.port.T']
y2 = res['body.T[2]']
y3 = res['body.T[4]']
y4 = res['body.T[6]']
y5 = res['body.T[8]']
y6 = res['body.T[10]']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5, t, y6)
P.legend(['TAmb.port.T','body.T[2]','body.T[4]','body.T[6]','body.T[8]','body.T[10]',])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# water content
y1 = res['body.w[2]']
y2 = res['body.w[4]']
y3 = res['body.w[6]']
y4 = res['body.w[8]']
y5 = res['body.w[10]']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5)
P.legend(['body.w[2]','body.w[4]','body.w[6]','body.w[8]','body.w[10]'])
P.ylabel('water content (kg/kg)')
P.xlabel('Time (s)')
P.show()
