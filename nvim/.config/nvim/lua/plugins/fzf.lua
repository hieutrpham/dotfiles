return {
  {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	vim.keymap.set('n', '<leader>sf', '<cmd>FzfLua files<cr>', { desc = '[f]ind files' }),
	vim.keymap.set('n', '<leader>sg', '<cmd>FzfLua live_grep<cr>', { desc = '[g]rep' }),
	vim.keymap.set('n', '<leader>s/', '<cmd>FzfLua grep_curbuf<cr>', { desc = '[g]rep current buffer' }),
  }
}
