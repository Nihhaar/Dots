# Start compton
compton --config ~/.config/compton.conf &

# MPD daemon start
mpd &

# Start thunar in daemon mode
thunar --daemon &

# Disable beeping
xset -b

# Set the gamma
xgamma -gamma 1

# Bind common keys
xbindkeys

# Plank
plank &

# Start the bar
(sleep 2s && polybar openbox) &
