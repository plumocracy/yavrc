local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fj", builtin.find_files)
vim.keymap.set("n", "<leader>rj", builtin.live_grep)
