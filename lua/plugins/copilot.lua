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
    keys = {
      {
        "<Space>as",
        function()
          vim.cmd("Copilot panel")
        end,
        desc = " Copilot suggestions",
        mode = { "n", "v" },
      },
    }
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
      model = "claude-3.5-sonnet",
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
