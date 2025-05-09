local vue_ls = vim.fn.expand('$MASON/packages/vue-language-server/node_modules/@vue/language-server')

return {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'package.json' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  init_options = {
    hostInfo = 'neovim',
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_ls,
        languages = { 'vue' },
      },
    },
  },
}
