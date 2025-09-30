vim.api.nvim_create_user_command("AutoFormatDisable", function(args)
		vim.g.disable_autoformat = true
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("AutoFormatEnable", function()
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("AutoFormatStatus", function()
	local g = tostring(not vim.g.disable_autoformat)
	print("Autoformat Enabled: " .. g)
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.g.disable_autoformat = true

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
}
