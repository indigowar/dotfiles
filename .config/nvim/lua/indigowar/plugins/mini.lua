return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.bracketed").setup()
		require("mini.files").setup({
			options = {
				use_as_default_explorer = false,
			},
		})

		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		require("mini.statusline").setup()

		vim.keymap.set("n", "<leader>ef", ":lua MiniFiles.open()<CR>", { desc = "[E]xplore [F]iles" })
	end,
}
