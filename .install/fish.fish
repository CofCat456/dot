#!/usr/bin/env fish

echo "Installing z"
fisher install jethrokuan/z

# install plugins
echo "Installing a theme for fish"
fisher install IlanCosman/tide@v6

echo "Installing nvm"
fisher install jorgebucaran/nvm.fish

echo "Installing fzf"
fisher install PatrickF1/fzf.fish

echo "Installing autopair"
fisher install jorgebucaran/autopair.fish
