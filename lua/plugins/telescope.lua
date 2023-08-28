return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  config = function()
    local telescope = require('telescope')

    telescope.setup({
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
    })

    telescope.load_extension('fzf')

    vim.keymap.set('n', '<Leader><Space>', function()
      require('telescope.builtin').buffers({ only_cwd = true })
    end)
    vim.keymap.set('n', '<Leader>ss', require('telescope.builtin').find_files)
    vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').grep_string)
    vim.keymap.set('n', '<Leader>sW', function()
      require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
    end)
    vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags)
    vim.keymap.set('n', '<Leader>sg', require('telescope.builtin').live_grep)
    vim.keymap.set('n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols)
  end,

  dependencies = {
    {
      'nvim-lua/plenary.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
}
