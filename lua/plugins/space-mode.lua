return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      spec = {
        { '<Space>', group = ' Search…' },
        { '\\a', group = ' AI assistance…' },
        { '\\c', group = ' Code…' },
        { '\\d', group = ' Diagnostics…' },
        { '\\g', group = ' Git…' },
      },
    },
  },
}
