#!/usr/bin/env fish

echo "Installing commitizen"
npm i -g commitizen

echo "Installing a changelog in commitizen"
npm i -g cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' >~/.czrc

echo "Installing a typescript"
npm i -g typescript

echo "Installing a ni"
npm i -g @antfu/ni

echo "Installing a degit"
npm i -g degit

echo "Installing a rimraf"
npm i -g rimraf

# for vue project
echo "Installing a volar lsp server"
npm i -g @vue/typescript-plugin
