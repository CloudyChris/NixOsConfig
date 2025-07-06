#!/usr/bin/env bash

xrandr --listactivemonitors | awk '/^ [0123456789]/' | awk '{ number = $1; name = $4; restr = $3; gsub(":", "", number); gsub("x", " ", restr); gsub("/", " ", restr); gsub("+", " ", restr); print number " " name " " restr }' | awk '{print $1 "::" $2 "::" $3 "::" $5 "::" $7 "::" $8}'
