return {
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'j-hui/fidget.nvim',
        config = true,
        tag = 'legacy',
      },
      {
        'williamboman/mason.nvim',
        config = true,
      },
      {
        'williamboman/mason-lspconfig.nvim',
      },
      {
        'folke/neodev.nvim',
        config = true,
      },
    },
  },
  {
    'kylechui/nvim-surround',
    config = true,
    event = 'VeryLazy',
    version = '*',
  },
  {
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
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
  'towolf/vim-helm',
}
