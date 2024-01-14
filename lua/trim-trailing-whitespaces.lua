vim.api.nvim_create_autocmd('BufWritePost', {
  command = '%s/\\s\\+$//e',
  pattern = '*',
})
