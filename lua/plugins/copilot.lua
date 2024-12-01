return {
  {
    'github/copilot.vim',
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    event = 'VeryLazy',
    branch = 'canary',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      mappings = {
        reset = {
          normal = '',
          insert = '',
        }
      },
      question_header = "  User ",
      answer_header = "  Copilot ",
    },
    keys = {
      { '<Space>aa', function() return require('CopilotChat').toggle() end, desc = 'CopilotChat: Toggle' },
    },
  },
}
