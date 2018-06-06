#!/bin/bash
APPNAME=${0}.app
FROMNAME=001/ember-firmware/AVR/MotorController
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir -p $APPNAME/AVR/MotorController
	mkdir -p $APPNAME/C++/include
	cp -r $FROMNAME/* $APPNAME/AVR/MotorController
	cp -r 001/ember-firmware/C++/include/MotorController.h $APPNAME/C++/include
	cd $APPNAME/AVR/MotorController
	make
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

