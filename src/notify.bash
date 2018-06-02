#!/bin/sh

####################################################################################
# Bashlight 	: 0.1.2
# Copyright		: 2018, MIT
# Author			: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

####################################################################################
readonly SOUND_RATE=2

# what OS?
case "$(uname)" in
	Darwin)
		readonly SOUND_PATH='/System/Library/Sounds/';
		readonly SOUND_FORMAT='aiff';
		readonly VOICE_RATE=280
		readonly VOICE_TYPE="Bruce"
	;;
	Linux)
		readonly SOUND_PATH='/usr/share/sounds/alsa/';
		readonly SOUND_FORMAT='wav';
	;;
	*)
		readonly PS_SYMBOL=$PS_SYMBOL_OTHER
esac

### sound

# Available sounds on OS X
# Basso			Morse
# Blow			Ping
# Bottle		Pop
# Frog			Purr
# Funk			Sosumi
# Glass			Submarine
# Hero			Tink
function blPlay() {
	if type "afplay" >/dev/null 2>&1 ; then
		if [ -f "$SOUND_PATH$1.$SOUND_FORMAT" ]; then
			afplay -r $SOUND_RATE -v 2 "$SOUND_PATH$1.$SOUND_FORMAT";
		fi
	fi
}

### speak
function blSay() {
	# OS X
	say $1
	if type "say" >/dev/null 2>&1 ; then
		say -r $VOICE_RATE -v $VOICE_TYPE "$@." 2> /dev/null
	fi

	# Ubuntu
	if type "espeak" >/dev/null 2>&1 ; then
		espeak "$@." 2> /dev/null
	fi
}

### beep
function blBeep() {
	echo -e "\a"
}

### notification
if type "osascript" >/dev/null 2>&1 ; then
	function alert() {
		osascript -e "display notification \"$2\" with title \"$1\"";
	}
elif type "notify-send" >/dev/null 2>&1 ; then
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi
