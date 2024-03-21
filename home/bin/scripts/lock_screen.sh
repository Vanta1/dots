source ~/.config/herbstluftwm/themes/everforest.sh

bg=$(cat ~/.fehbg | cut -d " " -f 4 | awk 'NR==2 {print substr($0, 2, length($0) - 2)}')
i3lock -c $bg_dim \
    --noinput-text="" --wrong-text="" --verif-text="" \
    --radius 120 --ring-width 40 \
    --inside-color=00000000 --insidever-color=00000000 --insidewrong-color=00000000 --line-color=00000000 \
    --ring-color=$green --ringver-color=$purple --ringwrong-color=$red \
    --keyhl-color=$bg_green --bshl-color=$red --separator-color=00000000 \
    --no-modkey-text
#    -i $bg -F  \
#    --force-clock \
#    --time-font="Fira Code" --date-font="Fira Code" --layout-font="Fira Code" --verif-font="Fira Code" --wrong-font="Fira Code" --greeter-font="Fira Code" \
#    --timeoutline-width=0 --dateoutline-width=0 --layoutoutline-width=0 --verifoutline-width=0 --wrongoutline-width=0 --greeteroutline-width=0 --modifieroutline-width=0 \ 
#    --no-modkey-text \


#    --timeoutline-color=232a2e00 --dateoutline-color=232a2e00 --layoutoutline-color=232a2e00 --verifoutline-color=232a2e00 --wrongoutline-color=232a2e00 --greeteroutline-color=232a2e00 --modifoutline-color=232a2e00 \
