vim.api.nvim_create_autocmd({ "BufEnter","CursorHold","InsertLeave" }, {
    pattern = "*",
    callback = function()
        vim.lsp.codelens.refresh({bufnr = 0})
    end,
})
