#!/bin/bash
#
# Automated build process for ebt-ui 
# This is not suitable for cross development activity

echo "----- Qt Build script for Raspberry pi ------"
echo "Enter sudo password"
read pass

cd $HOME

export DEBIAN_FRONTEND=noninteractive

echo
echo "############################"
echo "Starting apt-get-update"
date
echo
echo $pass | sudo -S apt-get update
echo $pass | sudo -S apt-get full-upgrade -y

echo $pass | sudo -S apt-get install -y libboost1.71-all-dev libudev-dev libinput-dev libts-dev \
libmtdev-dev libjpeg-dev libfontconfig1-dev libssl-dev libdbus-1-dev libglib2.0-dev \
libxkbcommon-dev libegl1-mesa-dev libgbm-dev libgles2-mesa-dev mesa-common-dev \
libasound2-dev libpulse-dev gstreamer1.0-omx libgstreamer1.0-dev \
libgstreamer-plugins-base1.0-dev  gstreamer1.0-alsa libvpx-dev libsrtp0-dev libsnappy-dev \
libnss3-dev "^libxcb.*" flex bison libxslt-dev ruby gperf libbz2-dev libcups2-dev \
libatkmm-1.6-dev libxi6 libxcomposite1 libfreetype6-dev libicu-dev libsqlite3-dev libxslt1-dev

echo $pass | sudo -S apt-get install -y libavcodec-dev libavformat-dev libswscale-dev \
libx11-dev freetds-dev libsqlite0-dev libpq-dev libiodbc2-dev firebird-dev \
libgst-dev libxext-dev libxcb1 libxcb1-dev libx11-xcb1 libx11-xcb-dev \
libxcb-keysyms1 libxcb-keysyms1-dev libxcb-image0 libxcb-image0-dev libxcb-shm0 libxcb-shm0-dev \
libxcb-icccm4 libxcb-icccm4-dev libxcb-sync1 libxcb-sync-dev libxcb-render-util0 \
libxcb-render-util0-dev libxcb-xfixes0-dev libxrender-dev libxcb-shape0-dev libxcb-randr0-dev \
libxcb-glx0-dev libxi-dev libdrm-dev libxcb-xinerama0 libxcb-xinerama0-dev libatspi2.0-dev \
libxcursor-dev libxcomposite-dev libxdamage-dev libxss-dev libxtst-dev libpci-dev libcap-dev \
libxrandr-dev libdirectfb-dev libaudio-dev libxkbcommon-x11-dev


echo "Installing qtbase and modules"

mainVersion="5.15"
subVersion=".5"

concVersion="$mainVersion$subVersion"
openSource="opensource"

qtbaseFile="qtbase-everywhere-$openSource-src-$concVersion"
qtbaseDir="qtbase-everywhere-src-$concVersion"

qtbaseXZ="$qtbaseFile.tar.xz"
qtbase="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtbaseXZ"


echo $concVersion

if [ -f "$HOME/$qtbaseXZ" ]; then
    echo "qtbase-everywhere-$openSource-src-$concVersion exists."
else 
    echo "$concVersion does not exist."
	wget $qtbase
fi

qtdeclarativeFile="qtdeclarative-everywhere-$openSource-src-$concVersion"
qtdeclarativeDir="qtdeclarative-everywhere-src-$concVersion"

qtdeclarativeXZ="$qtdeclarativeFile.tar.xz"
qtdeclarative="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtdeclarativeXZ"

rm -rf qtdeclarativeFile
if [ -f "$HOME/$qtdeclarativeXZ" ]; then
    echo "qtbase-everywhere-opensource-src-$concVersion exists."
else 
    echo "$concVersion does not exist."
	wget $qtdeclarative
fi


qtquickcontrolsFile="qtquickcontrols-everywhere-$openSource-src-$concVersion"
qtquickcontrolsDir="qtquickcontrols-everywhere-src-$concVersion"

qtquickcontrolsXZ="$qtquickcontrolsFile.tar.xz"
qtquickcontrols="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtquickcontrolsXZ"

rm -rf qtquickcontrolsFile
if [ -f "$HOME/$qtquickcontrolsXZ" ]; then
    echo "$qtquickcontrolsXZ exists."
else 
    echo "$qtquickcontrolsXZ does not exist."
	wget $qtquickcontrols
fi

qtquickcontrols2File="qtquickcontrols2-everywhere-$openSource-src-$concVersion"
qtquickcontrols2Dir="qtquickcontrols2-everywhere-src-$concVersion"

qtquickcontrols2XZ="$qtquickcontrols2File.tar.xz"
qtquickcontrols2="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtquickcontrols2XZ"

rm -rf qtquickcontrols2File
if [ -f "$HOME/$qtquickcontrols2XZ" ]; then
    echo "$qtquickcontrols2XZ exists."
else 
    echo "$qtquickcontrols2XZ does not exist."
	wget $qtquickcontrols2
fi

qtmultimediaFile="qtmultimedia-everywhere-$openSource-src-$concVersion"
qtmultimediaDir="qtmultimedia-everywhere-src-$concVersion"

