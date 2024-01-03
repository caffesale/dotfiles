local status, scope = pcall(require, "scope")
if not status then
	require("notify")("scope not found")
	return
end

scope.setup({
	restore_state = false,
})
