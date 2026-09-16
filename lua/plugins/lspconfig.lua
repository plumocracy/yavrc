return {
	{
		"https://github.com/neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {}
	},
	{
		"https://github.com/nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate"
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"j-hui/fidget.nvim"
	},
	{
		"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	{
		"https://github.com/nvimtools/none-ls.nvim",
		dependencies = {
        	'nvim-lua/plenary.nvim',
		}
	}
}


