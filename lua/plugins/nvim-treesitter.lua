return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function(_, opts) 
       require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "c_sharp", "rust" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enabled = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<leader>s", -- set to `false` to disable one of the mappings
                scope_incremental = "<leader><Enter>",
                node_incremental = "<Enter>",
                node_decremental = "b",
            },
        },
    },
}
