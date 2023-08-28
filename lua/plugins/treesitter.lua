return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'vim', 'vimdoc' },
      highlight = { enable = true },
      indent = { enable = true },
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = '<C-Space>',
      --     node_decremental = '<M-Space>',
      --     node_incremental = '<C-Space>',
      --     scope_incremental = '<C-Space>',
      --   },
      -- },
    })
  end,
}
