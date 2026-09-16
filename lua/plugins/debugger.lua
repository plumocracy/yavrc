local debugins = {
	{
		"https://github.com/mfussenegger/nvim-dap",
	},
	{
		"https://github.com/leoluz/nvim-dap-go",
		ft = "go",
		dependencies = { "https://github.com/mfussenegger/nvim-dap" },
		config = function(_, opts)
			require("dap-go").setup(opts)

			local function project_root()
				return vim.fs.root(0, "go.mod") or vim.fn.getcwd()
			end

			-- Launch the main package, including its sibling files, from any buffer.
			for _, config in ipairs(require("dap").configurations.go) do
				if config.request == "launch" and config.mode ~= "test" and config.program == "${file}" then
					config.program = project_root
					config.cwd = project_root
				end
			end
		end
	},
	{
		"https://github.com/rcarriga/nvim-dap-ui.git",
		dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
	}
}

return debugins
