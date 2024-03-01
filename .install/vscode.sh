#!/usr/bin/env bash

extensions=(
	# antfu extensions :P
	"antfu.where-am-i"
	"antfu.open-in-github-button"
	"Lokalise.i18n-ally"
	"antfu.goto-alias"

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
	"vue.vscode-typescript-vue-plugin"
	"johnsoncodehk.vscode-tsconfig-helper"
	"vitest.explorer"
	"GitHub.copilot"
	"github.copilot-chat"
	"usernamehw.errorlens"
	"streetsidesoftware.code-spell-checker"

	# tailwindcss
	"bradlc.vscode-tailwindcss"

	# up to you
	"eamodio.gitlens"
	"alefragnani.project-manager"
	"ms-ceintl.vscode-language-pack-zh-hant"
	"esbenp.prettier-vscode"
	"meganrogge.template-string-converter"
	"EditorConfig.EditorConfig"
	"github.vscode-github-actions"
	"GitHub.vscode-pull-request-github"
	"johnsoncodehk.vscode-tsconfig-helper"
	"naumovs.color-highlight"
	"WakaTime.vscode-wakatime"
	"znck.grammarly"
	"Gruntfuggly.todo-tree"
	"neptunedesign.vs-sequential-number"
)

for extension in "${extensions[@]}"; do
	code --install-extension "$extension"
done
