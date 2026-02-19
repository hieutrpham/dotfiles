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
		disable_line_numbers = false,
		disable_relative_line_numbers = false,
		integrations = {
			diffview = true,
		},
		status = {
			recent_commit_count = 50,
		},
		commit_editor = {
			kind = "auto",
		},
	},
}
