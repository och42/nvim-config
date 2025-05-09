return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf })
          vim.keymap.set("n", "<Space>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = " Code Action" })
          vim.keymap.set("n", "<Space>cf", vim.lsp.buf.format, { buffer = event.buf, desc = " Format" })
          vim.keymap.set("n", "<Space>cr", vim.lsp.buf.rename, { buffer = event.buf, desc = " Rename" })
        end
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
            },
          }
        },
      }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities        = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
      vim.lsp.config("*", { capabilities = capabilities })

      for server, config in pairs(servers) do
        -- This handles overriding only values explicitly passed
        -- by the server configuration above. Useful when disabling
        -- certain features of an LSP (for example, turning off formatting for ts_ls)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      require("mason").setup({
        ui = {
          border = "rounded"
        }
      })
      require("mason-lspconfig").setup({})
      require("lazydev").setup({
        ft = "lua",
        enabled = true,
      })
    end,
  },
}
