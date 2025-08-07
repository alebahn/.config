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
        "vimdoc",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      enable = true,
      max_lines = 0, -- Show context for all lines
      trim_scope = "outer", -- Show context for outer scope
      mode = "cursor", -- Show context based on cursor position
      zindex = 20, -- Set z-index for the context window
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<Leader>gf",
        function()
          local gs = require("gitsigns")
          if vim.wo.diff then
            vim.cmd("silent! bd! gitsigns://")
            vim.cmd("silent! diffoff!")
            gs.refresh()
          else
            gs.diffthis()
          end
        end,
        desc = "Toggle Gitsigns diffthis",
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
      git = {
        enable = true,
      },
      renderer = {
        highlight_opened_files = "name",
        icons = {
          glyphs = {
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌"
            }
          },
          show = {
            git = true
          },
          git_placement = "after"
        }
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
        "pyright",
        "mypy",
        "ruff",
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
      { "<leader>d<", function() require("dap").up() end,                 desc = "Up Stack Frame" },
      { "<leader>d>", function() require("dap").down() end,               desc = "Down Stack Frame" },
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
    dependencies = {
      "anuvyklack/hydra.nvim",
    },
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
      "nvim-neotest/nvim-nio"
    },
    opts = {
      element_mappings = {
        stacks = {
          open = "<CR>",
          expand = "o",
        }
      }
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
  },
  {
    "nvimtools/hydra.nvim",
    config = function()
      require('hydra')({
        name = "Dap Hydra",
        mode = "n",
        body = "<leader>d",
        config = {
          color = "pink",
        },
        heads = {
          { "c", function() require("dap").continue() end,           { desc = "Continue", exit = true } },
          { "T", function() require("dap").terminate() end,          { desc = "Terminate", exit = true } },
          { "h", function() require("dap").step_out() end,           { desc = "Step Out" } },
          { "j", function() require("dap").step_over() end,          { desc = "Step Over" } },
          { "l", function() require("dap").step_into() end,          { desc = "Step Into" } },
          { "<", function() require("dap").up() end,                 { desc = "Up Stack Frame" } },
          { ">", function() require("dap").down() end,               { desc = "Down Stack Frame" } },
          { "<Esc>", nil, { exit = true, nowait = true, desc = false } }
        },
      })
    end,
  }
}

return plugins
