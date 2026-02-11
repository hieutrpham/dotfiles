return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
	opts = {
		kind = "tab",
		float = {
			border = "rounded",
		},
		integrations = {
			diffview = true,
		},
	},
}
