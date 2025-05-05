-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    preset = 'modern',

    -- Document existing key chains
    spec = {
      { '<leader>a', group = 'Avante', icon = { icon = '󰧑' } },
      { '<leader>b', group = 'Buffer', icon = { icon = '󰧮' } },
      { '<leader>d', group = 'Document', icon = { icon = '󰧮' } },
      { '<leader>g', group = 'Go to', icon = { icon = '' } },
      { '<leader>h', group = 'Git Hunk', icon = { icon = '' }, mode = { 'n', 'v' } },
      { '<leader>p', group = 'Persistence', icon = { icon = '' } },
      { '<leader>q', group = 'Open diagnostic Quickfix list' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>w', group = 'Window' },
      { '<leader>y', group = 'Yank', icon = { icon = '󰆏' } },
    },
  },
}
