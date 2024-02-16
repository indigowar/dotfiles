function SetColor(colors)
    local color = colors or 'kanagawa-dragon'
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

-- SetColor()

SetColor('catppuccin-mocha')

-- SetColor('gruvbox-material')

-- SetColor('gruvbox')
