
local dap = require('dap')

function Curry2(f)
   return function(a)
      return function(b)
         return f(a,b)
      end
   end
end

local actions_state = require("telescope.actions.state")
local actions = require("telescope.actions")
 
local resume_with_path = function(coroutine_co, prompt_bufnr)
    local selected_entry = actions_state.get_selected_entry()
    actions.close(prompt_bufnr)
    coroutine.resume(coroutine_co, selected_entry[1])
end
 
local wrappedResumeWithPath = Curry2(resume_with_path)
 
local uiPicker = function()
    return coroutine.create(function(dap_run_co)
        local resumeCoroutine = wrappedResumeWithPath(dap_run_co)
        require("telescope.builtin").find_files({
            path_display = { "absolute" },
            attach_mappings = function(_, map)
                map("n", "<cr>", resumeCoroutine )
                map("i", "<cr>", resumeCoroutine )
                return true
            end,
            layout_config={prompt_position="top"}})
        end)
    end

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end
dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg",
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
		program = function ()
			vim.g.dotnet_build_project()
			return vim.g.dotnet_get_dll_path()
		end
	}
}


		vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end)
    vim.keymap.set('n', '<Leader>so', function() require('dap').step_over() end)
    vim.keymap.set('n', '<Leader>si', function() require('dap').step_into() end)
    vim.keymap.set('n', '<Leader>sa', function() require('dap').step_out() end)
    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
    vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)
