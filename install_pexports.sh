# get pexports
wget https://sourceforge.net/projects/mingw/files/MinGW/Extension/pexports/pexports-0.47/pexports-0.47-mingw32-src.tar.xz

tar xf pexports-0.47-mingw32-src.tar.xz

cd pexports-0.47
./configure
make
cd ..
# now we have the pexports tool at pexports-0.47/pexports

