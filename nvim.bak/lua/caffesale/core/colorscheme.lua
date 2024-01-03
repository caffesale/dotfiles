local status, _ = pcall(vim.cmd, "colorscheme everforest")
if not status then
	return
end
