#!/usr/bin/env bash

hello_world()
{
 	echo 'Hello World'
}

usage_del()
{
	echo "del_file [[-f | --file || -q | --quiet file]] to delete file"
}

del_file()
{
	local filename=
	if [ "$#" -gt "0" ]; then
		if [ "$2" = "" ]; then
			usage_del
			return

		else
			while [ "$1" != "" ]; do

				case $1 in
					-f | --file )		shift
										filename="$1"
										;;
					-q | --quiet )		shift
										filename="$1"
										rm $filename
										echo "[$filename] deleted"
										return
										;;
					* )					usage_del
										return
										;;
				esac
				shift
			done
		fi
	else
		usage_del
		return
 	fi

	if [ -e $filename ]; then
		echo "File [$filename] found"

		response=
		echo -n "Do you want to delete [$filename]? [y/n] >"
		read response
		echo "[$filename] deleted"

		if [ "$response" != "y" ]; then
			echo "Okay, exiting program."
			return
		fi

		rm $filename

	else
		echo "File [$filename] not found"

	fi
}

update-system()
{
	cd ~/.config/home-manager
	sudo nixos-rebuild switch --flake
	home-manager switch --flake .


}

detect_shell()
{
if [ "$SHLVL" != "2" ]; then
	nix-shell
fi

}

usage_botty()
{
echo "start_botty [[ -s | --start ] | [ -d | --debug ]]"

}

start_botty()
{
	local path="/mnt//Dokumente/Python/InfinitumBotty"
	if [ "$#" -gt "0" ]; then
		while [ "$1" != "" ]; do
			case $1 in
				-s | --start ) 		if [ pwd != "$path" ]; then
										cd $path
									fi
									./nix-bot-run.sh -r
									return
									;;

				-d | --debug ) 		if [ pwd != "$path" ]; then
										cd $path
									fi
									./nix-bot-run.sh -d
									return
									;;

				* )					usage_botty
									return
									;;
			esac
		done
	else
		usage_botty
	fi


}




