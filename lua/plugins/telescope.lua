return {
  "nvim-telescope/telescope.nvim",

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-d>"] = "results_scrolling_down",
            ["<C-u>"] = "results_scrolling_up",
            ["<M-d>"] = "preview_scrolling_down",
            ["<M-u>"] = "preview_scrolling_up",
            ["<M-h>"] = "preview_scrolling_left",
            ["<M-l>"] = "preview_scrolling_right",
            ["<C-s>"] = "file_split",
            ["<C-x>"] = false, -- Default file_split keymap
            ["<C-f>"] = false, -- Default preview_scrolling_left keymap
            ["<C-k>"] = false, -- Default preview_scrolling_right keymap
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-x>"] = "delete_buffer",
            },
          },
        },
        git_files = {
          git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--deduplicate" },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<Space>f/", builtin.current_buffer_fuzzy_find, { desc = " fuzzy find" })
    vim.keymap.set("n", "<Space>fB", builtin.buffers, { desc = " Buffers (all tabs)" })
    vim.keymap.set("n", "<Space>fS", builtin.lsp_workspace_symbols, { desc = " Symbols (workspace)" })
    vim.keymap.set("n", "<Space>fc", builtin.command_history, { desc = " commands history" })
    vim.keymap.set("n", "<Space>ff", builtin.find_files, { desc = " Filesystem" })
    vim.keymap.set("n", "<Space>fg", builtin.live_grep, { desc = " grep" })
    vim.keymap.set("n", "<Space>fh", builtin.help_tags, { desc = " help" })
    vim.keymap.set("n", "<Space>fl", builtin.filetypes, { desc = " languages filetypes" })
    vim.keymap.set("n", "<Space>fr", builtin.git_files, { desc = " Repository" })
    vim.keymap.set("n", "<Space>fs", builtin.lsp_document_symbols, { desc = " Symbols (document)" })
    vim.keymap.set("n", "<Space>fw", builtin.grep_string, { desc = " word" })
    vim.keymap.set("n", "<Space>fz", builtin.spell_suggest, { desc = " Zpell suggestions" })

    vim.keymap.set("n", "<Space>fF", function()
      builtin.find_files({ hidden = true })
    end, { desc = " Filesystem (include hidden)" })
    vim.keymap.set("n", "<Space>fW", function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = " WORD" })
    vim.keymap.set("n", "<Space>fb", function()
      builtin.buffers({ only_cwd = true })
    end, { desc = " Buffers" })

    vim.keymap.set("n", "gd", builtin.lsp_definitions)
    vim.keymap.set("n", "gr", builtin.lsp_references)
  end,

  dependencies = {
    {
      "nvim-lua/plenary.nvim",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
}
