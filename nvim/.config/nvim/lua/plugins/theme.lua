return {
  {
	"folke/tokyonight.nvim",
	lazy = true, -- Lazy load since you aren't using it as primary
	opts = {
	  transparent = true,
	  styles = {
		sidebars = "transparent",
		floats = "transparent",
	  },
	},
  },
  {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
	  require("rose-pine").setup({
		styles = {
		  bold = true,
		  italic = false,
		}
	  })

	  vim.cmd.colorscheme("rose-pine")

	  -- vim.api.nvim_set_hl(0, "Comment", { italic = false })
	end
  },
  {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
  },
}
