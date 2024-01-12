local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<Leader>mp"] = { "<Plug>MarkdownPreviewToggle", "toggle markdown preview"}
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv"},
    ["K"] = { ":m '<-2<CR>gv=gv"}
  }
}

return M
