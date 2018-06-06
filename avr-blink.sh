#!/bin/bash
APPNAME=blink
LIBV=001

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cd $APPNAME 	
	ino init -t $APPNAME
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

