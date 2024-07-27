return {
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
		-- colors = {
		-- 	palette = {},
		-- 	theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		-- },
		-- overrides = function(colors)
		-- 	return {}
		-- end,
		theme = "dragon",
		background = {
			dark = "dragon",
			light = "lotus",
		},
	},

	config = function()
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
