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
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "vim",
        "lua",
        "c",
        "vimdoc"
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      diagnostics = {
        enable = true
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "clangd",
        "clang-format"
      },
    },
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
}

return plugins
