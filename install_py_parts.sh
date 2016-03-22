# A Python27 .msi file.  Pick one, but it needs to be 64-bit.
MSI_FILE=python-2.7.11.amd64.msi

# 32-bit
#DLLTOOL=/usr/i686-w64-mingw32/bin/dlltool

# 64-bit
DLLTOOL=/usr/x86_64-w64-mingw32/bin/dlltool

# put everyting in py_parts/
rm -r py_parts
mkdir py_parts
cd py_parts

# Get Python27 .msi, pick one or try this one.  It needs to be 64-bit:
wget https://www.python.org/ftp/python/2.7.11/$MSI_FILE
#cp ~/Downloads/$MSI_FILE .

# extract
cabextract $MSI_FILE -F '*.h'
cabextract $MSI_FILE -F 'python27.dll'

# create the python27.def file
../pexports-0.47/pexports -v python27.dll > python27.def

# create the python27.a file
$DLLTOOL -A --dllname python27.dll --def python27.def --output-lib libpython27.a

