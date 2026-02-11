P = function(v)
	print(vim.inspect(v))
	return v
end

require("remap")
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
	"tpope/vim-rsi",
	-- require("plugins.love2d"),
	require("plugins.neogit"),
	require("kickstart.plugins.gitsigns"),
	-- require("kickstart.plugins.autopairs"),
	require("plugins.whichkey"),
	require("plugins.telescope"),
	require("plugins.lsp_config"),
	require("plugins.treesitter"),
	require("plugins.treesitter-context"),
	require("plugins.theme"),
	require("plugins.autoformat"),
	require("plugins.autocomplete"),
	require("plugins.mini"),
	-- require("plugins.vim_tmux"),
	require("plugins.undotree"),
	-- require("plugins.neotree"),
	require("plugins.42header"),
	require("plugins.markdown"),
}, {
	ui = {
		icons = vim.g.have_nerd_font and {} or {},
	},
})

-- vim: ts=2 sts=2 sw=2 et
