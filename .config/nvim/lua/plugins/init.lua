print("Plugins")

local plugins = {
	"nvim-lua/plenary.nvim"
}

require("lazy").setup(plugins, require("plugins.configs.lazy_nvim"))
