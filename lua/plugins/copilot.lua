return {
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set({"n", "v"}, "<Space>as", "<cmd>Copilot panel<CR>", {
        desc = "Copilot suggestions",
        silent = true
      })
      vim.keymap.set('i', '<C-Enter>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.g.copilot_no_tab_map = true
      vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      mappings = {
        accept_diff = {
          normal = "",
          insert = "",
        },
        reset = {
          normal = "",
          insert = "",
        },
      },
      question_header = "  User ",
      answer_header = "  Copilot ",
      model = "claude-sonnet-4",
    },
    keys = {
      {
        "<Space>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = " Toggle Chat Window (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<Space>ap",
        function ()
          return require("CopilotChat").select_prompt()
        end,
        desc = " Prompt Actions (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<Space>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = " Reset (CopilotChat)",
        mode = { "n", "v" },
      },
    },
  },
}
