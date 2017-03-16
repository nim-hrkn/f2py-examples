
FC = gfortran

F2PY = f2py -c --fcompiler=gfortran

all: mylib.so  mymod.so  myext.so 

mylib.so: mylib.f90
	$(F2PY) -m mylib mylib.f90

mymod.so: mymod.f90 
	$(F2PY) -m mymod mymod.f90

# m_ext.mod is necessary, so I add m_ext.o 
myext.so: myext.f90  m_ext.o
	$(F2PY) -m myext myext.f90  m_ext.f90
# $(F2PY) -m myext myext.f90  m_ext.o fails. 

m_ext.o : m_ext.f90 
	$(FC) -o $@ -c m_ext.f90 

clean:
	rm -f *.so  *.o  *.mod *.pyc
