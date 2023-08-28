return {
  'lewis6991/gitsigns.nvim',

  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '[h', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to previous [H]unk' })
      vim.keymap.set('n', ']h', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to next [H]unk' })
      vim.keymap.set('n', '<Leader>gb', function()
        require('gitsigns').blame_line({ full = true })
      end, { buffer = bufnr, desc = '[G]it [B]lame line' })
    end,
  },
}
