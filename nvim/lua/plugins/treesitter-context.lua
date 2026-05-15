return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true,
      max_lines = 0,
      trim_scope = "outer",
      mode = "cursor",
      zindex = 20,
    },
  },
}
