local M = {}

M.general = {
    n = {
        { "<leader>w", "<cmd>w<cr>", "save buffer" },
        { "<leader>q", "<cmd>q<cr>", "quit" },
        { "<C-h>",     "<C-w>h" },
        { "<C-j>",     "<C-w>j" },
        { "<C-k>",     "<C-w>k" },
        { "<C-l>",     "<C-w>l" }
    }
}

M.neotree = {
    n = {
        { "<leader>e", "<CMD>Neotree toggle<CR>", desc = "toggle" }
    }
}

M.telescope = {
    n = {
        { "<leader>ff", "<CMD>Telescope git_files<CR>",  "find git files" },
        { "<leader>fp", "<CMD>Telescope find_files<CR>", "find files" },
        { "<leader>fw", "<CMD>Telescope live_grep<CR>",  "find a word" },
        { "<leader>fc", "<CMD>Telescope commands<CR>",   "find commands" },
        { "<leader>fk", "<CMD>Telescope keymaps<CR>",    "find keymaps" },
    }
}

M.nvimcomment = {
    n = {
        { "<leader>/", "<CMD>CommentToggle<CR>j", mode = { "n" } },
    },
    v = {
        { "<leader>/", ":'<,'>CommentToggle<CR>gv<esc>j", mode = { "v" } }
    }
}

return M
