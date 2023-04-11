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

M.whichkey = {
  n = {
	  {
		  "<leader>wK",
		  function()
			  vim.cmd "WhichKey"
		  end,
		  "which-key all keymaps",
	  },
	  { 
		  "<leader>wk",
		  function()
			  local input = vim.fn.input "WhichKey: "
			  vim.cmd("WhichKey " .. input)
		  end,
		  "which-key query lookup",
	  },
  },
}

return M
