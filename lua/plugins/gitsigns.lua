return {
  'lewis6991/gitsigns.nvim',

  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      vim.keymap.set('n', '[h', gitsigns.prev_hunk)
      vim.keymap.set('n', ']h', gitsigns.next_hunk)
      vim.keymap.set('n', '<M-g>b', function()
        gitsigns.blame_line({ full = true })
      end)
    end,
  },
}
