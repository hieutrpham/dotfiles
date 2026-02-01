return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("minicyan")
			vim.cmd.hi("Comment gui=none")
		end,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "arturgoms/moonbow.nvim" },
	{ "Shatur/neovim-ayu" },
	{
		"darianmorat/gruvdark.nvim",
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	-- Highlight todo, notes, etc in comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
