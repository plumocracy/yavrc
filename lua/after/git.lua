local dfv = require("diffview")

vim.keymap.set("n", "<leader>gac", function()
	vim.system({ "git", "add", "-A" }, {}, function(addResult)
		if addResult.code ~= 0 then
			return
		end

		vim.schedule(function()
			Snacks.input({
				prompt = "Commit msg: ",
			}, function(msg)
				if not msg or msg == "" then
					return
				end

				vim.system({ "git", "commit", "-m", msg }, {}, function(commitResult)
					if commitResult.code ~= 0 then
						vim.schedule(function()
							vim.notify(commitResult.stderr, vim.log.levels.ERROR)
						end)
					end
				end)
			end)
		end)
	end)
end)
