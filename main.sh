#!/bin/bash

function path_file(){
	echo "Enter path: "
	read path
	cd $path
	ls
	echo "Enter file name: "
	read filename
}

function create_file(){
	path_file
	touch $filename
}

function view_file(){
	path_file
	more $filename
}

function edit_file(){
	path_file
	nano $filename
}

function move_file(){
	path_file
	echo "A path where you want to move: "
	read path
	mv $filename $path
}

function archive_tar(){
	path_file
	echo "1. Archive"
	echo "2. Unarchive"
	read choice
	if [ "$choice" -eq 1 ]; then
		echo "Enter archive name: "
		read archive_name
		tar -czvf $archive_name $filename
	elif [ "$choice" -eq 2 ]; then
		tar -xvzf $filename
	fi
}
function zip_file(){
	path_file
	echo "1. Zip"
	echo "2. Unzip"
	read choice
	if [ "$choice" -eq 1 ]; then
		echo "Enter archive name: "
		read archive_name
		zip $archive_name $filename
	elif [ "$choice" -eq 2 ]; then
		unzip $filename
	fi
}

function main(){
	echo "1. Create file"
	echo "2. View file"
	echo "3. Edit file"
	echo "4. Move file"
	echo "5. Open any program"
	echo "6. Delete file"
	echo "7. Archive or unarchive .tar.gz file"
	echo "8. Zip and unzip"
	echo "9. Exit"

	printf "Choose: "
	read choice

	case $choice in
		1)
			create_file
			;;
		2)
			view_file
			;;
		3)
			edit_file
			;;
		4)
			move_file
			;;
		5)
			echo "Enter program name: "
			read prog
			$prog
			;;
		6)
			path_file
			rm $filename
			;;
		7)
			archive_tar
			;;
		8)
			zip_file
			;;
		9)
			read -p "Press [Enter] key to end program..."
			;;
		*)
			echo "Incorrect symbol"
			;;
	esac
}

main
