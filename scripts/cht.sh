#!/bin/bash

languages=`echo "c cpp java javascript typescript nodejs rust" | tr ' ' '\n'`
core_utils=`echo "grep find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils\n" | fzf`
read -p "query: " query

if printf $languages | grep -qs $selected; then
	echo "languages"
else
	echo "core_utils"
fi

