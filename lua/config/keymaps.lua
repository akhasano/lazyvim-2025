-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("t", "<C-x>", [[<C-\><C-n>]], { desc = "Exit terminal mode (Ctrl+x)" })

vim.keymap.set("n", "<C-n>", function()
  Snacks.explorer()
end, { desc = "Snacks Explorer" })

vim.keymap.set('n', '<F5>', ':lua require"dap".continue()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F10>', ':lua require"dap".step_over()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F11>', ':lua require"dap".step_into()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F12>', ':lua require"dap".step_out()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>', { noremap = true, silent = true, desc = "Set/unset breakpoint" })
vim.keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>', { noremap = true, silent = true, desc = 'Continue' })
vim.keymap.set('n', '<leader>dB', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',{ noremap = true, silent = true, desc = "set/unset conditional breakpoint" })
vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dC', ':lua require("dap").run_to_cursor()', { desc = "Run to Cursor" })
vim.keymap.set('n', '<leader>dT', ':lua require("dap").terminate()', { desc = "Terminate" })

-- https://github.com/neovim/neovim/issues/11804#issuecomment-1113927971
vim.keymap.set('n', 'x', '"_x')

vim.keymap.set("n", "<leader>se", "<cmd> HopWord <CR>", { desc = "Hint words" })
vim.keymap.set("n", "<leader>sE", "<cmd> HopLine <CR>", { desc = "Hint line" })

local diff_enabled = false

vim.keymap.set('n', '<leader>bc', function()
  if diff_enabled then
    vim.cmd('windo diffoff')
    diff_enabled = false
    -- vim.notify("Diff OFF")
  else
    vim.cmd('windo diffthis')
    diff_enabled = true
    -- vim.notify("Diff ON")
  end
end, { noremap = true, silent = true, desc = "Compare on/off"})

