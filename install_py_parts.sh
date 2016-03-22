# A Python27 .msi file.  Pick one, but it needs to be 64-bit.
MSI_FILE=python-2.7.10.msi

# put everyting in py_parts/
rm -r py_parts
mkdir py_parts
cd py_parts

# Get Python27 .msi, pick one or try this one.  It needs to be 64-bit:
echo https://www.python.org/ftp/python/2.7.10/$MSI_FILE
wget https://www.python.org/ftp/python/2.7.10/$MSI_FILE

# extract
cabextract python-2.7.10.msi -F '*.h'
cabextract python-2.7.10.msi -F 'python27.dll'

# create the python27.def file
../pexports-0.47/pexports -v python27.dll > python27.def

# create the python27.a file
/usr/i686-w64-mingw32/bin/dlltool -A --dllname python27.dll --def python27.def --output-lib libpython27.a

