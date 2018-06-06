#!/bin/bash
APPNAME=${0}.app
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp 001/appmain/* $APPNAME
	cd $APPNAME 	
	qmake -project
	qmake 
	make
	./buildmain
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

