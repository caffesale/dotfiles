local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		numbers = "none",
		close_command = "bdelete! %d", -- can be a string | function, see "mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "actions"
	},
})
