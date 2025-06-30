#!/usr/bin/env bash

pactl list sources | grep -E 'node.name|alsa.card_name' | awk '{gsub(/"/, ""); for(i = 3;i < NF;i++) printf $i " "; print $NF}' | perl -pe 's/\n/::/ if $. % 2 == 1' | grep alsa_input
