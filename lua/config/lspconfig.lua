return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
                'eslint_d',
                'eslint-lsp',
                'typescript-language-server',
                'intelephense',
            },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                'typescript',
                'javascript',
                'php',
            },
        },
        vim.treesitter.language.register('php', 'inc'),
    },
}
