
# coding: utf-8

# # explanation #
# mylib.f90 uses subroutines.
# ![structure](img/fig_mymod.png)
# 
# ## fortran directive ##
# f2py reads !f2py directives in fortran
# ```
# subroutine apb(n,a,b,c)
#   implicit none
#   integer n
#   real(8) a(n,n)
#   real(8) b(n,n)
#   real(8) c(n,n)
#   !f2py intent(in) n
#   !f2py intent(in) a
#   !f2py intent(in) b
#   !f2py intent(out) c
# ```
# 
# ## python side ##
# Then 
# ```
# c = mylib.apb(a,b)
# ``` 
# in python. 
# 
# ## \_\_doc__##
# I recommend to type mylib.apb.\_\_doc__ before writing the code. It shows the interface like
# ```
# c = apb(a,b,[n])
# 
# Wrapper for ``apb``.
# 
# Parameters
# ----------
# a : input rank-2 array('d') with bounds (n,n)
# b : input rank-2 array('d') with bounds (n,n)
# 
# Other Parameters
# ----------------
# n : input int, optional
#     Default: shape(a,0)
# 
# Returns
# -------
# c : rank-2 array('d') with bounds (n,n)
# ```
# You can see that the variable 'n' is an optional variable in calling inpython. The interface isn't the same as the fortran subroutine definition.

# In[3]:

import numpy as np
import numpy as np
import inspect
import mylib


# In[4]:

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
    print mylib.vavbmc.__doc__
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

def test4():
    print
    print "subroutine",inspect.currentframe().f_code.co_name
    print "calling np.array"
    print "check the order of the array, row major or column major"
    print "change n1 in mylib.nparraytest. an error occurs unless n1=3."
    coords = []
    n = 5
    for i in range(n):
       coords.append( [ float(i), float(i+0.1),float(i+0.2) ] )
    coords = np.array(coords)
    print "shape=",coords.shape
    print "coords"
    for i in range(n):
       print coords[i,0:3]
    # execute tranpose = .T
    coords2 = mylib.nparraytest(coords.T).T

    print "coord2"
    for i in range(n):
       print coords2[i,0:3]

def test5():
    print
    print "subroutine",inspect.currentframe().f_code.co_name
    print "calling np.array"
    coords = []
    n = 5
    for i in range(n):
       coords.append( [ float(i), float(i+0.1),float(i+0.2) ] )
    coords = np.array(coords)
    print "shape=",coords.shape
    print "coords"
    for i in range(n):
       print coords[i,0:3]
     
    coords2 = mylib.nparraytest2(coords)

    print "coord2"
    for i in range(n):
       print coords2[i,0:3]

if __name__ == "__main__":
    test1()
    test2()
    test3()
    
    test4()
    test5()


# In[ ]:



