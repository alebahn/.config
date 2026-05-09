local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<Leader>mp"] = { "<Plug>MarkdownPreviewToggle", "toggle markdown preview"},
    -- ["<LocalLeader>a"] = { "<cmd> lua require('idris2.code_action').add_clause()<CR>", "add clause"},

    ["<Leader>a"] = { "<cmd> lua require('idris2.code_action').add_clause()<CR>", "add clause"},
    -- ["<LocalLeader>r"] = { "<cmd> lua require('idris2.code_action').<CR>", "reload file"},
    -- ["<LocalLeader>t"] = { "<cmd> lua require('idris2.code_action').<CR>", "show type"},
    ["<LocalLeader>a"] = { "<cmd> lua require('idris2.code_action').add_clause()<CR>", "Create an initial clause for a type declaration."},
    ["<LocalLeader>c"] = { "<cmd> lua require('idris2.code_action').case_split()<CR>", "case split"},
    ["<LocalLeader>mc"] = { "<cmd> lua require('idris2.code_action').make_case()<CR>", "make case"},
    ["<LocalLeader>w"] = { "<cmd> lua require('idris2.code_action').make_with()<CR>", "add with clause"},
    -- ["<LocalLeader>e"] = { "<cmd> lua require('idris2.code_action').<CR>", "evaluate expression"},
    ["<LocalLeader>l"] = { "<cmd> lua require('idris2.code_action').make_lemma()<CR>", "make lemma"},
    -- ["<LocalLeader>m"] = { "<cmd> lua require('idris2.code_action').<CR>", "add missing clause"},
    ["<LocalLeader>f"] = { "<cmd> lua require('idris2.code_action').refine_hole()<CR>", "refine item"},
    -- ["<LocalLeader>o"] = { "<cmd> lua require('idris2.code_action').<CR>", "obvious proof search"},
    ["<LocalLeader>s"] = { "<cmd> lua require('idris2.code_action').expr_search()<CR>", "proof search"},
    -- ["<LocalLeader>i"] = { "<cmd> lua require('idris2.code_action').<CR>", "open idris response window"},
    -- ["<LocalLeader>d"] = { "<cmd> lua require('idris2.code_action').<CR>", "show documentation"},

  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv"},
    ["K"] = { ":m '<-2<CR>gv=gv"}
  }
}

return M
