return {
  {
    -- Lightweight yet powerful formatter plugin for Neovim
    "stevearc/conform.nvim",
    opts = {
      lazy = false,
      notify_on_error = false,
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        go = { "gofmt" },
        -- rust = { "rustfmt" },
        python = { "black" },
        -- c = { "clang_format" },
        lua = { "stylua" },
        bash = { "shfmt", "shellcheck" },
        zsh = { "shfmt", "shellcheck" },
        sh = { "shfmt", "shellcheck" },
        css = { "prettier" },
        html = { "prettier" },
        tf = { "terraform_fmt" },
        json = { "jsonnetfmt", "jsonlint" },
        yaml = { "yamlfmt", "yamllint" },
      },
    },
  },

}
