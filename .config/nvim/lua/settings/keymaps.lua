local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- nvim tree mappings --
map("n", "<leader>t", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)

-- barbar mappings --

-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- telescope mappings --
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Resize with arrows
map("n", "<C-S-Up>", ":resize -2<CR>", opts)
map("n", "<C-S-Down>", ":resize +2<CR>", opts)
map("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- undotree --
map("n", "<leader>u", ":UndotreeToggle<cr>", opts)

-- hop --
vim.api.nvim_set_keymap(
	"",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)

-- dap --
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
map("n", "<lp>", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')<cr>", opts)
map("n", "<dr>", "<cmd>lua require'dap'.repl.open()<cr>", opts)
map("n", "<dl>", "<cmd>lua require'dap'.run_last()<cr>", opts)
