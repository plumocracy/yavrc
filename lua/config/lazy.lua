-- copied right from lazy docs.

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.number = true
vim.opt.relativenumber = true

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float {
				bufnr = bufnr,
				scope = 'cursor',
				focus = false,
			}
		end,
	},
}

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},

	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})



