return {

	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				enabled = false,
			},
			terminal = {
				win = { style = "terminal" },
			},
		},
	},

	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = {
					"accept",
					"fallback",
				},
			},
		},
	},

	{
		"marko-cerovac/material.nvim",
		config = function()
			vim.cmd("colorscheme material-darker")
		end,
	},
}
