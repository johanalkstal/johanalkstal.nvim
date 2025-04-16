-- Themery for theme switching, and a bunch of themes.
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
return {
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        themes = {
          {
            name = 'Carbonfox',
            colorscheme = 'carbonfox',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Dawnfox',
            colorscheme = 'dawnfox',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Dayfox',
            colorscheme = 'dayfox',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Duskfox',
            colorscheme = 'duskfox',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Melange Dark',
            colorscheme = 'melange',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Melange Light',
            colorscheme = 'melange',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Modus Dark',
            colorscheme = 'modus',
            before = [[
          vim.opt.background = 'dark'
          ]],
          },
          {
            name = 'Modus Light',
            colorscheme = 'modus',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Nightfox',
            colorscheme = 'nightfox',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Nordfox',
            colorscheme = 'nordfox',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'One Dark Pro',
            colorscheme = 'onedark',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'One Dark Pro Light',
            colorscheme = 'onelight',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'One Nord Dark',
            colorscheme = 'onenord',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'One Nord Light',
            colorscheme = 'onenord',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Oxocarbon Dark',
            colorscheme = 'oxocarbon',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Oxocarbon Light',
            colorscheme = 'oxocarbon',
            before = [[
            vim.opt.background = 'light'
            ]],
          },
          {
            name = 'Poimandres',
            colorscheme = 'poimandres',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Terafox',
            colorscheme = 'terafox',
            before = [[
            vim.opt.background = 'dark'
            ]],
          },
          {
            name = 'Tokyo Night - Day',
            colorscheme = 'tokyonight-day',
            before = [[
          vim.opt.background = 'light'
          ]],
          },
          {
            name = 'Tokyo Night - Moon',
            colorscheme = 'tokyonight-moon',
            before = [[
          vim.opt.background = 'dark'
          ]],
          },
        },
      }
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
  },
  {
    'miikanissi/modus-themes.nvim',
    name = 'modus',
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = false,
    priority = 1000,
  },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
  },
  {
    'savq/melange-nvim',
    priority = 1000,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
  },
  {
    'rmehri01/onenord.nvim',
  },
  {
    'olivercederborg/poimandres.nvim',
  },
}
