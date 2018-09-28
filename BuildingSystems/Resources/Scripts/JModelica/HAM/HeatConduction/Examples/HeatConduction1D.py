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
model_name = 'BuildingSystems.HAM.HeatConduction.Examples.HeatConduction1D'
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
y1 = res['TAmb.port.T']
y2 = res['body1.T']
y3 = res['body2.T']
y4 = res['body3.T']
y5 = res['body4.T']
y6 = res['body5.T']
t = res['time']
P.subplot(2,1,1)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5, t, y6)
P.legend(['TAmb.port.T','body1.T','body2.T','body3.T','body4.T','body5.T',])
P.ylabel('Temperature (K)')
P.xlabel('Time (s)')
# heat flows
y1 = res['body1.heatPort_x1.Q_flow']
y2 = res['body2.heatPort_x1.Q_flow']
y3 = res['body3.heatPort_x1.Q_flow']
y4 = res['body4.heatPort_x1.Q_flow']
y5 = res['body5.heatPort_x1.Q_flow']
P.subplot(2,1,2)
P.plot(t, y1, t, y2, t, y3, t, y4, t, y5)
P.legend(['body1.heatPort_x1.Q_flow','body2.heatPort_x1.Q_flow','body3.heatPort_x1.Q_flow','body4.heatPort_x1.Q_flow','body5.heatPort_x1.Q_flow'])
P.ylabel('power (W)')
P.xlabel('Time (s)')
P.show()
