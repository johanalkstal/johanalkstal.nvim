return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- defaults to 'auto' if you want it to try and match with your theme automatically.
    theme = 'onelight',
    sections = {},
    winbar = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff' },
      lualine_c = { 'filename', 'diagnostics' },
      lualine_y = { 'lsp_status' },
      lualine_z = { 'location' },
    },
  },
}
