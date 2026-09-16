local plugins = {
	{
		"https://github.com/olexsmir/gopher.nvim",
		ft = "go",
		build = function() 
			vim.cmd [[silent! GoInstallDeps]]
		end
	}
}

return plugins
