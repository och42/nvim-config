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

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<Leader><Space>', function()
      builtin.buffers({ only_cwd = true })
    end)
    vim.keymap.set('n', '<Leader>ss', builtin.find_files)
    vim.keymap.set('n', '<Leader>sw', builtin.grep_string)
    vim.keymap.set('n', '<Leader>sW', function()
      builtin.grep_string({ search = vim.fn.expand('<cWORD>') })
    end)
    vim.keymap.set('n', '<Leader>sh', builtin.help_tags)
    vim.keymap.set('n', '<Leader>sg', builtin.live_grep)
    vim.keymap.set('n', '<Leader>ds', builtin.lsp_document_symbols)
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
