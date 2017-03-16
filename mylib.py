import numpy as np
import mylib
import numpy as np
import inspect

def make_vec():
    n = 4
    m = 3
    a1 = np.array(n)
    a1 = []
    for i in range(n):
       a1.append(i+1)
    a1 = np.array(a1)
    b1 = []
    for j in range(m):
       b1.append(j+1)
    b1 = np.array(b1)
    return a1,b1


def test1():
    print 
    print "subroutine",inspect.currentframe().f_code.co_name
    a1,b1 = make_vec()
    print "a=",a1
    print "b=",b1
    print "apply a*b"
    c1 = mylib.vavbmc(a1,b1)
    print "c=",c1
    print 


def make_matrix():
    n = 4
    a1 = np.zeros( (n,n) )
    b1 = np.zeros( (n,n) )
    for i in range(n):
       for j in range(n):
           a1[i,j] = (i+j)*0.1
    for i in range(n):
       for j in range(n):
           b1[i,j] = (i-j)*0.1
    return a1,b1

def test2():
    print 
    print "subroutine",inspect.currentframe().f_code.co_name
    a1,b1 = make_matrix()
    print "a=",a1
    print "b=",b1
    print "apply a+b"
    c1 = mylib.apb(a1,b1)
    print "c1=",c1

def test3():
    print
    print "subroutine",inspect.currentframe().f_code.co_name
    a1,b1 = make_matrix()
    print "a=",a1
    print "b=",b1
    p = 10.0 
    print "apply (a+b)*p, p=",p
    c1 = mylib.apb_p(p, a1,b1)
    print "c1=",c1


if __name__ == "__main__":
    test1()
    test2()
    test3()

