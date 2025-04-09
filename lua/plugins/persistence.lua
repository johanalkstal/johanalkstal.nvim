-- Saves your session so you can pick up where you left next time.

vim.keymap.set('n', '<leader>ls', function()
  require('persistence').load()
end, { desc = '[L]oad [s]ession for the current directory' })
vim.keymap.set('n', '<leader>lS', function()
  require('persistence').select()
end, { desc = '[S]elect session to [l]oad' })
vim.keymap.set('n', '<leader>ll', function()
  require('persistence').load { last = true }
end, { desc = '[L]oad [l]ast session' })
vim.keymap.set('n', '<leader>lx', function()
  require('persistence').stop()
end, { desc = 'Stop Persistence. Session will not be saved on e[x]it' })

return {
  'folke/persistence.nvim',
  event = 'BufReadPre', -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
}
