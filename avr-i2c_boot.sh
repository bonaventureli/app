#!/bin/bash
APPNAME=${0}-app
VERSION=001
FIRSTNAME=
SECONDNAME=
THIRDNAME=i2c_boot
FROMNAME=001/ember-firmware/Utilities/$THIRDNAME
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir -p $APPNAME/Utilities/$THIRDNAME
	mkdir -p $APPNAME/C++/include
	mkdir -p $APPNAME/C++/include/rapidjson
	cp -r $FROMNAME/* $APPNAME/Utilities/$THIRDNAME
#	cp -r 001/ember-firmware/C++/include/MotorController.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/I2C_Device.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/I_I2C_Device.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/ErrorMessage.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/Logger.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/EventType.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/ICallback.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/EventData.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/Hardware.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/PrinterStatus.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/utils.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/MessageStrings.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/Shared.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/Motor.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/MotorCommand.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/LayerSettings.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/Settings.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/IErrorHandler.h $APPNAME/C++/include
#	cp -r 001/ember-firmware/C++/include/rapidjson/document.h $APPNAME/C++/include/rapidjson
#	cp -r 001/ember-firmware/C++/include/rapidjson/reader.h $APPNAME/C++/include/rapidjson
#	cp -r 001/ember-firmware/C++/include/rapidjson/rapidjson.h $APPNAME/C++/include/rapidjson
#	cp -r 001/ember-firmware/C++/include/rapidjson/* $APPNAME/C++/include/rapidjson
#	cp -r 001/ember-firmware/C++/I2C_Device.cpp $APPNAME/C++
#	cp -r 001/ember-firmware/C++/Logger.cpp $APPNAME/C++
	cp -r 001/ember-firmware/C++/* $APPNAME/C++
	cd $APPNAME/Utilities/$THIRDNAME
	make
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

