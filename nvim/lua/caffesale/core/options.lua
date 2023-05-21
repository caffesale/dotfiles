local opt = vim.opt -- for conciseness

vim.notify = require("notify")

-- gui corsor
opt.guicursor = ""

-- line numbers
opt.statuscolumn = "%l %r"
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

-- line wrapping
opt.wrap = false

-- backup delete
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search setting
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- scroll
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- update time

opt.updatetime = 50

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
