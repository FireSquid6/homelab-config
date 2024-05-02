#!/usr/bin/env bash


DOTFILES_PATH=/etc/nixos/dotfiles
CREATE_SCRIPT=/etc/nixos/scripts/delete-and-link.sh

$CREATE_SCRIPT $DOTFILES_PATH/bashrc ~/.bashrc  
$CREATE_SCRIPT $DOTFILES_PATH/tmux.conf ~/.tmux.conf  
$CREATE_SCRIPT $DOTFILES_PATH/betterlockscreenrc ~/.config/betterlockscreen/betterlockscreenrc
$CREATE_SCRIPT $DOTFILES_PATH/dunstrc ~/.config/dunst/dunstrc
$CREATE_SCRIPT $DOTFILES_PATH/i3 ~/.config/i3/config
$CREATE_SCRIPT $DOTFILES_PATH/kitty.conf ~/.config/kitty/kitty.conf
$CREATE_SCRIPT $DOTFILES_PATH/lazygit.yml ~/.config/lazygit/config.yml
$CREATE_SCRIPT $DOTFILES_PATH/picom.conf ~/.config/picom/picom.conf
$CREATE_SCRIPT $DOTFILES_PATH/polybar.ini ~/.config/polybar/config.ini
$CREATE_SCRIPT $DOTFILES_PATH/profile ~/.profile
$CREATE_SCRIPT $DOTFILES_PATH/rofi.rasi ~/.config/rofi/config.rasi
$CREATE_SCRIPT $DOTFILES_PATH/starship.toml ~/.config/starship.toml
$CREATE_SCRIPT $DOTFILES_PATH/vimrc ~/.vimrc
$CREATE_SCRIPT $DOTFILES_PATH/waybar.jsonc ~/.config/waybar/config.jsonc
$CREATE_SCRIPT $DOTFILES_PATH/waybar.css ~/.config/waybar/style.css
$CREATE_SCRIPT $DOTFILES_PATH/hyprland.conf ~/.config/hypr/hyprland.conf
$CREATE_SCRIPT $DOTFILES_PATH/hyprlock.conf ~/.config/hypr/hyprlock.conf
$CREATE_SCRIPT $DOTFILES_PATH/config.fish ~/.config/fish/config.fish

