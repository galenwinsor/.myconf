require("lazy").setup {
    {
        "sainnhe/everforest",
        config = function()
            vim.opt.termguicolors = true
            vim.g.everforest_background = "soft"
            vim.g.everforest_transparent_background = 2
            vim.cmd.colorscheme("everforest")
            vim.cmd([[highlight Normal guibg=None]])
        end
    },
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = true
    },
    -- file tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        init = function()
            require("functions").load_mappings("neotree")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim"
        },
        config = true
    },
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        init = function()
            require("functions").load_mappings("telescope")
        end,
        dependencies = "nvim-lua/plenary.nvim",
        config = true
    },
    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
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
                lsp.default_keymaps({ buffer = bufnr })

                local allow_format = { 'lua_ls', 'rust_analyzer' }
                if vim.tbl_contains(allow_format, client.name) then
                    require('lsp-format').on_attach(client)
                end
            end)
            lsp.nvim_workspace()
            lsp.setup()
            vim.diagnostic.config { virtual_text = true }
        end
    },
    -- syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "typescript" },
                highlight = { enable = true, }
            }
        end
    },
    {
        "terrortylor/nvim-comment",
        init = function()
            require("functions").load_mappings("nvimcomment")
        end,
        config = function()
            require("nvim_comment").setup()
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({ open_mapping = [[<c-\>]], direction = "float" })
            local Terminal        = require('toggleterm.terminal').Terminal
            local lazygit         = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

            local _lazygit_toggle = function()
                lazygit:toggle()
            end

            vim.keymap.set("n", "<leader>gg", _lazygit_toggle,
                { noremap = true, silent = true })
        end
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
}
