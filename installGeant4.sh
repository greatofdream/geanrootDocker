# /bin/bash
sourcedir=geant4
builddir=geant4_build
installdir=geant4_install
INSTALL_DATA=ON
datadir=/opt/gentoo/usr/share/geant4/data
if [[ -e $sourcedir ]]
then
	echo "use exist Geant4"
else
	echo "git clone:"
	git clone https://github.com/Geant4/geant4.git
fi
echo "The Geant4 version"
echo `cd $sourcedir && git describe --tags --abbrev=0`
echo "CMake in $builddir and install in $installdir:"
mkdir -p $builddir
mkdir -p $installdir
cd $builddir && cmake -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_GDML=ON  -DGEANT4_INSTALL_DATA=$INSTALL_DATA -DCMAKE_INSTALL_PREFIX=../$installdir ../$sourcedir
make -j16
make install
cd ..
echo "Finish installation."
if [ $INSTALL_DATA == "ON" ]
then
	echo "use the downloaded dataset"
else
	echo "use the exist dataset"
	ln -s $datadir $installdir/share/Geant4/data
	echo "finish link to $datadir"
fi
