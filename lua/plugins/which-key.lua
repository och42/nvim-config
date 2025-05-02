return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      spec = {
        { "<Space>", group = " Search…" },
        { "<Space>a", group = " AI assistance…" },
        { "<Space>c", group = " Code…" },
        { "<Space>d", group = " Diagnostics…" },
      },
    },
  },
}
