local dap = require("dap")

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/dev/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
	{
		name = "Attach to port 9222",
		type = "chrome",
		request = "attach",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap.configurations.typescript = { -- change to typescript if needed
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${workspaceFolder}/node_modules/.bin/jest",
		args = { "-i", "${file}" },
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

----------------------------------------------------------------------------------------------------------------------

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

----------------------------------------------------------------------------------------------------------------------

local Hydra = require("hydra")

local hint_lsp = [[
 _b_: set breakpoint  _t_: toggle breakpoint  _c_: clear all breakpoints
 _so_: stepover       _sO_: stepout           _si_: step into 
 _r_: run to cursor
 ^
 ^
 ^ ^      _<Enter>_: Start Debug/Continue       _q_: exit
]]

Hydra({
	name = "Debug",
	hint = hint_lsp,
	mode = "n",
	body = "<Leader>d",
	heads = {
		{
			"b",
			function()
				require("dap").set_breakpoint()
			end,
		},
		{
			"t",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"c",
			function()
				require("dap").clear_breakpoints()
			end,
		},
        {
            "r",
            function()
				require("dap").run_to_cursor()
            end
        },
		{
			"so",
			function()
				require("dap").step_over()
			end,
		},
		{
			"sO",
			function()
				require("dap").step_out()
			end,
		},
		{
			"si",
			function()
				require("dap").step_into()
			end,
		},
		{ "q", nil, { exit = true, nowait = true } },
		{
			"<Enter>",
			function()
				require("dap").continue()
			end,
		},
	},
	config = {
		color = "teal",
		invoke_on_body = true,
		hint = {
			position = "bottom",
			border = "rounded",
		},
	},
})
