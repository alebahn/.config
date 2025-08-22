local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<Leader>mp"] = { "<Plug>MarkdownPreviewToggle", "toggle markdown preview"},
    ["<Leader>f*"] = { "<cmd> Telescope grep_string<CR>", "find string in files"},
    ["<Leader>sh"] = { "<cmd> Gitsigns stage_hunk<CR>", "Stage hunk (gitsigns)"},
    ["<Leader>mt"] = { function()
      --toggle mouse mode
      if vim.o.mouse == "" then
        vim.o.mouse = "a"
        vim.o.relativenumber = true
        vim.o.number = true
        vim.cmd(":IndentBlanklineEnable")
        vim.o.signcolumn = "yes"
      else
        vim.o.mouse = ""
        vim.o.relativenumber = false
        vim.o.number = false
        vim.cmd(":IndentBlanklineDisable")
        vim.o.signcolumn = "no"
      end
    end, "toggle mouse mode"},
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv"},
    ["K"] = { ":m '<-2<CR>gv=gv"}
  }
}

return M
