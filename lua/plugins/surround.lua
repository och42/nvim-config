return {
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {
      surrounds = {
        ['Q'] = {
          add = { '“', '”' },
          find = function()
            local config = require('nvim-surround.config')
            return config.get_selection({ motion = 'aW' })
          end,
          delete = '^(“)().-(”)()$',
        },
      },
    },
  },
}
