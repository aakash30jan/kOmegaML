#!/bin/bash
#Tested only for OpenFOAM version 5.x

echo "Please make sure that your install location is $HOME/OpenFOAM/"

#load the environment #of5x
source $HOME/OpenFOAM/OpenFOAM-5.x/etc/bashrc

#copy from source tar file and compile the library
thiswd=$(pwd)
echo $FOAM_LIBBIN > temp
sed -i s/OpenFOAM-5.x/$USER-5.x/g temp
mkdir -p $(<temp)
mkdir -p $WM_PROJECT_USER_DIR/src/TurbulenceModels/turbulenceModels/RAS/
cp kOmegaML_OF5x.tar $WM_PROJECT_USER_DIR/src/TurbulenceModels/turbulenceModels/RAS/
cd $WM_PROJECT_USER_DIR/src/TurbulenceModels/turbulenceModels/RAS/
tar -xvf kOmegaML_OF5x.tar
cd kOmegaML
wmake libso
cd $thiswd
rm temp
echo "Success !"

#Note: It is IMPORTANT to keep the above mentioned directory structure

