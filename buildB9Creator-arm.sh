#!/bin/bash
APPNAME=appB9Creator
FROMNAME=001/B9Creator/Root/B9Creator
REMOVE1="b9layout\/projectdata.h"
REMOVE2="b9layout\/projectdata.cpp"
REMOVE3="qextserialport-1.2beta2\/src"
ADDFILE1="b9edit\/SliceEditView.h"
ADDFILE2="b9edit\/SliceEditView.cpp"
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cp -r 001/B9Creator-arm/* $APPNAME
	cd $APPNAME 	
	rm -rf b9layout
	rm -rf b9slice
	rm -rf b9modelwriter.cpp
	rm -rf b9modelwriter.h
	rm -rf b9supportstructure.cpp
	rm -rf b9supportstructure.h
	qmake -project
	qmake 
	sed -i "9iQT += core gui" $APPNAME.pro
	sed -i "10iQT += svg" $APPNAME.pro
	sed -i "11iQT += opengl" $APPNAME.pro
	sed -i "12iQT += network" $APPNAME.pro
	sed -i "13iunix:!macx: LIBS += -lGLU" $APPNAME.pro
	sed -i "14iunix:!macx: LIBS += -lz" $APPNAME.pro
	sed -i "15i#INCLUDEPATH += b9slice" $APPNAME.pro
	sed -i "16iINCLUDEPATH += b9edit" $APPNAME.pro
	sed -i "17iINCLUDEPATH += b9create" $APPNAME.pro
	sed -i "/$REMOVE1/d" $APPNAME.pro
	sed -i "/$REMOVE2/d" $APPNAME.pro
	sed -i "/$REMOVE3/d" $APPNAME.pro
	sed -i "/$ADDFILE1/d" $APPNAME.pro
	sed -i "/$ADDFILE2/d" $APPNAME.pro
	#sed -i "s/$/lifei/g" $APPNAME.pro
	#sed -i "s/^/lifei/g" $APPNAME.pro
	sed -i "15iinclude(qextserialport-1.2beta2/src/qextserialport.pri)" $APPNAME.pro
	sed -i "48i$ADDFILE1" $APPNAME.pro
	sed -i "88i$ADDFILE2" $APPNAME.pro
	make
	./$APPNAME
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

