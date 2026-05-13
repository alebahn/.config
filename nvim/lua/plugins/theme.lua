local theme_file = vim.fn.stdpath("config") .. "/omarchy/current/theme/neovim.lua"

if vim.fn.filereadable(theme_file) == 1 then
	return dofile(theme_file)
end

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-night",
		},
	},
}
