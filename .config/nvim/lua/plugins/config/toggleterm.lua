local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function LAZYGIT_TOGGLE()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
