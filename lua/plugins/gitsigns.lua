return {
  'lewis6991/gitsigns.nvim',

  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '[h', require('gitsigns').prev_hunk)
      vim.keymap.set('n', ']h', require('gitsigns').next_hunk)
      vim.keymap.set('n', '<Leader>gb', function()
        require('gitsigns').blame_line({ full = true })
      end)
    end,
  },
}
