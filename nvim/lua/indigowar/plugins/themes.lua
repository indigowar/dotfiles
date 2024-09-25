return {
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false,
			dimInactive = false,
			terminalColors = true,
			theme = "dragon",
			background = {
				dark = "dragon",
				light = "lotus",
			},
		},

		config = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},

	{
		"luisiacc/gruvbox-baby",
		config = function() end,
	},
}
