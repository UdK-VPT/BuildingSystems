#!/usr/bin/env python
# encoding: utf-8
# version:  2.7
# author:   Joerg Raedler <jr@j-raedler.de>
# license:  GPL v2
# last modified: 2016-11-09 by Alexander Inderfurth

import numpy

try:
    from pupynere import netcdf_file
    ncOk = True
except ImportError:
    ncOk = False

version = 2.7
file_format  = 3


# { name : (shortname, typestring, conversion func.), ...}
variables = {'time'             : ('hy',     'i', 's',     lambda v: (v-0.5)*3600.0),
        'air_pressure'     : ('p',      'f', 'hPa',   lambda v: v),
        'air_temperature'  : ('Ta',     'f', 'C',     lambda v: v),
        'relative_humidity': ('RH',     'f', '%',     lambda v: 0.01*v),
        'beam_radiation'   : ('G_Bh',   'f', 'W/m^2', lambda v: v),
        'diffuse_radiation': ('G_Dh',   'f', 'W/m^2', lambda v: v),
        'cloud_cover'      : ('N',      'f', '1/8',   lambda v: v),
        'wind_speed'       : ('FF',     'f', 'm/s',   lambda v: v),
        'wind_direction'   : ('DD',     'f', 'deg',   lambda v: v)}


mnHelpText = u"""Generate a file with Meteonorm:
1. Choose location
2. Choose models and parameters
3. Set output format to "User defined"
4. Select the following variables in arbitrary order:
   Hour of the year
   Air pressure
   Air temperature
   Relative humidity
   Direct radiation, horiz.
   Diffuse radiation horizontal
   Cloud cover fraction
   Wind speed
   Wind direction
5. Use the units: W/m2, °C, m/s and hPa
6. Activate "Header" and use "Tab" as hyphen
7. You may save the format for later use
8. Calculate values, save hourly values to a file
9. Call this script with the file as argument
"""

def progressDummy(p):
    pass


def readMnFile(fn, progress=progressDummy):
    r = {'source_file': fn}
    progress(0)
    tmp = open(fn, 'r')
    ### read header lines
    l = tmp.readline()
    if l.startswith('"'):
        mnVersion = 5
        r['name'] = l.replace('"', '').strip()
        v = tmp.readline().strip().split(',')
    else:
        mnVersion = 6
        r['name'] = l.strip()
        v = tmp.readline().strip().replace(',', '.').split()
    r['latitude']  = float(v[0])
    r['longitude'] = float(v[1])
    r['height']    = int(v[2])
    r['timezone']  = int(v[3])
    tmp.readline()
    head = tmp.readline()
    # workaround for some changes between meteonorm versions
    head = head.replace('H_Dh', 'G_Dh')
    head = head.replace('H_Bh', 'G_Bh')
    head = head.replace('<', '')
    head = head.replace('>', '')
    head = head.split()
    # test for all needed variables
    for v in variables.values():
        if not v[0] in head:
            raise Exception("Could not find variable %s in file!" % v[0])
    ### read data matrix
    data = []
    lines = tmp.readlines()
    tmp.close()
    progress(10)
    nlines = len(lines)
    oldprg = 0
    for i in range(nlines):
        l = lines[i].strip()
        if len(l) > 0 and not l[0] == '#':
            l = l.replace(',', '.')
            data.append([float(v) for v in l.split()])
        prg = int(10 + 40 * float(i)/nlines)
        if prg != oldprg:
            progress(prg)
            oldprg = prg
    a = numpy.array(data)
    progress(70)
    ### data conversion
    a = numpy.resize(a, (a.shape[0]+1, a.shape[1]))
    nvariables = len(variables)
    i = 1
    for n in variables.keys():
        shortname, tc, unit, cvt = variables[n]
        col = head.index(shortname)
        d =  cvt(a[:,col])
        ## periodic end
        if n == 'time':
            d[-1] = d[-2] + (d[1]-d[0])
        else:
            d[-1] = d[0]
        prg = int(70 + 30 * float(i)/nvariables)
        progress(prg)
        r[n] = d
        i += 1
    return r


