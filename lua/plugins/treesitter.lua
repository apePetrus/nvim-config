return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {},
        vim.treesitter.language.register('php', 'inc'),
    },
}
