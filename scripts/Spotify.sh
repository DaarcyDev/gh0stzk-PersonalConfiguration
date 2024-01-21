#!/usr/bin/env bash
songName=$(spotifyctl status --format '%artist%: %title%' 2>&1)
playStatus=$(playerctl status 2>/dev/null)

getName() {

	if [[ "$songName" == *"was not provided by any .service files"* ]]; then
		echo ""
	else
		echo "$songName"
	fi
}

getPlayPause() {
	if [[ "$songName" == *"was not provided by any .service files"* ]]; then
		echo "  "
	elif [[ "${playStatus}" == "Playing" ]]; then
		echo "  "

	elif [[ "${playStatus}" == "Paused" ]]; then
		echo "  "
	fi
}
getNext() {
	if [[ "$songName" == *"was not provided by any .service files"* ]]; then
		echo "  "
	else
		echo ""
	fi
}
getPrevious() {
	if [[ "$songName" == *"was not provided by any .service files"* ]]; then
		echo "  "
	else
		echo ""
	fi
}

case "$1" in
--getName)
	getName
	;;
--getPlayPause)
	getPlayPause
	;;
--getNext)
	getNext
	;;
--getPrevious)
	getPrevious
	;;
*)
	echo "Error: Opción no válida. Usa --getName para obtener el nombre de la canción."
	;;
esac
