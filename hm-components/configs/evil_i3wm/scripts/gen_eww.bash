#!/usr/bin/env bash

ARGS=$(getopt -o w:m: --longoptions widgets:,monitors: -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

WIDGETS_FILE=""
MONITORS_SCRIPT=""

eval set -- "$ARGS"
while [ : ]; do
    case "$1" in
        -w | --widgets)
            if [[ -f "$2" ]]; then
                WIDGETS_FILE="$2"
            fi
            shift 2
            ;;
        -m | --monitors)
            if [[ -f "$2" ]]; then
                MONITORS_SCRIPT="$2"
            fi
            shift 2
            ;;
        --) shift;
            break
            ;;
    esac
done

cat $WIDGETS_FILE
printf "\n\n"

mapfile -t monitors < <(bash $MONITORS_SCRIPT)

for monitor in $(echo "${monitors[*]}")
do
    marr=($(echo $monitor | awk '{str=$1; gsub(":", " ", str); print str}'))
    printf "(defwindow topbar :monitor %s\n" ${marr[0]}
    printf "                  :windowtype \"dock\"\n"
    printf "                  :geometry (geometry :x \"0%%\"\n"
    printf "                                      :y \"0%%\"\n"
    printf "                                      :width \"90%%\"\n"
    printf "                                      :height \"10px\"\n"
    printf "                                      :anchor \"top center\"\n"
    printf "                            )\n"
    printf "                  :wm-ignore false\n"
    printf "                  :reserve (struts :side \"top\" :distance \"4%%\")\n"
    printf "  (topbar :screen %s)\n" ${marr[0]}
    printf ")\n\n"

    printf "(defwindow bottombar :monitor %s\n" ${marr[0]}
    printf "                     :windowtype \"dock\"\n"
    printf "                     :geometry (geometry :x \"0%%\"\n"
    printf "                                         :y \"0%%\"\n"
    printf "                                         :width \"90%%\"\n"
    printf "                                         :height \"10px\"\n"
    printf "                                         :anchor \"bottom center\"\n"
    printf "                               )\n"
    printf "                     :wm-ignore false\n"
    printf "                     :reserve (struts :side \"bottom\" :distance \"4%%\")\n"
    printf "  (bottombar :screen %s)\n" ${marr[0]}
    printf ")\n\n"
done
