-- Open the init.lua file.
vim.api.nvim_create_user_command('Config', 'edit ~/.config/nvim/init.lua', {})

-- Open the dashboard.
vim.api.nvim_create_user_command('Dashboard', function()
  require('snacks.dashboard').open()
end, {})
