local plugins = {
  {
    "github/copilot.vim",
    event = "InsertEnter"
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "BufEnter"
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    init = function()
      vim.g.mkdp_open_to_the_world = 1
    end,
    ft = "markdown"
  },
  default_plugin_config_replace = {
    nvim_tree = {
      disable_netrw = false,
      hijack_netrw = true,
    }
  },
  builtins = {
      "2html_plugin",
      "getscript",
      "getscriptPlugin",
      "gzip",
      "logipat",
      --"netrw",
      --"netrwPlugin",
      --"netrwSettings",
      --"netrwFileHandlers",
      "matchit",
      "tar",
      "tarPlugin",
      "rrhelper",
      "spellfile_plugin",
      "vimball",
      "vimballPlugin",
      "zip",
      "zipPlugin",

  }
}

return plugins
