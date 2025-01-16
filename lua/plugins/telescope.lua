return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-s>"] = "file_split",
            ["<M-d>"] = "results_scrolling_down",
            ["<M-u>"] = "results_scrolling_up",
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

    vim.keymap.set("n", "<Space>B", builtin.buffers, { desc = " Buffers (all tabs)" })
    vim.keymap.set("n", "<Space>S", builtin.lsp_workspace_symbols, { desc = " Symbols (workspace)" })
    vim.keymap.set("n", "<Space>f", builtin.find_files, { desc = " Filesystem" })
    vim.keymap.set("n", "<Space>g", builtin.live_grep, { desc = " grep" })
    vim.keymap.set("n", "<Space>h", builtin.help_tags, { desc = " help" })
    vim.keymap.set("n", "<Space>r", builtin.git_files, { desc = " Repository" })
    vim.keymap.set("n", "<Space>s", builtin.lsp_document_symbols, { desc = " Symbols (document)" })
    vim.keymap.set("n", "<Space>w", builtin.grep_string, { desc = " word" })
    vim.keymap.set("n", "<Space>z", builtin.spell_suggest, { desc = " Zpell suggestions" })

    vim.keymap.set("n", "<Space>F", function()
      builtin.find_files({ hidden = true })
    end, { desc = " Filesystem (include hidden)" })
    vim.keymap.set("n", "<Space>W", function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = " WORD" })
    vim.keymap.set("n", "<Space>b", function()
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
