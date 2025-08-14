local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  local filename = vim.fn.resolve(data.file)

  -- change to directory if it's not
  -- a subdirectory of the current directory
  local is_subdir = filename:find(vim.fn.getcwd()) == 1
  if not is_subdir then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  local api = require("nvim-tree.api")
  api.tree.open()

  -- Open the folder if the given folder isn't the root
  if (filename ~= vim.fn.getcwd()) then
    api.node.open.edit()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.scrolloff = 8
if vim.fn.has("persistent_undo") == 1 then
  local target_path = vim.fn.expand("~/.undodir")
  if vim.fn.isdirectory(target_path) == 0 then
    vim.fn.mkdir(target_path, "p", "0700")
  end
  vim.opt.undodir = target_path
  vim.opt.undofile = true
end
