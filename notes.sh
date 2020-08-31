#!/usr/bin/bash
if [[ $1 == "add" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes add (title)"
		exit 1
	else
		if [[ -e "notes" ]]
		then
			echo ""
		else
			mkdir notes
		fi
		if [[ -e "$2.note" ]]
		then
			echo "File $2 arleady exists!"
			exit 1
		else

		cd notes/$3
		echo "----------">>$2.note
		echo "Title: $2">>$2.note
		echo "Created: `date "+%a, %d %B %Y %H:%M:%S"`">>$2.note
		echo "Author: `whoami`">>$2.note
		if [[ $3 == "" ]]
			then
				echo "Path: `pwd`">>$2.note
			else
				echo "Catalog: $3">>$2.note
		fi
		echo "----------">>$2.note
		echo "">>$2.note
		echo "">>$2.note
		vim $2.note
		fi
	fi
fi
if [[ $1 == "rm" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes rm (title)"
		exit 1
	else
		#if [[ -e "" ]]
		mv notes/$2.note notes-trash
	fi
fi
if [[ $1 == "see" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes see (title)"
		exit 1
	else
		cd notes
		cat $2.note
	fi
fi
if [[ $1 == "ls" ]]
then
		 if [[ $2 == "" ]]
		 then
		 	 echo "Notes:"
		 	 files2=notes/*.note
			 for file in $files2
			 do
			 	 echo $(basename $file)
		  	 done
		 else
                 	 files=notes/$2.note
                 	 echo "--------------------"
                 	 echo "Files in notes/$2:"
                 	 for file in $files
		 	 do
			 	echo $(basename $file)
		 	 done
		 fi
		 if [[ $3 == "--grep" ]]
		 then
		 	grep $4
		 fi
fi
if [[ $1 == "lsinit" ]]
then
		if [[ $2 == "" ]]
		then
			echo "Catalogs:"
			files3=notes/*
			
if [[ $1 == "edit" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes edit (title)"
		exit 1
	else
		cd notes
		vim $2.note
	fi
fi
if [[ $1 == "mv" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes mv (title) (catalog)"
		exit 1
	else
		cd notes
		mv $2.note $3
	fi
fi
if [[ $1 == "rename" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes rename (old title) (new title)"
		exit 1
	else
		cd notes
		mv $2.note $3.note
	fi
fi
if [[ $1 == "init" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes init (catalog name)"
		exit 1
	else
		cd notes
		mkdir $2
	fi
fi
if [[ $1 == "rminit" ]]
then
	if [[ $2 == "" ]]
	then
		echo "Type: notes rminit (catalog name)"
		exit 1
	else
		echo "Are you sure you want to delete the notes folder $2? [Y/n]"
		read;
		case ${REPLY} in
			"Y") cd notes; rm -R $2 ;;
			"n") echo "You have opted out of deleting the $2 directory."; exit 0 ;;
			*) echo "You type answer which does not exist!"; exit 0 ;;
		esac
	fi
fi
if [[ $1 == "rmnotes" ]]
then
	echo 'Are you sure you want to delete all notes and their folders? [Y\n]'
	read;
	case ${REPLY} in
		"Y") rm -R notes; echo "The notes and their folders has been deleted."; exit 0 ;;
		"n") echo "You have canceled the deletion of notes and their folders."; exit 0 ;;
		*) echo "You have canceled the deletion of notes and their folders."; exit 0 ;;
	esac
fi
if [[ $1 == "rmtrash" ]]
then
	echo 'Are you sure you want to delete all in notes trash? [Y\n]'
	read;
	case ${REPLY} in
		"Y") rm -R notes-trash; echo "The notes trash has been deleted."; exit 0 ;;
		"n") echo "You have canceled the deletion of notes trash."; exit 0 ;;
		*) echo "You have canceled the deletion of notes trash."; exit 0 ;;
	esac
fi
if [[ $1 == "" ]]
then
	echo "Type: notes (argument)"
	exit 1
fi
