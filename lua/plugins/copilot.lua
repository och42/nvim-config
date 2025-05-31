local M = {}

function M.pick(kind)
  return function()
    local actions = require("CopilotChat.actions")
    local items = actions[kind .. "_actions"]()
    if not items then
      vim.health.warn("No " .. kind .. " found on the current line")
      return
    end
    require("CopilotChat.integrations.telescope").pick(items)
  end
end

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
      model = "claude-3.7-sonnet",
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
        "<Space>ad",
        M.pick("help"),
        desc = " Diagnostic Help (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<Space>ap",
        M.pick("prompt"),
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
