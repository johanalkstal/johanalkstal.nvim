return {
  cmd = { 'vue-language-server', '--stdio' },
  root_markers = { 'package.json' },
  filetypes = {
    'vue',
  },
  init_options = {
    hostInfo = 'neovim',
    typescript = {
      tsdk = '',
    },
  },
  before_init = function(_, config)
    if config.init_options and config.init_options.typescript and config.init_options.typescript.tsdk == '' then
      config.init_options.typescript.tsdk = vim.fn.stdpath 'data' .. '/mason/packages/typescript-language-server/node_modules/typescript/lib'
    end
  end,
}
