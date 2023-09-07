#!/bin/bash

echo "Converting $1 to PDF..."

IFS='.'

read -ra arr <<< "$1"

fname="$arr"

pandoc -V geometry:margin=1in "$fname".md -o "$fname".pdf

open "$fname".pdf
