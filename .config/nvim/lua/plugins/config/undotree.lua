local undodir = os.getenv("HOME") .. "/.undodir"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p", "0700")
end
vim.opt.undodir = undodir
vim.g.undotree_WindowLayout = 3
vim.g.undotree_TreeNodeShape = "*"
vim.g.undotree_TreeVertShape = "|"
vim.g.undotree_SetFocusWhenToggle = 1
