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
							Snacks.notify.error(commitResult.stderr)
							return
						end)
					end
				end)
				
				Snacks.input({
					prompt = "Push changes now? y/n"
				}, function(msg) 
					if msg == 'y' or msg == 'yes' then
						vim.system({ "git", "push" }, {}, function(pushResult) 
							if pushResult.code ~= 0 then
								Snacks.notify.error(pushResult.stderr)
								return
							end
							return	
						end)
					end
					
					if msg == 'n' or msg == 'no' then
						return
					end

					Snacks.notify.error("Invalid input, no action taken.")
				end)

			end)
		end)
	end)
end)
