return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},

	config = function()
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
			sort_case_insensitive = false,
			sort_function = nil,

			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					with_expanders = nil,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},

			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
				provider = function(icon, node, state)
					if node.type == "file" or node.type == "terminal" then
						local success, web_devicons = pcall(require, "nvim-web-devicons")
						local name = node.type == "terminal" and "terminal" or node.name
						if success then
							local devicon, hl = web_devicons.get_icon(name)
							icon.text = devicon or icon.text
							icon.highlight = hl or icon.highlight
						end
					end
				end,
				default = "*",
				highlight = "NeoTreeFileIcon",
			},

			modified = {
				symbol = "[+]",
				highlight = "NeoTreeModified",
			},

			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},

			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "✖",
					renamed = "󰁕",

					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},

			file_size = {
				enabled = true,
				width = 12,
				required_width = 64,
			},
			type = {
				enabled = true,
				width = 10,
				required_width = 122,
			},
			last_modified = {
				enabled = true,
				width = 20,
				required_width = 88,
			},
			created = {
				enabled = true,
				width = 20,
				required_width = 110,
			},
			symlink_target = {
				enabled = false,
			},

			commands = {},

			window = {
				position = "left",
				width = 40,

				mappings_options = {
					noremap = true,
					nowait = true,
				},

				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false,
					},

					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel",

					["P"] = "",
					["l"] = "",

					["S"] = "open_split",
					["s"] = "open_vsplit",

					["t"] = "",
					["w"] = "open_with_window_picker",

					["C"] = "close_all_subnodes",
					["z"] = "close_all_nodes",
					["Z"] = "expand_all_nodes",

					["a"] = "",
					["A"] = "",

					["%"] = {
						"add",
						config = {
							show_path = "none", -- "none", "relative", "absolute"
						},
					},
					["D"] = "add_directory",

					["d"] = "delete",

					["R"] = "rename",

					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",

					["c"] = {
						"copy",
						config = {
							show_path = "none", -- "none", "relative", "absolute"
						},
					},

					["m"] = {
						"move",
						config = { show_path = "relative" },
					},

					["q"] = "close_window",
					["r"] = "refresh",
					["?"] = "show_help",
					["<"] = "prev_source",
					[">"] = "next_source",
					["i"] = "show_file_details",
				},

				nesting_rules = {},

				filesystem = {
					filtered_items = {
						visible = false,
						hide_dotfiles = true,
						hide_gitignored = true,
						hide_by_name = {
							"node_modules",
						},
						always_show = {
							".gitignored",
							".dockerignored",
							".env",
						},
					},

					follow_current_file = {
						enabled = false,
						leave_dirs_opens = false,
					},

					hijack_netrw_behavior = "open_default",

					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["D"] = "fuzzy_finder_directory",
							["#"] = "fuzzy_sorter",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["[g"] = "prev_git_modified",
							["]g"] = "next_git_modified",
							["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
							["oc"] = { "order_by_created", nowait = false },
							["od"] = { "order_by_diagnostics", nowait = false },
							["og"] = { "order_by_git_status", nowait = false },
							["om"] = { "order_by_modified", nowait = false },
							["on"] = { "order_by_name", nowait = false },
							["os"] = { "order_by_size", nowait = false },
							["ot"] = { "order_by_type", nowait = false },
						},
						fuzzy_finder_mappings = {
							["<down>"] = "move_cursor_down",
							["<C-n>"] = "move_cursor_down",
							["<up>"] = "move_cursor_up",
							["<C-p>"] = "move_cursor_up",
						},
					},

					commands = {},
				},

				buffers = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
					group_empty_dirs = true,
					show_unloaded = true,
					window = {
						mappings = {
							["bd"] = "buffer_delete",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
							["oc"] = { "order_by_created", nowait = false },
							["od"] = { "order_by_diagnostics", nowait = false },
							["om"] = { "order_by_modified", nowait = false },
							["on"] = { "order_by_name", nowait = false },
							["os"] = { "order_by_size", nowait = false },
							["ot"] = { "order_by_type", nowait = false },
						},
					},
				},

				git_status = {
					window = {
						position = "float",
						mappings = {
							["A"] = "git_add_all",
							["gu"] = "git_unstage_file",
							["ga"] = "git_add_file",
							["gr"] = "git_revert_file",
							["gc"] = "git_commit",
							["gp"] = "git_push",
							["gg"] = "git_commit_and_push",
							["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
							["oc"] = { "order_by_created", nowait = false },
							["od"] = { "order_by_diagnostics", nowait = false },
							["om"] = { "order_by_modified", nowait = false },
							["on"] = { "order_by_name", nowait = false },
							["os"] = { "order_by_size", nowait = false },
							["ot"] = { "order_by_type", nowait = false },
						},
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>se", ":Neotree reveal<CR>", { desc = "[S]how tree" })
	end,
}