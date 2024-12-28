return {
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {
			disable_when_zoomed = true,
		},
		config = function()
			local navigation = require("nvim-tmux-navigation")

			vim.keymap.set("n", "<C-h>", navigation.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", navigation.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", navigation.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", navigation.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-\\>", navigation.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<C-Space>", navigation.NvimTmuxNavigateNext)
		end,
	},
}
