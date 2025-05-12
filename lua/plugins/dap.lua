return {
  {
    'mfussenegger/nvim-dap',
    -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
    config = function()
      local js_debugger = vim.fn.expand '$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'

      vim.fn.sign_define('DapBreakpoint', {
        text = '🔴', -- nerdfonts icon here
        texthl = 'DapBreakpointSymbol',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      })

      local dap = require 'dap'

      -- setup dap config by VsCode launch.json file
      local vscode = require 'dap.ext.vscode'
      local json = require 'plenary.json'
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { js_debugger, '${port}' },
        },
      }

      dap.adapters['node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { js_debugger, '${port}' },
        },
      }

      -- Configuration for debugging Node.js applications
      dap.configurations.javascript = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch Node.js Program',
          -- Program to launch (current file)
          program = '${file}',
          -- Working directory
          cwd = '${workspaceFolder}',
          -- Connect to Node.js debugger
          sourceMaps = true,
          -- Where to look for source files
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          -- Skip files you don't want to step into
          skipFiles = { '<node_internals>/**' },
          -- Console output destination
          console = 'integratedTerminal',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to Node.js Process',
          -- Connect to already running Node.js process by its process ID
          processId = require('dap.utils').pick_process,
          -- Working directory
          cwd = '${workspaceFolder}',
        },
      }

      -- TypeScript configuration
      dap.configurations.typescript = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch TypeScript Program',
          -- Run ts-node to execute TypeScript files directly
          runtimeExecutable = 'node',
          runtimeArgs = {
            '--nolazy',
            '-r',
            'ts-node/register',
          },
          -- Program to launch (current file)
          program = '${file}',
          -- Working directory
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          -- Protocol to use for resolving paths
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }

      -- Configuration specifically for Nuxt.js applications
      dap.configurations.vue = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch Nuxt.js',
          -- Start the Nuxt.js application with the proper command
          -- This example uses the dev command which is typical for development
          runtimeExecutable = 'npm',
          runtimeArgs = {
            'run',
            'dev',
          },
          -- Working directory for the Nuxt app
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          -- Allow time for Nuxt to start before attaching
          -- This makes sure the debugger connects only after Nuxt is ready
          serverReadyAction = {
            pattern = 'Listening on http://localhost:([0-9]+)',
            uriFormat = 'http://localhost:%s',
            action = 'openExternally',
          },
          -- Skip files you don't want to step into
          skipFiles = {
            '<node_internals>/**',
            '**/node_modules/**',
          },
          console = 'integratedTerminal',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Debug Nuxt.js Server-Side',
          -- Debug Nuxt's server-side rendering
          runtimeExecutable = 'node',
          -- Use --inspect to enable debugging
          runtimeArgs = {
            '--inspect',
            '${workspaceFolder}/node_modules/.bin/nuxt',
          },
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          port = 9229, -- Default Node.js debug port
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          console = 'integratedTerminal',
        },
      }

      -- Add browser debugging capability (useful for Nuxt client-side)
      dap.configurations.javascript = vim.list_extend(dap.configurations.javascript, {
        {
          type = 'pwa-chrome', -- You need vscode-chrome-debug adapter
          request = 'launch',
          name = 'Launch Chrome for Nuxt Client-Side',
          url = 'http://localhost:3000', -- Default Nuxt dev server URL
          webRoot = '${workspaceFolder}',
          sourceMaps = true,
          sourceMapPathOverrides = {
            -- Map sources from browser to filesystem
            ['webpack:///src/*'] = '${workspaceFolder}/*',
          },
        },
      })
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio' },
  -- stylua: ignore
  keys = {
    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
    { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  },
    opts = {},
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup(opts)

      -- Automatically open dap-ui when debugging starts.
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      -- Automatically close dap-ui when debugging ends.
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },
}
