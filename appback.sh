#!/bin/bash
cd ..
case ${1} in
    "upload")
	apt-get install python-pip
	pip install requests
	pip install bypy
	bypy info 
	bypy list
	#bypy downdir
	#bypy compare
	#bypy upload
	;;
    "make")
	tar zcvf app${2}.tgz app
	mkdir tmp
	mv app${2}.tgz tmp
	cd tmp
#	./backup.sh
	bypy upload
	mv app${2}.tgz ..	
	cd ..
	rm -rf tmp
    ;;
    "clean")
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make 20180412A/B/C/or clean \033[0m"
    ;;
esac

