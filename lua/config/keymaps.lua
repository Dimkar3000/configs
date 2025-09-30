local map = function(event, keys, func, desc, mode)
	mode = mode or "n"
	vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
end

return {
	setup_defaults = function()
		vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })
		vim.keymap.set("n", "<leader>p", "<cmd>Oil .<CR>", { desc = "Open Parent Directory in Oil" })

		vim.keymap.set("n", "<leader>ts", "<cmd>set list!<CR>", { desc = "toggle showing special characters" })
		vim.keymap.set("i", "", "<C-w>", { remap = true, desc = "Delete word" })

		vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, { desc = "Open Diagnostics" })

		vim.keymap.set(
			"n",
			"<leader>cf",
			function() require("conform").format() end,
			{ desc = "Conform [C]ode [F]ormat" }
		)

		vim.keymap.set(
			"v",
			"<leader>cf",
			function()
				require("conform").format({
					["start"] = vim.api.nvim_buf_get_mark(0, "<"),
					["end"] = vim.api.nvim_buf_get_mark(0, ">"),
				})
			end,
			{ noremap = true, silent = true, desc = "Conform [C]ode [F]ormat Range" }
		)

		vim.keymap.set("n", "<leader>b", ":bprevious<CR>", { desc = "Open Previous Buffer" })
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {remap = false, desc = "Escape Terminal"})
		vim.keymap.set("n", "<leader>`", ":sp term://pwsh<CR>")
	end,

	keymap_blink_cmp = {
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "show", "fallback" },
	},
	keymap_fzf = {
		{ "<leader>ff", function() require("fzf-lua").files() end, desc = "FZF [F]ind [F]iles" },
		{ "<leader>fg", function() require("fzf-lua").live_grep_resume() end, desc = "FZF [F]ind [G]rep" },
		{ "<leader><leader>", function() require("fzf-lua").builtin() end, desc = "FZF Menu" },
	},

	setup_lsp = function(event)
		-- NOTE: Remember that Lua is a real programming language, and as such it is possible
		-- to define small helper and utility functions so you don't have to repeat yourself.
		--
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map(event, "grn", vim.lsp.buf.rename, "[R]e[n]ame")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map(event, "gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

		-- Find references for the word under your cursor.
		map(event, "grr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map(event, "gri", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		-- map(event, 'grd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map(event, "grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map(event, "gO", require("fzf-lua").lsp_document_symbols, "Open Document Symbols")

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map(event, "gW", require("fzf-lua").lsp_live_workspace_symbols, "Open Workspace Symbols")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map(event, "grt", require("fzf-lua").lsp_typedefs, "[G]oto [T]ype Definition")
	end,
	setup_lsp_client = function(event)
		map(
			event,
			"<leader>th",
			function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end,
			"[T]oggle Inlay [H]ints"
		)
	end,
}
