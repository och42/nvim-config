--  Setting mapleader must happen before plugins are required
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('ensure-lazy')
require('lazy').setup('plugins', { change_detection = { enabled = false } })

vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.iskeyword = '@,48-57,_,192-255,-'
vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:•'
vim.o.mouse = 'a'
vim.o.scrolloff = 2
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.softtabstop = 0
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'

require('ctrl-g-copies-filename')
require('ctrl-s-trims-whitespaces-and-saves-file')
require('disable-spacebar-moves-cursor')
require('disable-word-search-jump')
require('highlight-on-yank')
require('set-filetypes')

require('filetype-go')
require('netrw')
require('tabline')


-- Diagnostics
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.disable(0)
end)

-- Resize windows
vim.keymap.set('n', '<M-j>', ':resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':resize +3<CR>', { silent = true })
vim.keymap.set('n', '<M-h>', ':vertical resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +3<CR>', { silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
