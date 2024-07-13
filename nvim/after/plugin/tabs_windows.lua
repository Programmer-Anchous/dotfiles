local opts = {
   noremap = true,     -- non-recursive
   silent = true,      -- do not show message
}

-- tab
vim.keymap.set('n', '<leader>tj', vim.cmd.tabfirst)
vim.keymap.set('n', '<leader>tl', vim.cmd.tabnext)
vim.keymap.set('n', '<leader>th', vim.cmd.tabprev)
vim.keymap.set('n', '<leader>tk', vim.cmd.tablast)
vim.keymap.set('n', '<leader>tt', vim.cmd.tabedit)
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>tm', vim.cmd.tabm)
vim.keymap.set('n', '<leader>td', vim.cmd.tabclose)

-- windows
vim.keymap.set('n', 'C-ws', vim.cmd.split, opts)
vim.keymap.set('n', 'C-wv', vim.cmd.vsplit, opts)
vim.keymap.set('n', 'C-wh', ':wincmd h<CR>', opts)
vim.keymap.set('n', 'C-wj', ':wincmd j<CR>', opts)
vim.keymap.set('n', 'C-wk', ':wincmd k<CR>', opts)
vim.keymap.set('n', 'C-wl', ':wincmd l<CR>', opts)
vim.keymap.set('n', '+', ':resize +3<CR>', opts)
vim.keymap.set('n', '_', ':resize -3<CR>', opts)
vim.keymap.set('n', '<', ':vertical-resize +5<CR>', opts)
vim.keymap.set('n', '>', ':vertical-resize -5<CR>', opts)
