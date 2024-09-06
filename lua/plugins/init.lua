return {
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
    lazy = false,
    priority = 1000,
  },
  'towolf/vim-helm',
  'michaeljsmith/vim-indent-object',
}
