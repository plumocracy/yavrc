local dap, dapui = require("dap"), require("dapui")

vim.keymap.set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint" })

vim.keymap.set("n", "<Right>", function()
	dap.step_into()
end, { desc = "Debug: Step into" })

vim.keymap.set("n", "<Down>", function()
	dap.step_over()
end, { desc = "Debug: Step over" })

vim.keymap.set("n", "<Left>", function()
	dap.step_out()
end, { desc = "Debug: Step out" })

vim.keymap.set("n", "<Up>", function()
	dap.restart_frame()
end, { desc = "Debug: Restart frame" })

vim.keymap.set("n", "<leader>sdb", function()
	dap.continue()
end, { desc = "Start or continue debugging" })


-- Go Specific
vim.keymap.set("n", "<leader>gdt", function()
	require('dap-go').debug_test()
end, { desc = "Debug Go test" })

vim.keymap.set("n", "<leader>gdl", function()
	require('dap-go').debug_last()
end, { desc = "Debug last Go test" })


-- Dap UI
--

-- Open and close dapui automatically
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>dui", function()
	dapui.toggle()
end, { desc = "Toggle debugger UI" })

vim.keymap.set("n", "<leader>wv", function()
	dapui.elements.watches.add()
end, { desc = "Add value under cursor to watches" })

vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
	  dapui.close()
  end,
})

dapui.setup(
  {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
        elements = { {
            id = "stacks",
            size = 0.5
          }, {
            id = "watches",
            size = 0.5
          } },
        position = "right",
        size = 0.2
      }, {
        elements = { {
            id = "repl",
            size = 1
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }
)

vim.diagnostic.config({
	signs = true,

	virtual_text = {
		severity = vim.diagnostic.severity.ERROR
	},

	underline = {
		severity = vim.diagnostic.severity.ERROR
	}

})


vim.keymap.set("n", "<leader>sd", function()
	vim.diagnostic.open_float(nil, {
		focusable = true,
		border = "rounded",
		source = true,
		scope = "cursor"
	})
end, { desc = "Diagnostic under line", nowait = true})
