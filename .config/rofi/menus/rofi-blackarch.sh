#!/bin/bash

Y_OFFSET=1	# vertical position in lines
MAX_LINES=20
DISABLE_CAT_INPUTLINE="#mainbox {children: [ listview ];}"	# unset it to have input line on categories
# DISABLE_CAT_INPUTLINE=""

TITLE="BlackArch Menu"

# new line separated list

ba_cat=$(grep Categories /usr/share/applications/ba-*.desktop \
	| cut -d'=' -f2 \
	| sed 's/;/\n/g' \
	| LC_COLLATE=POSIX sort --ignore-case --unique \
	| sed -e 's/X-BlackArch-CodeAnalysis/CodeAnalysis/g' -e 's/X-BlackArch-Cracking/Cracking/g' -e 's/X-BlackArch-Defensive/Defensive/g' -e 's/X-BlackArch-Exploitation/Exploitation/g' -e 's/X-BlackArch-Forensic/Forensic/g' -e 's/X-BlackArch-Malware/Malware/g' -e 's/X-BlackArch-Networking/Networking/g' -e 's/X-BlackArch-Scanning/Scanning/g' -e 's/X-BlackArch-Sniffing/Sniffing/g' -e 's/X-BlackArch-Telephony/Telephony/g' -e 's/X-BlackArch-Website/Website/g' -e 's/X-BlackArch-Wireless/Wireless/g')

menulist="$ba_cat"

# determine max category name length

set -- $menulist
maxlength=1
while [ $# -gt 0 ] ; do
	if [ ${#1} -gt $maxlength ] ; then
		maxlength=${#1}
	fi
	shift
done
 
maxlength=$(($maxlength+8))
#maxlength=18
while true; do
	category=$(echo "$menulist" \
		| rofi 	-dmenu \
			-i \
            -width 20 \
			-no-custom \
			-select "$category" \
			-p "$TITLE" \
		| awk '{print $1}')

	if [ -z "$category" ] ; then
		exit
	fi

	# determine vertical position of submenu
	yoffset=$Y_OFFSET
	set -- $menulist
	while [ "$category" != "$1" ] ; do
		yoffset=$(($yoffset+1))
		shift
	done
		yoffset=$(($yoffset/2+1))

	sleep 0.15	# pause to avoid instant menu closing with mouse
	
	command=$(rofi	-modi drun \
			-show drun \
			-drun-match-fields categories,name \
            -filter "BlackArch $category " \
			-run-command "echo {cmd}" \
            -run-shell-command "echo {terminal} -e {cmd}" \
			-no-sidebar-mode)

	if [ -n "$command" ] ; then
		eval "$command" &
		exit
	fi
done
