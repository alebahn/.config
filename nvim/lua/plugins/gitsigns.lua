return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>ghd",
        function()
          local gitsigns = require("gitsigns")

          if vim.wo.diff then
            vim.cmd("silent! bd! gitsigns://")
            vim.cmd("silent! diffoff!")
            gitsigns.refresh()
          else
            gitsigns.diffthis()
          end
        end,
        desc = "Toggle Gitsigns diffthis",
      },
    },
    opts = function(_, opts)
      local on_attach = opts.on_attach

      opts.on_attach = function(buffer)
        on_attach(buffer)
        vim.keymap.set("n", "<leader>ghd", function()
          local gitsigns = require("gitsigns")

          if vim.wo.diff then
            vim.cmd("silent! bd! gitsigns://")
            vim.cmd("silent! diffoff!")
            gitsigns.refresh()
          else
            gitsigns.diffthis()
          end
        end, {
          buffer = buffer,
          desc = "Toggle Gitsigns diffthis",
          silent = true,
        })
      end
    end,
  },
}
