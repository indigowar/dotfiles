return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.g.background = "light"
			vim.cmd("colorscheme github_light")
		end,
	},
}
