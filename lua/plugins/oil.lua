local oil = {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
		},

		keymaps = {
			["<leader>ef"] = {"actions.parent", mode = "n", desc = "Browse parent directory"}
		}
	},

	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}

return oil
