local function trimWhitespacesAndSaveFile()
  vim.cmd("keepjumps keeppatterns %s/\\s\\+$//e")
  vim.cmd.write()
end

vim.keymap.set("n", "<C-s>", trimWhitespacesAndSaveFile)
