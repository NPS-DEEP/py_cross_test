# py_cross_test
Test code to help work out cross-compiling Python27 bindings for Windows.

This approach is largely based on http://stackoverflow.com/questions/32361119/error-when-trying-to-cross-compile-swig-python-extension-for-mingw32-using-distu

Setup for Fedora 20:

1) Install MinGW: Run all or parts of `simsong/bulk_extractor/src_win/CONFIGURE_FC20.sh`

2) Install cabextract and SWIG:

    sudo yum install cabextract
    sudo yum install swig

2) Install the `pexports` tool required for extracting parts of python27.dll:

    ./install_pexports.sh

3) Create all the requisite Python parts and put them in `py27_dir/`:

    ./install_py_parts.sh

4) Compile everything for the test including `_test.dll`:

    make

5) Copy test module files and tester.py to Windows.

6) On Windows, run `tester.py` to see if "hello world" shows up:

    ./tester.py

