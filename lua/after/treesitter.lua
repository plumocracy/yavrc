local ts = require("nvim-treesitter")

local ensure_installed = {"go", "rust", "typescript", "python", "html"}

ts.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

ts.install(ensure_installed) 

vim.api.nvim_create_autocmd('FileType', {
	pattern = ensure_installed, 
	callback = function() vim.treesitter.start() end
})
