require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { "javascript", "vue", "typescript", "json", "html", "css", "lua" },

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- List of parsers to ignore installing
	ignore_install = {},

	highlight = {
		enable = true,
		disable = { "c", "rust" },
		additional_vim_regex_highlighting = false,
	},
})
