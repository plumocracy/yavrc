return {
	{
	"https://github.com/windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true
	},
	{
		"https://github.com/windwp/nvim-ts-autotag",
		opts = {
			per_filetype = {
				["html"] = {
					enable_close = true
				}
			}
		}

	}
}
