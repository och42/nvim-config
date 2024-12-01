return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<Space>a', group = ' AI assistance…' },
        { '<Space>c', group = ' Code…' },
        { '<Space>f', group = ' Find file…' },
        { '<Space>g', group = ' Git…' },
        { '<Space>s', group = ' Search for…' },
      },
    },
    keys = {
      {
        '<Space>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  },
}
