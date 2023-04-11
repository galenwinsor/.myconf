local M = {}

M.load_mappings = function(section_name)
	-- a table mapping a keymap mode to keymaps
	local keymaps_table = require("core.keymaps")[section_name]

	for mode, mode_mappings in pairs(keymaps_table) do
		for _, mapping in pairs(mode_mappings) do
			vim.keymap.set(mode, mapping[1], mapping[2], { desc = mapping[3] })
		end
	end
end

return M
