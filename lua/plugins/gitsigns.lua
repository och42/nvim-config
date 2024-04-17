return {
  'lewis6991/gitsigns.nvim',

  opts = {
    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')
      vim.keymap.set('n', '[h', gitsigns.prev_hunk)
      vim.keymap.set('n', ']h', gitsigns.next_hunk)
      vim.keymap.set('n', '\\gb', function()
        gitsigns.blame_line({ full = true })
      end)
      vim.keymap.set('n', '\\gB', function()
        gitsigns.blame_line({ full = true, ignore_whitespace = true })
      end)
    end,
  },
}
