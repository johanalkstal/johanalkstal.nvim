-- Shows CSS colors.
return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    css = true,
    tailwind = true,
  },
}
