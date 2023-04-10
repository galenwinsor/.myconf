local plugins = {
	"nvim-lua/plenary.nvim",
	{ 
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		opts = function()
			require "plugins.configs.kanagawa"
		end,
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd([[colorscheme kanagawa]])
			vim.cmd([[highlight Normal guibg=None]])
			vim.cmd([[highlight NonText guibg=None]])
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		opts = function()
			return require "plugins.configs.telescope"
		end
	}
}

require("lazy").setup(plugins, require("plugins.configs.lazy_nvim"))
