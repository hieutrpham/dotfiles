-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_liststyle = 3
-- moving in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.diagnostic.enable(false)
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center search term
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing current buffer
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP Hover" })

-- separate copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "<leader>e", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Quick Replace" })

-- vim.keymap.set("n", "<leader>pv", function()
-- 	MiniFiles.open()
-- end, { noremap = true, silent = true })
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.incsearch = true
vim.opt.showmode = false

vim.opt.iskeyword = "@,48-57,192-255"
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.schedule(function()
-- vim.opt.clipboard = 'unnamedplus'
--end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- adjusting window sizes
vim.keymap.set("n", "<leader>k", "10<C-w>+", { desc = "Increase window height by 10" })
vim.keymap.set("n", "<leader>j", "10<C-w>-", { desc = "Decrease window height by 10" })
vim.keymap.set("n", "<leader>H", "10<C-w><", { desc = "Decrease window width by 10" })
vim.keymap.set("n", "<leader>l", "10<C-w>>", { desc = "Increase window width by 10" })

-- moving between buffers
vim.keymap.set("n", "H", ":bprev<CR>", { desc = "Prev buffer", noremap = false })
vim.keymap.set("n", "L", ":bnext<CR>", { desc = "Next buffer", noremap = false })

-- navigate in insert mode
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
--vim.keymap.set('i', 'jj', '<Esc>')

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function set_linenum()
	vim.opt_local.relativenumber = true
	vim.opt_local.number = true
end

-- setting relativenumber in terminal buffer
local terminal_augroup = vim.api.nvim_create_augroup("TerminalSettings", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
	group = terminal_augroup,
	callback = set_linenum,
})

-- Create an augroup to manage netrw settings
local netrw_augroup = vim.api.nvim_create_augroup("NetrwSettings", { clear = true })

-- Set relativenumber when a netrw buffer is opened
vim.api.nvim_create_autocmd("FileType", {
	group = netrw_augroup,
	pattern = { "netrw", "man" },
	callback = set_linenum,
})
