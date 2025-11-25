return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "gopls",
        "bashls",
        "ansiblels",
        "pyright",
        "terraformls",
        "html",
        "cssls",
        "lua_ls",
        "jdtls",
        "helm_ls",
      })
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "shfmt",
        "shellcheck",
        "stylua",
        "black",
        "prettier",
        "jsonlint",
        "yamlfmt",
        "yamllint",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
