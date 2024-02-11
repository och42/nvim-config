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
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
  'towolf/vim-helm',
  'michaeljsmith/vim-indent-object',
}
