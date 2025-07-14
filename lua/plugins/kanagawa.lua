return { "rebelot/kanagawa.nvim", 
config = function()
        require("kanagawa").setup({
            compile=true,
            theme="ghost"
        })
        vim.cmd("colorscheme kanagawa")
    end,
}
