local dfv = require("diffview")


vim.keymap.set("n", "<leader>gac", function()
	Snacks.input({
		prompt = "Commit msg:",
	}, function(value)
		if value == nil then
			return
		end		

		vim.cmd([[Git add -A]])
		vim.cmd("silent Git commit -m " .. vim.fn.shellescape(value))	


		Snacks.input({
			prompt = "Push? y/n"
		}, function(value) 
			if value == 'n' or value == 'no' then
				return
			end

			if value == 'y' or value == 'yes' then
				vim.cmd([[silent Git push]])
				Snacks.notiify.info("Pushed to remote.")
			end

			Snacks.notiify.erro("Invalid response. No action taken.")

			return
		end)
	end)

end)
