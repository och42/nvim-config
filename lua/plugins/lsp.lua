return {
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',

    config = function()
      require('mason').setup({})

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local lsp_servers_configurations = {
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
          },
        },
      }

      local mason_lspconfig = require('mason-lspconfig')
      mason_lspconfig.setup({})
      mason_lspconfig.setup_handlers({
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
            settings = lsp_servers_configurations[server_name],
            on_attach = function(_, bufnr)
              vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
              vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr })
              vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
            end,
          })
        end,
      })
    end,

    dependencies = {
      'folke/neodev.nvim',
      config = true,
    },
  },
}
