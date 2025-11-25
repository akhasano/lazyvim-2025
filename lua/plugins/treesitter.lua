return {
    {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Включить контекст
        max_lines = 5, -- Максимальное количество отображаемых строк контекста (0 для неограниченного)
        min_window_height = 0, -- Минимальная высота окна для отображения контекста
        line_numbers = true, -- Отображать номера строк
        multiline_threshold = 20, -- Количество строк, после которого отображается многострочный контекст
        trim_scope = "outer", -- Обрезка контекста: 'inner' (только текущий scope), 'outer' (все вложенные)
        mode = "cursor",
        separator = "─",
        on_attach = nil,
      })
    end,
  },

  {
    "nvim-treesitter",
    opts = {
      ensure_installed = { "terraform", "hcl", "helm" },
      highlight = { enable = true },
    },
  },

}
