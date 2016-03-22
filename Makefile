all:

# recipe for test_wrap.cpp
# note that SWIG creates test_wrap.cpp and test.py
test_wrap.cpp: test.i \
               test.hpp
	swig -c++ -python -o test_wrap.cpp ../../python_bindings/test.i