qtmultimediaXZ="$qtmultimediaFile.tar.xz"
qtmultimedia="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtmultimediaXZ"

rm -rf qtmultimediaFile
if [ -f "$HOME/$qtmultimediaXZ" ]; then
    echo "$qtmultimediaXZ exists."
else 
    echo "$qtmultimediaXZ does not exist."
	wget $qtmultimedia
fi


qtsvgFile="qtsvg-everywhere-$openSource-src-$concVersion"
qtsvgDir="qtsvg-everywhere-src-$concVersion"

qtsvgXZ="$qtsvgFile.tar.xz"
qtsvg="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtsvgXZ"

rm -rf qtsvgFile
if [ -f "$HOME/$qtsvgXZ" ]; then
    echo "$qtsvgXZ exists."
else 
    echo "$qtsvgXZ does not exist."
	wget $qtsvg
fi

qtvirtualkeyboardFile="qtvirtualkeyboard-everywhere-$openSource-src-$concVersion"
qtvirtualkeyboardDir="qtvirtualkeyboard-everywhere-src-$concVersion"

qtvirtualkeyboardXZ="$qtvirtualkeyboardFile.tar.xz"
qtvirtualkeyboard="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtvirtualkeyboardXZ"

rm -rf qtvirtualkeyboardFile
if [ -f "$HOME/$qtvirtualkeyboardXZ" ]; then
    echo "$qtvirtualkeyboardXZ exists."
else 
    echo "$qtvirtualkeyboardXZ does not exist."
	wget $qtvirtualkeyboard
fi


qtgraphicaleffectsFile="qtgraphicaleffects-everywhere-$openSource-src-$concVersion"
qtgraphicaleffectsDir="qtgraphicaleffects-everywhere-src-$concVersion"

qtgraphicaleffectsXZ="$qtgraphicaleffectsFile.tar.xz"
qtgraphicaleffects="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtgraphicaleffectsXZ"

rm -rf qtgraphicaleffectsFile
if [ -f "$HOME/$qtgraphicaleffectsXZ" ]; then
    echo "$qtgraphicaleffectsXZ exists."
else 
    echo "$qtgraphicaleffectsXZ does not exist."
	wget $qtgraphicaleffects
fi

qtwebsocketsFile="qtwebsockets-everywhere-$openSource-src-$concVersion"
qtwebsocketsDir="qtwebsockets-everywhere-src-$concVersion"

qtwebsocketsXZ="$qtwebsocketsFile.tar.xz"
qtwebsockets="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtwebsocketsXZ"

rm -rf qtwebsocketsFile
if [ -f "$HOME/$qtwebsocketsXZ" ]; then
    echo "$qtwebsocketsXZ exists."
else 
    echo "$qtwebsocketsXZ does not exist."
	wget $qtwebsockets
fi

qtwebglpluginFile="qtwebglplugin-everywhere-$openSource-src-$concVersion"
qtwebglpluginDir="qtwebglplugin-everywhere-src-$concVersion"

qtwebglpluginXZ="$qtwebglpluginFile.tar.xz"
qtwebglplugin="https://download.qt.io/archive/qt/$mainVersion/$concVersion/submodules/$qtwebglpluginXZ"

rm -rf qtwebglpluginFile
if [ -f "$HOME/$qtwebglpluginXZ" ]; then
    echo "$qtwebglpluginXZ exists."
else 
    echo "$qtwebglpluginXZ does not exist."
	wget $qtwebglplugin
fi

echo "Modules are installed built each one "
echo "qtbase "
sleep 1

DIR="/usr/local/QtRasp/include/QtCore"

if [ -d "$DIR" ]; then

  echo "qtbase is exist ${DIR}..."
else
	tar xf $HOME/$qtbaseXZ
	cd $HOME/$qtbaseDir
	./configure -opengl es2 -opensource -confirm-license -force-debug-info -prefix /opt/QtRasp -nomake examples -nomake tests -v
	make -j8
	make install
	export QT_SELECT=5
	cd ..
fi

tar xf $HOME/$qtdeclarativeXZ
cd $HOME/$qtdeclarativeDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtquickcontrolsXZ
cd $HOME/$qtquickcontrolsDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtquickcontrols2XZ
cd $HOME/$qtquickcontrols2Dir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..
 
tar xf $HOME/$qtmultimediaXZ
cd $HOME/$qtmultimediaDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..
 
tar xf $HOME/$qtsvgXZ
cd $HOME/$qtsvgDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtvirtualkeyboardXZ
cd $HOME/$qtvirtualkeyboardDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtgraphicaleffectsXZ
cd $HOME/$qtgraphicaleffectsDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtwebsocketsXZ
cd $HOME/$qtwebsocketsDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

tar xf $HOME/$qtwebglpluginXZ
cd $HOME/$qtwebglpluginDir
/opt/QtRasp/bin/qmake
make -j8
make install
cd ..

echo 'All Done!'

cd ~



