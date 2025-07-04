P = function(v)
	print(vim.inspect(v))
	return v
end

require("remap")
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"tpope/vim-obsession",
	require("kickstart.plugins.debug"),
	require("plugins.harpoon"),
	require("plugins.love2d"),
	require("kickstart.plugins.gitsigns"),
	require("plugins.fugitive"),
	require("plugins.whichkey"),
	require("plugins.telescope"),
	-- require 'plugins.oil',
	require("plugins.lsp_config"),
	require("plugins.treesitter"),
	require("plugins.treesitter-context"),
	require("plugins.theme"),
	require("plugins.autoformat"),
	require("plugins.autocomplete"),
	require("plugins.mini"),
	require("kickstart.plugins.autopairs"),
	require("plugins.vim_tmux"),
	require("plugins.undotree"),
	-- require("plugins.noice"),
	require("plugins.neotree"),
	require("plugins.42header"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
