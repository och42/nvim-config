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
    end, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<Leader>ss', require('telescope.builtin').find_files, { desc = '[S]earch Files' })
    vim.keymap.set('n', '<Leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<Leader>sW', function()
      require('telescope.builtin').grep_string({ search = vim.fn.expand('<cWORD>') })
    end, { desc = '[S]earch current [W]ORD' })
    vim.keymap.set('n', '<Leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<Leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = 'Search [D]ocument [S]ymbols' })
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
