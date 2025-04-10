--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>ws', '<C-w><C-s>', { desc = 'Split window' })
vim.keymap.set('n', '<leader>wv', '<C-w><C-v>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>wq', '<C-w><C-q>', { desc = 'Quit window' })
vim.keymap.set('n', '<leader>w+', '<C-w><C-+>', { desc = 'Increase window height' })
vim.keymap.set('n', '<leader>w-', '<C-w><C-->', { desc = 'Decrease window height' })
vim.keymap.set('n', '<leader>w>', '<C-w><C->>', { desc = 'Increase window width' })
vim.keymap.set('n', '<A-S-.>', '<C-w>5>', { desc = 'Increase window width x 5' })
vim.keymap.set('n', '<leader>w<', '<C-w><C-<>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<A-S-,>', '<C-w>5<', { desc = 'Decrease window width x 5' })
vim.keymap.set('n', '<leader>w=', '<C-w><C-<=', { desc = 'Equally high and wide' })

-- NOTE: Some terminals have coliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Buffer traversal.
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>b', ':b#<CR>', { desc = 'Go to last active [b]uffer' })

-- Yank file name of the current buffer.
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:t')
  print('Yanked file name: ' .. vim.fn.expand '%:t')
end, { desc = '[Y]ank [f]ile name of current buffer' })
