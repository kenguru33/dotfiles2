require("telescope").load_extension("dap")
require("nvim-dap-virtual-text").setup()
local dap = require("dap")

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "NvimDapVirtualTextError", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = " ", texthl = "DapUIBreakpointsCurrentLine", linehl = "", numhl = "" })

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.configurations.typescript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
dap.adapters.chrome = {
	type = "executable",
	command = "node",
}

dap.configurations.javascript = { -- change this to javascript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9229,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescriptreact = { -- change to typescript if needed
	{
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9229,
		webRoot = "${workspaceFolder}",
	},
}
