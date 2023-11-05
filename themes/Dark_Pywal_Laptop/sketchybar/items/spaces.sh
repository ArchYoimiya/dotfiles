#!/usr/bin/env sh

SPACE_ICONS=("" "" "" "" "" "" "7" "8" "9" "10" "11" "12" "13" "14" "15")

# Destroy space on right click, focus space on left click.

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                               \
             --set space.$sid associated_space=$sid                         \
                              icon=${SPACE_ICONS[i]}                        \
                              icon.padding_left=10                          \
                              icon.padding_right=10                         \
                              background.padding_left=2                     \
                              background.padding_right=2                    \
                              icon.color=$C3								\
                              icon.highlight_color=$C4  	                \
                              icon.y_offset=1 								\
                              icon.background.y_offset=-13       			\
                              icon.background.height=2           			\
                              icon.background.color=$C4			  			\
                              icon.background.corner_radius=15				\
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.drawing=off                             \
                              script="$PLUGIN_DIR/space.sh"                 \
            --subscribe       space.$sid mouse.clicked
done


