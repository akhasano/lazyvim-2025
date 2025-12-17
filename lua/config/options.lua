-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- ~/.config/nvim/lua/custom/colors.lua
-- Подключаем тему, например onedark
-- vim.cmd('set norelativenumber')

vim.lsp.config.ansiblels = {
  filetypes = { 'yaml', 'yml' }
}

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h11"
  -- Вставка в нормальном и визуальном режимах
  vim.keymap.set({'n', 'v'}, '<C-S-V>', '"+p')
  -- Вставка в режиме вставки (Insert mode)
  vim.keymap.set('i', '<C-S-V>', '<C-R>+')
  -- Вставка в командной строке
  vim.keymap.set('c', '<C-S-V>', '<C-R>+')
end

-- Переопределяем группы для diff
local highlights = {
  DiffChange = { bg = "#4c4c4c", fg = "NONE", bold = true },
  DiffText   = { bg = "#FFA500", fg = "#000000", bold = true },
  DiffAdd    = { bg = "#4C784C", fg = "NONE" },
  DiffDelete = { bg = "#804040", fg = "NONE" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

vim.opt.winbar = "%=%m %f"
