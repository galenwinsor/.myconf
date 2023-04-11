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
		init = function()
			require("core.functions").load_mappings("telescope")
		end,
		opts = function()
			return require "plugins.configs.telescope"
		end
	},
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		lazy = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			{ "lukas-reineke/lsp-format.nvim", config = true },
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.preset("recommended")
			lsp.on_attach(function(client, bufnr)
				require("lsp-format").on_attach(client, bufnr)
			end)
			lsp.nvim_workspace()
			lsp.setup()
			vim.diagnostic.config { virtual_text = true }
		end
	}, -- Only load whichkey after all the gui
	{
		"folke/which-key.nvim",
		keys = { "<leader>", '"', "'", "`" },
		init = function()
			require("core.functions").load_mappings "whichkey"
		end,
		opts = function()
			return require "plugins.configs.whichkey"
		end,
		config = function(_, opts)
			require("which-key").setup(opts)
		end,
	},
}

require("lazy").setup(plugins, require("plugins.configs.lazy_nvim"))
