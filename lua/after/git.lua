local dfv = require("diffview")


vim.keymap.set("n", "<leader>gac", function()
	Snacks.input({
		prompt = "Commit msg:",
	}, function(value)
		if value == nil then
			return
		end		

		vim.cmd([[Git add -A]])
		vim.cmd("Git commit -m " .. vim.fn.shellescape(value))
	end)
end)
