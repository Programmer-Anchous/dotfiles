if vim.fn.has('termguicolors') == 1 then
   vim.o.termguicolors = true
end

vim.o.background = 'dark'

vim.g.everforest_background = 'hard'
vim.g.everforest_transparent_background = 2

function ApplyColorscheme(color)
	color = color or "everforest"
	vim.cmd.colorscheme(color)
end

-- line numbers colors
function ElementsColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#7A8478', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#7A8478', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#7A8478', bold=true })

    vim.api.nvim_set_hl(0, 'TabLineFill', { fg='#7A8478', bold=true })
    vim.api.nvim_set_hl(0, 'TabLine', { fg='#7A8478', bold=true })
    vim.api.nvim_set_hl(0, 'TabLineSel', { fg='#A7C080', bold=true})

    vim.api.nvim_set_hl(0, 'Visual', { bg='#3a464c' })
end

ApplyColorscheme()
ElementsColors()
