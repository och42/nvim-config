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

    vim.keymap.set("n", "<Space>/", builtin.current_buffer_fuzzy_find, { desc = " fuzzy search" })
    vim.keymap.set("n", "<Space>B", builtin.buffers, { desc = " Search Buffers (all tabs)" })
    vim.keymap.set("n", "<Space>S", builtin.lsp_workspace_symbols, { desc = " Search Symbols (workspace)" })
    vim.keymap.set("n", "<Space>:", builtin.command_history, { desc = " Search Commands History" })
    vim.keymap.set("n", "<Space>f", builtin.find_files, { desc = " Search Filesystem" })
    vim.keymap.set("n", "<Space>h", builtin.help_tags, { desc = " Search Help" })
    vim.keymap.set("n", "<Space>l", builtin.filetypes, { desc = " Languages Filetypes" })
    vim.keymap.set("n", "<Space>r", builtin.git_files, { desc = " Search Git Repo" })
    vim.keymap.set("n", "<Space>s", builtin.lsp_document_symbols, { desc = " Search Symbols (document)" })
    vim.keymap.set("n", "<Space>w", builtin.grep_string, { desc = " grep `word`" })
    vim.keymap.set("n", "<Space>z", builtin.spell_suggest, { desc = " Zpell suggestions" })

    -- vim.keymap.set("n", "<Space>g", builtin.live_grep, { desc = " grep", additional_args = {"--hidden"} })
    vim.keymap.set("n", "<Space>g", function()
      builtin.live_grep({ additional_args = {"--hidden"} })
    end, { desc = " grep" })

    vim.keymap.set("n", "<Space>F", function()
      builtin.find_files({ hidden = true })
    end, { desc = " Search Filesystem (include hidden)" })
    vim.keymap.set("n", "<Space>W", function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = " grep `WORD`" })
    vim.keymap.set("n", "<Space>b", function()
      builtin.buffers({ only_cwd = true })
    end, { desc = " Search Buffers" })

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
