vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymap

keymap.set("n", "x", '"_x')

-- tabs
keymap.set("n", "<leader>tc", ":tabnew <CR>")
keymap.set("n", "<leader>tx", ":tabclose <CR>")
keymap.set("n", "]t", "gt")
keymap.set("n", "[t", "gT")

-- windows
keymap.set("n", "<leader>ws", ":vs <CR>")

-- buffers
keymap.set("n", "<Tab>", ":bn <CR>")
keymap.set("n", "<S-Tab>", ":bp <CR>")
keymap.set("n", "<leader>x", ":Bdelete <CR>")
keymap.set("n", "<leader>bm", ":MaximizerToggle<CR>")

-- line insert

keymap.set("n", "<leader>o", "o<ESC>")
keymap.set("n", "<leader>O", "O<ESC>")

-- line move

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])
-- keymap.set({"n", "v"}, "<leader>bd", [["_d]])

-- keymap.set("n", "Q", "<nop>")
-- keymap.set("n", "<leader>f", vim.lsp.buf.format)

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- plugin keymaps

-- symbols
keymap.set("n", "<leader>ls", "<cmd>SymbolsOutline<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- zenmode
keymap.set("n", "<leader>z", "<cmd>lua require('zen-mode').toggle() <CR>")

-- telescope

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fq", "<cmd>TodoQuickFix <cr>")
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope keywords=TODO,FIX<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
