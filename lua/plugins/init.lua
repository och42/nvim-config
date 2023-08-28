return {
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
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
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = '2.*',
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    opts = function()
      local cmp = require('cmp')
      return {
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({}),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
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
