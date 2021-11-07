#!/usr/bin/env bash

if [ -d "$HOME/Projects/nvim-personal/" ]; then
	rsync -avzh --exclude ~/Projects/nvim-personal/lua/custom/plugins/README.md ~/Projects/nvim-personal/lua/custom/plugins/lspconfig.lua ~/.config/nvim/lua/custom/plugins/
elif [ -d "$HOME/nvim-config/" ]; then
	rsync -avzh --exclude ~/nvim-config/lua/custom/plugins/README.md ~/nvim-config/lua/custom/plugins/lspconfig.lua ~/.config/nvim/lua/custom/plugins/
else
	echo "Nvim config git repo locations not found"
	exit 1
fi
