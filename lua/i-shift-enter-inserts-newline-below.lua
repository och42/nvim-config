local function insert_line_below()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  -- Insert a newline above the current line
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { '' })
  -- Set cursor to the beginning of the inserted line
  vim.api.nvim_win_set_cursor(0, { row, 0 })
end

vim.keymap.set('i', '<S-CR>', insert_line_below, { noremap = true, silent = true })
