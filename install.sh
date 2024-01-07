#!/usr/bin/env bash

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
	echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
	echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
	echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
	exit 1
}

warning() {
	echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
	echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
	echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
	find -H "$DOTFILES" -maxdepth 3 -name '*.symlink'
}

setup_symlinks() {
	title "Creating symlinks"

	for file in $(get_linkables); do
		target="$HOME/.$(basename "$file" '.symlink')"
		if [ -e "$target" ]; then
			info "~${target#$HOME} already exists... Skipping."
		else
			info "Creating symlink for $file"
			ln -s "$file" "$target"
		fi
	done

	echo -e
	info "installing to ~/.config"
	if [ ! -d "$HOME/.config" ]; then
		info "Creating ~/.config"
		mkdir -p "$HOME/.config"
	fi

	config_files=$(find "$DOTFILES/.config" -maxdepth 1 2>/dev/null)
	for config in $config_files; do
		target="$HOME/.config/$(basename "$config")"
		if [ -e "$target" ]; then
			info "~${target#$HOME} already exists... Skipping."
		else
			info "Creating symlink for $config"
			ln -s "$config" "$target"
		fi
	done
}

setup_homebrew() {
	title "Setting up Homebrew"

	if test ! "$(command -v brew)"; then
		info "Homebrew not installed. Installing."
		# Run as a login shell (non-interactive) so that the script doesn't pause for user input
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash --login
	fi

	# install brew dependencies
	sh $DOTFILES/.install/brew.sh

	success "Setting up Homebrew Done."
}

setup_fish() {
	title "Setting up Fish"

	if test ! "$(command -v fish)"; then
		info "Fish not installed. Installing."
		brew install fish
	fi

	title "Add fish to the know shells run the command"
	sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'

	title "Set fish as the default shell"
	chsh -s /opt/homebrew/bin/fish

	if [ ! -f ~/.config/fish/functions/fisher.fish ]; then
		info "Fisher not installed. Installing."
		# Run as a login shell (non-interactive) so that the script doesn't pause for user input
		curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
	fi

	# install fish dependencies
	/opt/homebrew/bin/fish $DOTFILES/.install/fish.fish

	success "Setting up Fish Done."
}

setup_npm() {
	title "Setting up Npm"

	if test ! "$(command -v npm)"; then
		info "nvm not installed. Installing."
		nvm install lts
		nvm use lts
	fi

	title "Installing npm packages"

	# install plugins
	/opt/homebrew/bin/fish $DOTFILES/.install/npm.fish

	success "Setting up Npm Done."
}

setup_git() {
	title "Setting up Git"

	defaultName=$(git config user.name)
	defaultEmail=$(git config user.email)
	defaultGithub=$(git config github.user)

	read -rp "Name [$defaultName] " name
	read -rp "Email [$defaultEmail] " email
	read -rp "Github username [$defaultGithub] " github

	git config -f ~/.gitconfig-local user.name "${name:-$defaultName}"
	git config -f ~/.gitconfig-local user.email "${email:-$defaultEmail}"
	git config -f ~/.gitconfig-local github.user "${github:-$defaultGithub}"

	if [[ "$(uname)" == "Darwin" ]]; then
		git config --global credential.helper "osxkeychain"
	else
		read -rn 1 -p "Save user and password to an unencrypted file to avoid writing? [y/N] " save
		if [[ $save =~ ^([Yy])$ ]]; then
			git config --global credential.helper "store"
		else
			git config --global credential.helper "cache --timeout 3600"
		fi
	fi

	success "Setting up Git Done."
}

setup_vscode() {
	title "Setting up VS Code"

	info "Creating symlink for setting.json"
	config_files=$(find "$DOTFILES/.vscode" -type f -maxdepth 1 2>/dev/null)
	for config in $config_files; do
		target="$HOME/Library/Application Support/Code/User/$(basename "$config")"
		if [ -e "$target" ]; then
			info "~${target#$HOME} already exists... Skipping."
		else
			info "Creating symlink for $config"
			ln -s "$config" "$target"
		fi
	done

	if test ! "$(command -v code)"; then
		warning "Code command not add. Adding."
	fi

	info "Installing extensions"
	# install vscode extensions
	sh $DOTFILES/.install/vscode.sh

	success "Setting up VS Code Done."
}

setup_macos() {
	title "Configuring macOS"
	if [[ "$(uname)" == "Darwin" ]]; then

		echo "Finder: show all filename extensions"
		defaults write NSGlobalDomain AppleShowAllExtensions -bool true

		echo "show hidden files by default"
		defaults write com.apple.Finder AppleShowAllFiles -bool false

		echo "only use UTF-8 in Terminal.app"
		defaults write com.apple.terminal StringEncodings -array 4

		echo "expand save dialog by default"
		defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

		echo "show the ~/Library folder in Finder"
		chflags nohidden ~/Library

		echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
		defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

		echo "Enable subpixel font rendering on non-Apple LCDs"
		defaults write NSGlobalDomain AppleFontSmoothing -int 2

		echo "Use current directory as default search scope in Finder"
		defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

		echo "Show Path bar in Finder"
		defaults write com.apple.finder ShowPathbar -bool true

		echo "Show Status bar in Finder"
		defaults write com.apple.finder ShowStatusBar -bool true

		echo "Disable press-and-hold for keys in favor of key repeat"
		defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

		echo "Set a blazingly fast keyboard repeat rate"
		defaults write NSGlobalDomain KeyRepeat -int 1

		echo "Set a shorter Delay until key repeat"
		defaults write NSGlobalDomain InitialKeyRepeat -int 15

		echo "Enable tap to click (Trackpad)"
		defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

		echo "Enable Safari’s debug menu"
		defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

		echo "For VS Code"
		defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
		defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

		echo "Kill affected applications"

		for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done
	else
		warning "macOS not detected. Skipping."
	fi
}

select option in "Setup Symlinks ⬅️" "Install Homebrew and packages 🍺" "Install Fish and packages 🐟" "Install LTS Node and Install packages 📦" "Setup Git" "Setup VS Code" "Setup Mac 👨‍💻" "Setup ALL 🐈‍⬛" "Quit ❌"; do
	case $option in
	"Setup Symlinks ⬅️")
		setup_symlinks
		;;
	"Install Homebrew and packages 🍺")
		setup_homebrew
		;;
	"Install Fish and packages 🐟")
		setup_fish
		;;
	"Install LTS Node and Install packages 📦")
		setup_npm
		;;
	"Setup Git")
		setup_git
		;;
	"Setup VS Code")
		setup_vscode
		;;
	"Setup Mac 👨‍💻")
		setup_macos
		;;
	"Setup ALL 🐈‍⬛")
		setup_symlinks
		setup_homebrew
		setup_fish
		setup_npm
		setup_git
		setup_vscode
		setup_macos
		break
		;;
	"Quit ❌")
		warning "Quit"
		break
		;;
	*)
		error "Ooops!"
		;;
	esac
done

echo -e
success "Done."
