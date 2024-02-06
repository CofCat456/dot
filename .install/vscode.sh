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
	"sainnhe.gruvbox-material"
	"catppuccin.catppuccin-vsc-icons"

	# life savers!
	"dbaeumer.vscode-eslint"
	"Vue.volar"
	"GitHub.copilot"
	"usernamehw.errorlens"
	"streetsidesoftware.code-spell-checker"

	# tailwindcss
	"austenc.tailwind-docs"
	"bradlc.vscode-tailwindcss"
	"stivo.tailwind-fold"
	"heybourn.headwind"

	# up to you
	"eamodio.gitlens"
	"EditorConfig.EditorConfig"
	"github.vscode-github-actions"
	"GitHub.vscode-pull-request-github"
	"johnsoncodehk.vscode-tsconfig-helper"
	"naumovs.color-highlight"
	"WakaTime.vscode-wakatime"
	"znck.grammarly"
	"Gruntfuggly.todo-tree"
)

for extension in "${extensions[@]}"; do
	code --install-extension "$extension"
done
