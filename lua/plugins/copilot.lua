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
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      mappings = {
        reset = {
          normal = "",
          insert = "",
        },
      },
      question_header = "  User ",
      answer_header = "  Copilot ",
    },
    keys = {
      {
        "\\aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = " Toggle Chat Window (CopilotChat)",
      },
      { "\\ad", M.pick("help"), desc = " Diagnostic Help (CopilotChat)" },
      { "\\ap", M.pick("prompt"), desc = " Prompt Actions (CopilotChat)" },
      {
        "\\ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = " Reset (CopilotChat)",
      },
    },
  },
}
