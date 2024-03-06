return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 100,
		config = function()
			vim.cmd.hi("Comment gui=none")
		end,
	},

	{
		"sontungexpt/witch",
		priority = 100,
		lazy = false,
		config = function(_, opts)
			require("witch").setup(opts)
		end,
	},

	{
		"askfiy/visual_studio_code",
		priority = 100,
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 100,
	},
}
