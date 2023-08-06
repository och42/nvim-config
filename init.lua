local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set('n', '[h', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to previous [H]unk' })
        vim.keymap.set('n', ']h', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to next [H]unk' })
        vim.keymap.set('n', '<Leader>gb', function()
          require('gitsigns').blame_line({ full = true })
        end, { buffer = bufnr, desc = '[G]it [B]lame line' })
      end,
    },
  },
  {
    'windwp/nvim-autopairs',
    config = true,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
    opts = function()
      return {
        mapping = require('cmp').mapping.preset.insert(),
        sources = {
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    config = true,
    event = 'VeryLazy',
    version = '*',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vim', 'vimdoc' },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-Space>',
            node_decremental = '<M-Space>',
            node_incremental = '<C-Space>',
            scope_incremental = '<C-Space>',
          },
        },
      })
    end,
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-d>'] = 'delete_buffer',
            },
          },
        },
      },
    },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  'towolf/vim-helm',
})

-- [[ Setting options ]]
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.cursorline = true
vim.o.iskeyword = '@,48-57,_,192-255,-'
vim.o.laststatus = 3
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:•'
vim.o.mouse = 'a'
vim.o.scrolloff = 2
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.number = true
vim.wo.signcolumn = 'yes'

-- Trim trailing whitespaces on save
vim.api.nvim_create_autocmd('BufWritePre', {
  command = '%s/\\s\\+$//e',
  pattern = '*',
})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<Leader><Space>', function()
  require('telescope.builtin').buffers({ only_cwd = true })
end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<Leader>ss', require('telescope.builtin').find_files, { desc = '[S]earch Files' })
vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<Leader>sW', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
end, { desc = '[S]earch current [W]ORD' })
vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'Search [D]ocument [S]ymbols' })

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>dd', function()
  vim.diagnostic.disable(0)
end, { desc = '[D]isable [D]iagnostics' })

-- Don't jump on word search.
vim.keymap.set('n', '*', ':keepjumps normal! mi*`i<CR>')
vim.keymap.set('n', 'g*', ':keepjumps normal! mig*`i<CR>')

-- Copy filename: Ctrl-G
vim.keymap.set('n', '<C-g>', ':let @+=@%<CR>:file<CR>', { silent = true })

-- Save current buffer: Ctrl-S
vim.keymap.set('n', '<C-s>', ':write<CR>')

-- Resize windows
vim.keymap.set('n', '<M-j>', ':resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':resize +3<CR>', { silent = true })
vim.keymap.set('n', '<M-h>', ':vertical resize -3<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +3<CR>', { silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
