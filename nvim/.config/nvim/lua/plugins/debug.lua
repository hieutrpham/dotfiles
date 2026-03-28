---@module 'lazy'
---@type LazySpec
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"igorlfs/nvim-dap-view",
		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{ "<leader>dt", "<cmd>DapViewToggle<CR>" },
		{ "<leader>dw", "<cmd>DapViewWatch<CR>" },
		{ "<leader>b", "<cmd>DapToggleBreakpoint<CR>" },
		{ "<F1>", "<cmd>DapStepInto<CR>" },
		{ "<F2>", "<cmd>DapStepOver<CR>" },
		{ "<F3>", "<cmd>DapStepOut<CR>" },
		{ "<F4>", "<cmd>DapTerminate<CR>" },
		{ "<F5>", "<cmd>DapContinue<CR>" },
	},

	config = function()
		local dap = require("dap")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				-- 'delve',
				"codelldb",
				"clangd",
			},
		})

		require("nvim-dap-virtual-text").setup()

		-- Install golang specific config
		require("dap-go").setup({
			delve = {
				-- On Windows delve must be run attached or it crashes.
				-- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
				detached = vim.fn.has("win32") == 0,
			},
		})
	end,
}
