local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = 20,
	open_mapping = [[<C-t>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell,
	autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	-- Change the default shell. Can be a string or a function returning a string
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-t><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<C-t><C-n><C-W>h]], opts)
	vim.keymap.set("t", "<C-j>", [[<C-t><C-n><C-W>j]], opts)
	vim.keymap.set("t", "<C-k>", [[<C-t><C-n><C-W>k]], opts)
	vim.keymap.set("t", "<C-l>", [[<C-t><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
