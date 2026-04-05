---@module 'lazy'
---@type LazySpec
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"igorlfs/nvim-dap-view",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{ "<leader>dt", "<cmd>DapViewToggle<CR>", desc = "Toggle Dap View" },
		{ "<leader>dw", "<cmd>DapViewWatch<CR>", desc = "Add to DapViewWatch" },
		{ "<leader>b", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Break point" },
		{ "<leader>B", "<cmd>DapClearBreakpoints<CR>", desc = "Clear Break point" },
		{ "<F1>", "<cmd>DapStepInto<CR>", desc = "Step into" },
		{ "<F2>", "<cmd>DapStepOver<CR>", desc = "Step over" },
		{ "<F3>", "<cmd>DapStepOut<CR>", desc = "Step out" },
		{ "<F4>", "<cmd>DapTerminate<CR>", desc = "DapTerminate" },
		{ "<F5>", "<cmd>DapContinue<CR>", desc = "DapContinue" },
	},

	config = function()
		local dap = require("dap")
		require("dap-go").setup()
		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
				"codelldb",
				"clangd",
			},
		})
	end,
}
