# 64-bit compiler
#GCC = x86_64-w64-mingw32-gcc
#GPP = x86_64-w64-mingw32-g++

# 32-bit compiler
GCC = i686-w64-mingw32-gcc
GPP = i686-w64-mingw32-g++

# recipe for test_wrap.cpp
# note that SWIG creates test_wrap.cpp and test.py
_test.pyd: test.o test_wrap.o
	$(GPP) -Wall -Wextra -shared \
	-o _test.pyd test.o test_wrap.o py_parts/libpython27.a

test.o: test.hpp test.cpp
	$(GCC) -c test.cpp

test_wrap.o: test.i test.hpp
	swig -c++ -python -o test_wrap.cpp test.i
	$(GCC) -Ipy_parts -Wall -c test_wrap.cpp

clean:
	rm *.o *.pyc *.pyd 

install: _test.pyd
	rm -rf install
	mkdir install
	cp test.py install
	cp _test.pyd install
