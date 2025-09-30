local dap = require("dap")

local map = function(event, keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
end

local mason_path = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe"

local netcoredbg_adapter = {
	type = "executable",
	command = mason_path,
	args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function() return require("dap-dll-autopicker").build_dll_path() end,
	},
}

map("n", "<F5>", dap.continue, "DAP: Continue/Start")
map("n", "<F9>", dap.toggle_breakpoint, "DAP: Toggle breakpoint")
map("n", "<F10>", dap.step_over, "DAP: Step over")
map("n", "<F11>", dap.step_into, "DAP: Step into")
map("n", "<F8>", dap.step_out, "DAP: Step out")
map("n", "<leader>dr", dap.repl.open, "DAP: REPL open")
map("n", "<leader>dl", dap.run_last, "DAP: Run last")
