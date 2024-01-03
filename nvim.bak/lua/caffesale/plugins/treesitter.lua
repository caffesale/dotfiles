-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"astro",
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"scss",
		"python",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"vue",
		"dockerfile",
		"gitignore",
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	-- auto install above language parsers
	auto_install = true,
})
