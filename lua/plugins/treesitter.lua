return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = false,
      ensure_installed = { "lua", "vim", "vimdoc" },
      highlight = { enable = true },
      ignore_install = {},
      indent = { enable = true },
      modules = {},
      sync_install = false,
    })
  end,
}
