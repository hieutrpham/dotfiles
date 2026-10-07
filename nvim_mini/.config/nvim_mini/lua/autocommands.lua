-- Highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.hl.on_yank({ timeout = 200, visual = true })
	end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
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

-- vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
-- vim.opt.grepformat = "%f:%l:%c:%m"
-- vim.keymap.set("n", "<leader>g", function()
-- 	vim.ui.input({ prompt = "Grep: " }, function(pattern)
-- 		if pattern then
-- 			vim.cmd("silent grep! " .. vim.fn.fnameescape(pattern))
-- 			vim.cmd("copen")
-- 		end
-- 	end)
-- end)
--
-- vim.keymap.set("n", "<leader>f", function()
--     vim.ui.input({ prompt = "Find: " }, function(pattern)
--         if not pattern or pattern == "" then return end
--         local output = vim.fn.systemlist({ "fd", pattern })
--         vim.fn.setqflist({}, "r", {
--             title = "fd: " .. pattern,
--             lines = output,
--             efm = "%f",
--         })
--         vim.cmd("copen")
--     end)
-- end)
--
