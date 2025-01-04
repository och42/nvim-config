return {
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      vim.cmd.colorscheme("onedark")
    end,
    lazy = false,
    priority = 1000,
  },
  "towolf/vim-helm",
  "michaeljsmith/vim-indent-object",
}
