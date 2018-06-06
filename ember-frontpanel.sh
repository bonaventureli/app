#!/bin/bash
APPNAME=${0}.app
LIBV=001
LIBNAME=FrontPanel
FROMNAME=001/ember-firmware/AVR/FrontPanel

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cd $APPNAME 	
	make
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

