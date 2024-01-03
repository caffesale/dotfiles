local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")
	-- color & theme
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "ellisonleao/gruvbox.nvim" })
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use("savq/melange-nvim")
	use("sainnhe/everforest")
	use("sainnhe/sonokai")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- essential plugins
	use("tpope/vim-surround")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.1" })
	use("theprimeagen/harpoon")

	-- utils
	use("mbbill/undotree")
	use("lukas-reineke/indent-blankline.nvim")
	use("simrat39/symbols-outline.nvim")
	use("folke/todo-comments.nvim")
	use("akinsho/toggleterm.nvim")
	use("folke/zen-mode.nvim")

	-- status bar
	use("akinsho/bufferline.nvim")
	use("tiagovla/scope.nvim")
	use("moll/vim-bbye")

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" })
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")

	-- debug
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("jay-babu/mason-nvim-dap.nvim")
	use("mxsdev/nvim-dap-vscode-js")

	use("nvim-telescope/telescope-dap.nvim")
	-- use("Idelossa/nvim-dap-projects")

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- notify
	use("rcarriga/nvim-notify")

	-- dashboard
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- theme = "doom",
				config = {
					header = require("caffesale.dashboard_art"),
					disable_move = true,
				},
			})
		end,
	})

	-- copilot
	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = { enabled = false },
			})
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
