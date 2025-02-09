local partial = require("plenary.functional").partial

return {
  "lewis6991/gitsigns.nvim",

  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      vim.keymap.set("n", "[c", partial(gitsigns.nav_hunk, "prev"))
      vim.keymap.set("n", "]c", partial(gitsigns.nav_hunk, "next"))
      vim.keymap.set("n", "<Space>cb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = " Blame" })
      vim.keymap.set("n", "<Space>cB", function()
        gitsigns.blame_line({ full = true, ignore_whitespace = true })
      end, { desc = " Blame (ignore whitespace)" })
    end,
  },
}
