return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        mappings = {
          i = {
            ['<C-f>'] = 'results_scrolling_down',
            ['<C-b>'] = 'results_scrolling_up',
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ['<C-x>'] = 'delete_buffer',
            },
          },
        },
        git_files = {
          git_command = { 'git', 'ls-files', '--exclude-standard', '--cached', '--deduplicate' },
        },
      },
    })

    telescope.load_extension('fzf')

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<Leader>B', function()
      builtin.buffers({ only_cwd = false })
    end, { desc = 'Telescope: [b]uffers' })
    vim.keymap.set('n', '<Leader>b', function()
      builtin.buffers({ only_cwd = true })
    end, { desc = 'Telescope: [b]uffers' })
    vim.keymap.set('n', '<Leader>T', builtin.builtin)
    vim.keymap.set('n', '<Leader>r', builtin.git_files, { desc = 'Telescope: git [r]epository files' })
    vim.keymap.set('n', '<Leader>f', builtin.find_files, { desc = 'Telescope: find [F]iles' })
    vim.keymap.set('n', '<Leader>F', function()
      builtin.find_files({ hidden = true })
    end, { desc = 'Telescope: find [f]iles (include hidden)' })
    vim.keymap.set('n', '<Leader>w', builtin.grep_string, { desc = 'Telescope: grep string [w]ord under cursor' })
    vim.keymap.set('n', '<Leader>W', function()
      builtin.grep_string({ search = vim.fn.expand('<cWORD>') })
    end, { desc = 'Telescope: grep string [W]ORD under cursor' })
    vim.keymap.set('n', '<Leader>h', builtin.help_tags, { desc = 'Telescope: [h]elp tags' })
    vim.keymap.set('n', '<Leader>g', builtin.live_grep, { desc = 'Telescope: live [g]rep' })
    vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols, { desc = 'Telescope: LSP document [s]ymbols' })
    vim.keymap.set('n', '<Leader>S', builtin.lsp_workspace_symbols, { desc = 'Telescope: LSP workspace [S]ymbols' })

    vim.keymap.set('n', '<Leader>/', builtin.search_history, { desc = 'Telescope: search [/] history' })
    vim.keymap.set('n', '<Leader>c', builtin.command_history, { desc = 'Telescope: [c]ommand history' })
    vim.keymap.set('n', '<Leader>j', builtin.jumplist, { desc = 'Telescope: [j]umplist history' })
    vim.keymap.set('n', '<Leader>k', builtin.keymaps, { desc = 'Telescope: [k]eymaps' })
    vim.keymap.set('n', '<Leader>l', builtin.filetypes, { desc = 'Telescope: filetype [l]anguage' })
    vim.keymap.set('n', '<Leader>p', builtin.builtin, { desc = 'Telescope: [b]uiltin' })
    vim.keymap.set('n', '<Leader>t', builtin.tagstack, { desc = 'Telescope: tagstack' })
    vim.keymap.set('n', '<Leader>z', builtin.spell_suggest, { desc = 'Telescope: spell suggest' })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions)
    vim.keymap.set('n', 'gr', builtin.lsp_references)
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
