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
			-- vim.o.background = "dark"
			-- vim.cmd([[colorscheme kanagawa-dragon]])
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "hard", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},

		config = function()
			-- vim.o.background = "dark"
			-- vim.cmd([[colorscheme tokyonight-night]])
		end,
	},

	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({})
			vim.cmd([[colorscheme github_light]])
		end,
	},
}
