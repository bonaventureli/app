#!/bin/bash
APPNAME=${0}.app
LIBV=001
LIBNAME=
FROMNAME=001/qt-tcpip/server
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx/bin:$PATH

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cd $APPNAME 	
	#qmake serverTest.pro
	qmake -project
	sed -i "/server.show/d" main.cpp
	sed -i "4iQT += network" $APPNAME.pro
	sed -i "2i#include <QDebug>" server.cpp
	sed -i "11iqDebug() << \"Program Start\";" server.cpp
	sed -i "31iqDebug() << data.toInt();" server.cpp
	sed -i "66iqDebug() << \"Server connection: IPv4: \"+ ipAddress+\"  Port: \"+QString::number(m_server->serverPort());" server.cpp
	#sed -i "66iqDebug() << \"Server connection: \nIPv4: \"+ ipAddress+\"\nPort: \"+QString::number(m_server->serverPort());" server.cpp
(
cat << EOF
TARGET = server
EOF
)>> $APPNAME.pro
	qmake 
	make
	./server
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

