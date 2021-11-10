# /bin/bash
sourceUrl=http://cern.ch/geant4-data/releases/geant4.10.06.p03.tar.gz
sourceTar=geant4.tar.gz
if[ ! -f $sourceTar ];then
	wget $sourceUrl -O $sourceTar
	tar -xvf $sourceTar
fi
mkdir -p /opt/geant4-build
cd geant4-build
cmake -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_RAYTRACER_X11=ON -DGEANT4_USE_GDML=ON  -DGEANT4_INSTALL_DATA=ON ../geant4.10.06.p0
cmake ../geant4
make -j8
make install

