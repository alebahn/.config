local function idris_code_action(action)
  return function()
    require("idris2.code_action")[action]()
  end
end

return {
  {
    "idris-community/idris2-nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "MunifTanjim/nui.nvim",
    },
    ft = "idris2",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "idris2",
        callback = function(event)
          local opts = function(desc)
            return { buffer = event.buf, desc = desc }
          end

          vim.keymap.set(
            "n",
            "<localleader>a",
            idris_code_action("add_clause"),
            opts("Create an initial clause for a type declaration")
          )
          vim.keymap.set("n", "<localleader>c", idris_code_action("case_split"), opts("Case split"))
          vim.keymap.set("n", "<localleader>mc", idris_code_action("make_case"), opts("Make case"))
          vim.keymap.set("n", "<localleader>w", idris_code_action("make_with"), opts("Add with clause"))
          vim.keymap.set("n", "<localleader>l", idris_code_action("make_lemma"), opts("Make lemma"))
          vim.keymap.set("n", "<localleader>f", idris_code_action("refine_hole"), opts("Refine item"))
          vim.keymap.set("n", "<localleader>s", idris_code_action("expr_search"), opts("Proof search"))
        end,
      })
    end,
    opts = {
      autostart_semantic = false,
      code_action_post_hook = function()
        vim.cmd("silent write")
      end,
      use_default_semantic_hl_groups = false,
    },
  },
}
