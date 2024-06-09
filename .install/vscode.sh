#!/usr/bin/env bash

extensions=(
	# antfu extensions :P
	"antfu.where-am-i"
	"antfu.open-in-github-button"
	"Lokalise.i18n-ally"
	"antfu.goto-alias"
	"antfu.smart-clicks"
	"antfu.goto-alias"

	# my favorite :>
	"vscodevim.vim"

	# themes & icons
	"antfu.icons-carbon"
	"antfu.theme-vitesse"
	"catppuccin.catppuccin-vsc-icons"

	# life savers!
	"dbaeumer.vscode-eslint"
	"Vue.volar"
	"johnsoncodehk.vscode-tsconfig-helper"
	"GitHub.copilot"
	"github.copilot-chat"
	"usernamehw.errorlens"
	"streetsidesoftware.code-spell-checker"
	ms-vscode-remote.remote-ssh

	# tailwindcss
	"bradlc.vscode-tailwindcss"

	#typescript
	ms-vscode.vscode-typescript-next
	yoavbls.pretty-ts-errors

	#react
	dsznajder.es7-react-js-snippets

	# up to you
	"eamodio.gitlens"
	"ms-ceintl.vscode-language-pack-zh-hant"
	"esbenp.prettier-vscode"
	"EditorConfig.EditorConfig"
	"github.vscode-github-actions"
	"GitHub.vscode-pull-request-github"
	"naumovs.color-highlight"
	"znck.grammarly"
	"Gruntfuggly.todo-tree"
	"vitest.explorer"
	monish.regexsnippets
	meganrogge.template-string-converter
)

for extension in "${extensions[@]}"; do
	code --install-extension "$extension"
done
