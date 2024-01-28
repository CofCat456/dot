#!/usr/bin/env bash

extensions=(
	# antfu extensions :P
	"antfu.where-am-i"
	"antfu.open-in-github-button"
	"Lokalise.i18n-ally"

	# my favorite :>
	"vscodevim.vim"

	# themes & icons
	"antfu.icons-carbon"
	"antfu.theme-vitesse"
	"file-icons.file-icons"
	"sainnhe.gruvbox-material"
	"Catppuccin.catppuccin-vsc-icons"
	"illixion.vscode-vibrancy-"

	# life savers!
	"dbaeumer.vscode-eslint"
	"Vue.volar"
	"GitHub.copilot"
	"usernamehw.errorlens"
	"streetsidesoftware.code-spell-checker"

	# up to you
	"eamodio.gitlens"
	"EditorConfig.EditorConfig"
	"github.vscode-github-actions"
	"GitHub.vscode-pull-request-github"
	"johnsoncodehk.vscode-tsconfig-helper"
	"naumovs.color-highlight"
	"WakaTime.vscode-wakatime"
	"znck.grammarly"
	"KevinYang.ctlorem"
	"bradlc.vscode-tailwindcss"
)

for extension in "${extensions[@]}"; do
	code --install-extension "$extension"
done
