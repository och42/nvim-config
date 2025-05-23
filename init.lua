--  Setting mapleader must happen before plugins are required
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.breakindent = true
vim.o.completeopt = "menuone,noselect"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.iskeyword = "@,48-57,_,192-255,-"
vim.o.laststatus = 2
vim.o.list = true
vim.o.listchars = "tab:» ,trail:•"
vim.o.mouse = "a"
vim.o.scrolloff = 2
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.softtabstop = 0
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = "yes"

require("ensure-lazy")
require("lazy").setup("plugins", {
  change_detection = { enabled = false },
  ui = {
    border = "rounded"
  }
})

require("ctrl-g-copies-filename")
require("ctrl-s-trims-whitespaces-and-saves-file")
require("disable-spacebar-moves-cursor")
require("disable-word-search-jump")
require("fenced-code-block")
require("highlight-on-yank")
require("i-shift-enter-inserts-newline-below")
require("set-filetypes")
require("shift-enter-goes-upward")
require("yank-visual-selection-to-system-clipboard")

require("filetype-go")
require("netrw")
require("tabline")

-- Diagnostics
vim.keymap.set("n", "<Space>dx", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = " Toggle" })

-- Resize windows
vim.keymap.set("n", "<M-j>", ":resize -3<CR>", { silent = true })
vim.keymap.set("n", "<M-k>", ":resize +3<CR>", { silent = true })
vim.keymap.set("n", "<M-h>", ":vertical resize -3<CR>", { silent = true })
vim.keymap.set("n", "<M-l>", ":vertical resize +3<CR>", { silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
