vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = 'composer.lock',
  callback = function()
    vim.bo.filetype = 'json'
  end,
})
