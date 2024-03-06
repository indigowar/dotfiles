return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("silicon").setup({
			font = "FiraCode Nerd Font Mono=34;Noto Sans=34",
			theme = "Visual Studio Dark+",
		})
	end,
}
