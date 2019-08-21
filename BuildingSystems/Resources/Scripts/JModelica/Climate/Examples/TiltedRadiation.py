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
model_name = 'BuildingSystems.Climate.Examples.TiltedRadiation'
my_fmu = compile_fmu(model_name, moLibs)

# simulate the fmu and store results
from pyfmi import load_fmu

myModel = load_fmu(my_fmu)

opts = myModel.simulate_options()
opts['solver'] = "CVode"
opts['ncp'] = 480
opts['result_handling']="file"
opts["CVode_options"]['discr'] = 'BDF'
opts['CVode_options']['iter'] = 'Newton'
opts['CVode_options']['maxord'] = 5
opts['CVode_options']['atol'] = 1e-5
opts['CVode_options']['rtol'] = 1e-5

res = myModel.simulate(start_time=1.728e7, final_time=1.7539e7, options=opts)

# plotting of the results
import pylab as P
fig = P.figure(1)
P.clf()
# Direct radiation
y1 = res['radiationFixed.radiationPort.IrrDir']
y2 = res['radiationOneAxisTracked.radiationPort.IrrDir']
t = res['time']
P.subplot(3,1,1)
P.plot(t, y1, t, y2)
P.legend(['radiationFixed.radiationPort.IrrDir','radiationOneAxisTracked.radiationPort.IrrDir'])
P.ylabel('Radiation (W/m2)')
P.xlabel('Time (s)')
# Tilt angle
y1 = res['radiationFixed.angleDegTil']
y2 = res['radiationOneAxisTracked.angleDegTilTracked']
P.subplot(3,1,2)
P.plot(t, y1, t, y2)
P.legend(['radiationFixed.angleDegTil','radiationOneAxisTracked.angleDegTilTracked'])
P.ylabel('Angle (degree)')
P.xlabel('Time (s)')
# Azimut and height angle of the sun
y1 = res['radiationFixed.angleDegAziSun']
y2 = res['radiationFixed.angleDegHeightSun']
P.subplot(3,1,3)
P.plot(t, y1, t, y2)
P.legend(['radiationFixed.angleDegAziSun','radiationFixed.angleDegHeightSun'])
P.ylabel('Angle (degree)')
P.xlabel('Time (s)')
P.show()
