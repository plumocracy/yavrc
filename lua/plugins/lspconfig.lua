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
	}
}


