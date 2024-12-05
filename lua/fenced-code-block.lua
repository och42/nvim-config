local function insert_fenced_block()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, { "```", "```" })
  vim.api.nvim_win_set_cursor(0, { row + 1, 3 })

  local next_line = vim.api.nvim_buf_get_lines(0, row + 2, row + 3, false)[1]
  if next_line and next_line ~= "" then
    vim.api.nvim_buf_set_lines(0, row + 2, row + 2, false, { "" })
  end

  vim.cmd("startinsert")
end

vim.keymap.set("i", "<C-b>", insert_fenced_block, { noremap = true, silent = true })
