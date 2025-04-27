#!/bin/bash

# Ensure destination directories exist
mkdir -p "$HOME/nulldots/wlogout1" "$HOME/nulldots/hypr" "$HOME/nulldots/ml4w" "$HOME/nulldots/rofi" "$HOME/nulldots/waybar" "$HOME/nulldots/wlogout" "$HOME/nulldots/ohmyposh" "$HOME/nulldots/swaync"

# Sync config files
rsync -a "$HOME/etc/wlogout" "$HOME/nulldots/wlogout1"
rsync -a "$HOME/.config/hypr" "$HOME/nulldots/hypr"
rsync -a "$HOME/.config/ml4w" "$HOME/nulldots/ml4w"
rsync -a "$HOME/.config/rofi" "$HOME/nulldots/rofi"
rsync -a "$HOME/.config/waybar" "$HOME/nulldots/waybar"
rsync -a "$HOME/.config/wlogout" "$HOME/nulldots/wlogout"
rsync -a "$HOME/.config/ohmyposh" "$HOME/nulldots/ohmyposh"
rsync -a "$HOME/.config/swaync" "$HOME/nulldots/swaync"
rsync -a "$HOME/.config/kitty" "$HOME/nulldots/kitty"
rsync -a "$HOME/.config/neofetch" "$HOME/nulldots/neofetch"
rsync -a "$HOME/pkglist.txt" "$HOME/nulldots/requirements.txt" 
rsync -a "$HOME/syncgit.sh" "$HOME/nulldots/syncgit.sh"
# Navigate to nulldots directory
cd "$HOME/nulldots" || { echo "Failed to change directory"; exit 1; }

# Add, commit, and push changes
git add .
git commit -m "Synced config files automatically using script [$(date '+%Y-%m-%d %H:%M:%S')]"

# Fetch and rebase to avoid merge conflicts before pushing
git fetch origin main
git rebase origin/main

# Push to the main branch
git push origin main

