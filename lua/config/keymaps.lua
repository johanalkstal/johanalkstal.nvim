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

-- Buffer traversal.
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close the current buffer' })
vim.keymap.set('n', '<leader>b', ':b#<CR>', { desc = 'Go to last active [b]uffer' })

-- Yank file name of the current buffer.
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:t')
  print('Yanked file name: ' .. vim.fn.expand '%:t')
end, { desc = '[Y]ank [f]ile name of current buffer' })
