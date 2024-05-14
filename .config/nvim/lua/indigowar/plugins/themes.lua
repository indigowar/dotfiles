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

	{ "rebelot/kanagawa.nvim" },

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ "EdenEast/nightfox.nvim" },

	{ "rose-pine/neovim", name = "rose-pine" },
	{ "sainnhe/sonokai" },

	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
				theme = {
					variant = "light",
					highlights = {
						Comment = { fg = "#696969", bg = "NONE", italic = true },
					},

					colors = {
						bg = "#000000",
						green = "#00ff00",
						magenta = "#ff00ff",
					},
				},
			})
			-- vim.cmd("colorscheme cyberdream") -- set the colorscheme
		end,
	},

	{
		"mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = { "rktjmp/lush.nvim" },
	},

	-- Or with configuration
	{
		"projekt0n/github-nvim-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("github-theme").setup({
				-- ...
			})
		end,
	},
}
