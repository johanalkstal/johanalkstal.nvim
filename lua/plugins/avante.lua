-- AI within nvim
-- Don't forget to add your ANTHROPIC_API_KEY to your environment variables.

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

function is_windows()
  return vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1
end

function build_command()
  if is_windows() then
    return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
  else
    return 'make'
  end
end

return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = 'claude',
    auto_suggestions_provider = 'claude',
    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-3-7-sonnet-20250219',
      temperature = 0,
      max_tokens = 4096,
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
      minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      enable_token_counting = true, -- Whether to enable token counting. Default to true.
      enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
      enable_claude_text_editor_tool_mode = false, -- Whether to enable Claude Text Editor Tool Mode.
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      cancel = {
        normal = { '<C-c>', '<Esc>', 'q' },
        insert = { '<C-c>' },
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        retry_user_request = 'r',
        edit_user_request = 'e',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
        remove_file = 'd',
        add_file = '@',
        close = { '<Esc>', 'q' },
        close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true` for MacOS or change BuildFromSource for Windows.
  build = build_command(),
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    --'echasnovski/mini.pick', -- for file_selector provider mini.pick
    --''nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    --''hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    --''ibhagwan/fzf-lua', -- for file_selector provider fzf
    --''nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    --''zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
