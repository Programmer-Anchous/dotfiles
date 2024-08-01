local opts = {
   noremap = true,     -- non-recursive
   silent = false,      -- do not show message
}

vim.keymap.set('n', '<leader>ms', ':MarkdownPreview<CR>', opts)
vim.keymap.set('n', '<leader>mq', ':MarkdownPreviewStop<CR>', opts)
