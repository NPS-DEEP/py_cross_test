
# recipe for test_wrap.cpp
# note that SWIG creates test_wrap.cpp and test.py
test.dll: test.o test_wrap.o
	x86_64-w64-mingw32-gcc -I../py_parts -Wall -Wextra -shared \
	-o _test.pyd test.o test_wrap.o ../py_parts/libpython27.a

test.o: test.hpp test.cpp
	x86_64-w64-mingw32-gcc -c test.cpp

test_wrap.o: test.i test.hpp
	swig -c++ -python -o test_wrap.cpp ../../python_bindings/test.i
	x86_64-w64-mingw32-gcc -c test_wrap.cpp

clean:
	rm *.o 
