return {
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'github/copilot.vim',
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
