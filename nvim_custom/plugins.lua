local plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        filetypes = {
          gitcommit = true,
        },
        suggestion = {
          auto_trigger = true,
        }
      })
    end,
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
        "rust",
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
      view = {
        width = 70
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimtools/none-ls.nvim",
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
        "clang-format",
        "rust-analyzer",
        "python-lsp-server"
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
      vim.g.mkdp_theme = "light"
    end,
    ft = "markdown"
  },
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,  desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,           desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,      desc = "Run to Cursor" },
      { "<leader>dT", function() require("dap").terminate() end,          desc = "Terminate" },
      { "<leader>dh", function() require("dap").step_out() end,           desc = "Step Out" },
      { "<leader>dj", function() require("dap").step_over() end,          desc = "Step Over" },
      { "<leader>dl", function() require("dap").step_into() end,          desc = "Step Into" },
    },
    config = function()
      local dap = require("dap")
      dap.adapters.cppdbg = {
        name = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
        cwd = "${workspaceFolder}",
      }
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "seet pretty print on"}
      }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      automatic_installation = {
        -- These will be configured by separate plugins.
        exclude = {
          "delve",
          "python",
        },
      },
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "cpptools"
        -- "bash",
        -- "codelldb",
        -- "php",
        -- "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI"
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>ut",
        vim.cmd.UndotreeToggle,
        desc = "Toggle Undo Tree"
      }
    }
  }
}

return plugins
