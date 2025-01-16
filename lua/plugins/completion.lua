return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").setup({
        ft_func = function()
          if vim.bo.filetype == "eruby" then
            if string.match(vim.fn.expand('%:p'), "%.html%.erb$") then
              return {"eruby", "html"}
            end
          end
          return {vim.bo.filetype}
        end
      })
    end,
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "2.*",
  },
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },

    opts = function()
      local cmp = require("cmp")
      return {
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({}),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      }
    end,
  },
}
