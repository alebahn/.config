local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  --vim.cmd.enew()

  -- wipe the directory buffer
  --vim.cmd.bw(data.buf)

  -- change to the directory
  --vim.cmd.cd(data.file)

  -- open the tree
  local api = require("nvim-tree.api")
  api.tree.open()
  if (data.file ~= vim.fn.getcwd()) then
    api.node.open.edit()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
