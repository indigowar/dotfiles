return {
	"sainnhe/edge",
	config = function()
		vim.g.edge_enable_italic = true
		vim.g.airline_theme = "edge"
		vim.g.edge_style = "aura"

		-- vim.o.background = "light"
		-- vim.cmd([[colorscheme edge]])
	end,
}
