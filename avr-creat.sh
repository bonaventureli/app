#!/bin/bash
APPNAME=${0}.app
LIBV=001
LIBNAME=libusart
FROMNAME=001/B9Creator/Root/B9Creator

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cd $APPNAME 	
	ino init
	ino build
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

