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
		custom_filter = function(buf)
			local tab_num = 0
			for _ in pairs(vim.api.nvim_list_tabpages()) do
				tab_num = tab_num + 1
			end
			if tab_num > 1 then
				return false
			else
				return true
			end
		end,
	},
})
