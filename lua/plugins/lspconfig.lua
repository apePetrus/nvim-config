return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                'typescript',
                'javascript',
                'php',
                'lua',
                'html',
                'bash',
                'markdown',
                'markdown_inline',
                'json',
                'html',
                'python',
                'vim',
                'yaml',
            },
        },
        vim.treesitter.language.register('php', 'inc'),
    },
}
