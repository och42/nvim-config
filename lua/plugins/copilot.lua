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
      }
    }
  },
}
