local get_config = function(name)
	return string.format('require("plugins/config/%s")', name)
end

local packer = require("packer")
-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Plugins start
	use({
		"wbthomason/packer.nvim",
		requires = {},
		config = get_config("packer"),
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("telescope"),
	})

	use({
		"folke/tokyonight.nvim",
		requries = {},
		config = get_config("tokyonight"),
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = get_config("nvim-tree"),
	})

	use({
		"williamboman/mason.nvim",
		requires = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		config = get_config("lspconfig"),
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
		config = get_config("cmp"),
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = get_config("null-ls"),
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {},
		-- run = function()
		-- 	require("nvim-treesitter.install").update({ with_sync = true })
		-- end,
		config = get_config("treesitter"),
	})

	use({
		"windwp/nvim-autopairs",
		requires = {},
		config = get_config("autopairs"),
	})

	use({
		"windwp/nvim-ts-autotag",
		requires = { "nvim-treesitter" },
		after = { "nvim-treesitter" },
		config = get_config("autotag"),
	})

	use({
		"tpope/vim-surround",
		requires = {},
		config = get_config("vim-surround"),
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = get_config("lualine"),
	})

	use({
		"romgrk/barbar.nvim",
		requires = {},
		config = get_config("barbar"),
	})

	use({
		"rcarriga/nvim-notify",
		requires = {},
		config = get_config("notify"),
	})

	use({
		"mbbill/undotree",
		requires = {},
		config = get_config("undotree"),
	})

	use({
		"b0o/schemastore.nvim",
		requires = {},
		config = get_config("schemastore"),
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = get_config("gitsigns"),
	})

	use({
		"terrortylor/nvim-comment",
		requires = {},
		config = get_config("comments"),
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2",
		requires = {},
		config = get_config("hop"),
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use({ "mfussenegger/nvim-dap", config = get_config("dap") })

	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, config = get_config("dap-ui") })
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = get_config("toggleterm"),
	})
	-- Plugins Ends

	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
