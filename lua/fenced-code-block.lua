local function insert_fenced_block()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, { "```", "```" })
  vim.api.nvim_win_set_cursor(0, { row + 1, 3 })
  vim.cmd("startinsert")
end

vim.keymap.set("i", "<C-b>", insert_fenced_block, { noremap = true, silent = true })
