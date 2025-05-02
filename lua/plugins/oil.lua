-- File explorer that works like a buffer.

-- Keybind to open the Oil file explorer more conveniently and in float mode.
vim.keymap.set('n', '<leader>e', ':Oil --float <CR>', { desc = 'Open File [E]xplorer' })

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true, -- send deletes files to the bin instead of deleting them.
    view_options = {
      show_hidden = true, -- show hidden files.
    },
  },
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
