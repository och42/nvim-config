return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require("mason").setup({})

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

      local lsp_servers_configurations = {
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
          },
        },
      }

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({})
      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = lsp_servers_configurations[server_name],
            on_attach = function(_, bufnr)
              vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr })
              vim.keymap.set("n", "<Space><Space>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = " Code Action" })
              vim.keymap.set("n", "<Space><Space>cf", vim.lsp.buf.format, { buffer = bufnr, desc = " Format" })
              vim.keymap.set("n", "<Space><Space>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = " Rename" })
            end,
          })
        end,
      })
    end,

    dependencies = {
      {
        "folke/lazydev.nvim",
        opts = {},
        ft = "lua",
      },
    },
  },
}
