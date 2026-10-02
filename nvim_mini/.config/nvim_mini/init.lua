vim.loader.enable()
require('vim._core.ui2').enable()
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
vim.g.have_nerd_font = true

vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.o.autocomplete = true
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.autoread = true
vim.o.laststatus = 3
vim.o.inccommand = "split"
vim.o.cursorline = true

vim.keymap.set("n", "<leader>k", "10<C-w>+", { desc = "Increase window height by 10" })
vim.keymap.set("n", "<leader>j", "10<C-w>-", { desc = "Decrease window height by 10" })
vim.keymap.set("n", "<leader>h", "10<C-w><", { desc = "Decrease window width by 10" })
vim.keymap.set("n", "<leader>l", "10<C-w>>", { desc = "Increase window width by 10" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>w", ":wa<cr>:mksession!<cr>")
vim.keymap.set("n", "<leader>r", ":make<cr>")
vim.keymap.set("n", "<leader>wr", ":w<cr>:make<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.keymap.set("n", "<leader>E", ":Ex<cr>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.pack.add { { src = 'https://github.com/rose-pine/neovim', version = 'main' } }
require("rose-pine").setup({ styles = { bold = true, italic = false } })
vim.cmd.colorscheme("rose-pine")

vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.keymap.set("n", "<leader>g", function()
	vim.ui.input({ prompt = "Grep: " }, function(pattern)
		if pattern then
			vim.cmd("silent grep! " .. vim.fn.fnameescape(pattern))
			vim.cmd("copen")
		end
	end)
end)

vim.keymap.set("n", "<leader>f", function()
    vim.ui.input({ prompt = "Find: " }, function(pattern)
        if not pattern or pattern == "" then return end
        local output = vim.fn.systemlist({ "fd", pattern })
        vim.fn.setqflist({}, "r", {
            title = "fd: " .. pattern,
            lines = output,
            efm = "%f",
        })
        vim.cmd("copen")
    end)
end)

require("autocommands")
require("statusline")
require("treesitter")