def writeNcFile(data, fileName=None, oldStyle=False):
    if not ncOk:
        raise Exception('module pupynere not found, please make sure it is installed, writeNcFile() failed!')
    if not fileName:
        fileName = data['name']+'_weather.nc'
    f = netcdf_file(fileName, 'w')
    f.createDimension('time', data['time'].shape[0])
    f.file_format = file_format
    if oldStyle:
        f.createDimension('scalar', 1)
    if 'comment' in data:
        f.comment = data['comment']
    else:
        f.comment = 'created by MeteonormFile.py (v%s)' % version
    if 'source_file' in data:
        f.source_file = str(data['source_file'])
    for vn in ('latitude', 'longitude', 'height'):
        setattr(f, vn, data[vn])
        if oldStyle:
            v = f.createVariable(vn, 'd', ('scalar', ))
            v[:] = [data[vn]]
    setattr(f, 'longitude_0', 15.0*data['timezone'])
    if oldStyle:
        v = f.createVariable('longitude_0', 'd', ('scalar', ))
        v[:] = [15.0 * data['timezone']]
    for vn in variables.keys():
        t = variables[vn][1]
        v = f.createVariable(vn, t, ('time',))
        v[:] = data[vn].astype(t)
        oname = variables[vn][0]
        if oname.startswith('<'): oname = oname[1:]
        if oname.endswith('>'): oname = oname[:-1]
        v.original_name = oname
        v.unit = variables[vn][2]
        if vn == 'time':
            v.extrapolation = 'periodic'
    f.sync()
    f.close()


def makeStatistics(data):
    if not data['time'].shape[0] == 8761:
        return 'Statistics only available for whole year datasets!'
    t = []
    # check for common problems
    if len(set(data['wind_direction'])) < 15:
        t.append(u'\n*** WARNING: wind direction varies to little, old Meteonorm file?\n')
    if data['longitude'] * data['timezone'] < 0.0:
        t.append(u'\n*** WARNING: longitude and timezone have different signs, old Meteonorm file?\n')
    else:
        if abs(data['longitude'] - 15.0*data['timezone']) > 10.0:
            t.append(u'\n*** WARNING: significant difference between longitude and timezone!\n')
    b = data['beam_radiation']
    d = data['diffuse_radiation']
    t.append(u'Beam radiation (daily):      %.1f Wh/m²d' % (sum(b)/365.0))
    t.append(u'Diffuse radiation (daily):   %.1f Wh/m²d' % (sum(d)/365.0))
    t.append(u'Total radiation (year):      %.1f kWh/m²a' % ((sum(b)+ sum(d))/1000.0))
    t.append(u'Sun hours (beam >120 W/m²):  %d h/a' % len([x for x in b if x>120.0]))
    a = data[u'air_temperature']
    t.append(u'Air temperature (min):       %.1f °C' % min(a))
    t.append(u'Air temperature (max):       %.1f °C' % max(a))
    t.append(u'Air temperature (average):   %.1f °C' % (sum(a)/8761.0))
    t.append(u'Relative humidity (average): %.1f %%' % (sum(data['relative_humidity'])/87.61))
    t.append(u'Wind speed (average):        %.1f m/s' % (sum(data['wind_speed'])/8761.0))
    t.append(u'Wind direction (average):    %.1f °' % (sum(data['wind_direction'])/8761.0))
    return '\n'.join(t)


if __name__ == '__main__':
    import sys
    if len(sys.argv) < 2:
        print ("\nUsage: %s meteonormfile [netcdffile]\n" % sys.argv[0])
        print (mnHelpText)
        sys.exit(1)
    try:
        import ProgressBar
        pb = ProgressBar.TxtScale(40, minVal=0.0, maxVal=100.0,
            leftSign='#', arrow='#', rightSign=' ', template= '>>> |%s%c%s| % 3d%% | %s')
        def progFun(v):
            pb.set(v, (v < 100) and 'Reading' or 'Done   \n')
    except:
        progFun = progressDummy
        print ('>>> Reading ...'),
        sys.stdout.flush()
    data = readMnFile(sys.argv[1], progress=progFun)
    if progFun == progressDummy:
        print ('done!')
    print ('>>> Weather statistics:')
    print (makeStatistics(data))
    if len(sys.argv) > 2:
        fileName = sys.argv[2]
    else:
        fileName = data['name']+'_weather.nc'
    print ('>>> Writing "%s"...' % fileName),
    sys.stdout.flush()
    writeNcFile(data, fileName, False)
    print ('done!')
