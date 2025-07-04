-- Debugger
require('dapui').setup({
    icons = { expanded = "🞃", collapsed = "🞂", current_frame = "⏺"}, -- U+1F783, U+1F782, U+23FA
    controls = {
        icons = {
            pause = "⏸",        -- UTF-8: 9208 U+23F8
            play = "🞂",         -- U+1F782
            step_into = "↧",    -- U+21A7
            step_over = "↷",    -- U+21B7
            step_out = "↥",     -- U+21A5
            step_back = "↶",    -- U+21B6
            run_last = "↻",     -- U+21BB
            terminate = "🞎",    -- U+25A1
            disconnect = "!",
        }
    }
}
)


vim.keymap.set('n', '<leader>dt', ':DapToggle<CR>', { desc = "Dap UI - Toggle UI"})
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { desc = "Dap UI - DapToggle[B]reakpoint"})
vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>', { desc = "Dap UI - [D]ap [C]ontinue"})
vim.api.nvim_set_keymap('n', '<leader>dk', '<cmd>DapTerminate<CR> <cmd>lua require("dapui").close()<CR>', { desc = "Dap UI - [D]ap [K]ill"})

vim.keymap.set('n', '<leader>do', ':DapStepOver<CR>', { desc = "DAP UI - [D]ebug [O]ver Line"})
vim.keymap.set('n', '<leader>di', ':DapStepInto<CR>', { desc = "DAP UI - [D]ebug [I]nto Line"})


local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- lua
-- lua adapter
dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end



-- lua configurations
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = "Attach to running Neovim instance",
        file = '${file}',
  }
}




-- c
-- c adapter
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  -- args = { "-i", "dap" }
  args = {}
}



dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = vim.fn.stdpath('data') .. '/mason/bin/codelldb', -- Mason-Path
        args = {"--port", "${port}"},
        -- args = {}
    }
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {""},
    },
}

-- python
-- python adapter
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      -- command = '~/.virtualenvs/debugpy/bin/python', -- 'path/to/virtualenvs/debugpy/bin/python',
      command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end


  -- python configuration
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


