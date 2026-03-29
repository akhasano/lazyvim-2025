return {

	{
		"snacks.nvim",
		opts = {
			dashboard = {
				enabled = false,
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
					"accept", -- принять текущее предложение
					"fallback", -- если меню не открыто — обычный Enter
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
