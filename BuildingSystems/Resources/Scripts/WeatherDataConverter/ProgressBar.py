
import sys

class Spinner(list):
    """list that behaves like a ring buffer,
    next() gives the next element, starting over
    when done"""

    def __init__(self, *arg, **kwarg):
        list.__init__(self, *arg, **kwarg)
        self._index = -1

    def next(self):
        if self._index < (len(self)-2):
            self._index += 1
        else:
            self._index = 0
        return self[self._index]


class TxtScale:
    def __init__(self, width=40, template='[%s%c%s] % 10g |',
                 arrow='^', leftSign='-', rightSign='-',
                 minVal=0.0, maxVal=1.0):
        self.width = width
        self.template = template
        self.arrow = arrow
        self.leftSign = leftSign
        self.rightSign = rightSign
        self.minVal = minVal
        self.maxVal = maxVal

    def set(self, val, *args):
        v = max(min(val, self.maxVal), self.minVal)
        i = (int(round(self.width * (v - self.minVal)/(self.maxVal-self.minVal))) or 1) - 1
        j = self.width-i-1
        sys.stdout.write('\r')
        sys.stdout.write(self.template % ((self.leftSign*i, self.arrow,
                                           self.rightSign*j, val)+args))
        sys.stdout.flush()

    def clear(self):
        sys.stdout.write('\r')
        sys.stdout.flush()

if __name__ == '__main__':
    import time, math
    def test1():
        print "This is a scale:"
        s = TxtScale(10, minVal=-1.0, maxVal=1.0, template='<%s%c%s> x = % 10g')
        for i in range(100):
            s.set(math.sin(i/10.0))
            time.sleep(0.05)
        print

    def test2():
        print "This is a progress bar:"
        p = TxtScale(40, minVal=0.0, maxVal=100.0,
                     leftSign='#', arrow='#', rightSign=' ',
                     template= '|%s%c%s| % 3d%% | %s')
        for i in range(101):
            p.set(i, (i < 100) and 'Running' or 'Done   \n')
            time.sleep(0.05)

    def test3():
        print "This is a progress bar with a spinner:"
        p = TxtScale(40, minVal=0.0, maxVal=100.0,
                     leftSign='#', arrow='#', rightSign=' ',
                     template= '|%s%c%s| % 3d%% %c')
        x = Spinner('|/-\\')
        #x = Spinner(' .o0O0o.')
        for i in range(101):
            p.set(i, x.next())
            time.sleep(0.05)
        print
    test1()
    test2()
    test3()
    
