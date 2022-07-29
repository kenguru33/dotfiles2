local nlspsettings = require("nlspsettings")

nlspsettings.setup({
	config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
	local_settings_root_markers = { ".git" },
	jsonls_append_default_schemas = true,
})
