#!/bin/bash
APPNAME=${0}.app
LIBV=001
FROMNAME=001/print-web-sample
case ${1} in
    "update")
	apt-get install node-gyp
	apt-get install npm
	npm install -g bower
	npm install -g gulp
	;;
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cd $APPNAME 	
	cp server/config.example.js server/config.js
	cd server
	npm install
	node server.js
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

