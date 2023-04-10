local M = {}

-- general nvim mappings
M.general = {
	n = {
		{ "<leader>w", "<cmd>w<cr>", "save file" },
		{ "<leader>q", "<cmd>q<cr>", "quit" }
	}
}

-- plugin mappings
M.telescope = {
	n = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", "find files" }
	}
}

return M
