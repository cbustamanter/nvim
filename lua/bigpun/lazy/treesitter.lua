return {

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    -- disable rtp plugin, as we only need its queries for mini.ai
                    -- In case you want to use the plugin, comment this line
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                end,
            },
        },
    },
}

