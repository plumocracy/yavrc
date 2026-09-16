local gopher = require("gopher")


vim.keymap.set("n", "<leader>gaj", function()
	gopher.tags.add { input = { "json" } }
end, { desc = "Add JSON tags to Go struct" })

vim.keymap.set("n", "<leader>grj", function()
	gopher.tags.rm { input = { "json" } }
end, { desc = "Remove JSON tags to Go struct" })

vim.keymap.set("n", "<leader>er", function()
	gopher.iferr()
end, { desc = "Insert Go error check" })


