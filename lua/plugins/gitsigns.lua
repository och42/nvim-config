return {
  'lewis6991/gitsigns.nvim',

  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      vim.keymap.set('n', '[c', gitsigns.prev_hunk)
      vim.keymap.set('n', ']c', gitsigns.next_hunk)
      vim.keymap.set('n', '<Space>gb', function()
        gitsigns.blame_line({ full = true })
      end, { desc = ' Blame' })
      vim.keymap.set('n', '<Space>gB', function()
        gitsigns.blame_line({ full = true, ignore_whitespace = true })
      end, { desc = ' Blame (ignore whitespace)' })
    end,
  },
}
