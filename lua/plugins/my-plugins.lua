return {
  {
    "marko-cerovac/material.nvim",
        config = function()
      vim.cmd("colorscheme material-darker")
    end,
  },

  --  {
  --   "smoka7/hop.nvim",
  --   -- lazy = false,
  --   opts = {
  --     keys = "sdfghjklcvbnm",
  --   },
  -- },

  {
    -- Super fast git decorations implemented purely in Lua.
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- {
  --   "folke/snacks.nvim",
  -- },

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

  {
    "mfussenegger/nvim-dap",
    lazy = true,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-go").setup()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",  -- <--- вот эта строка
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = {
          "accept",      -- принять текущее предложение
          "fallback",    -- если меню не открыто — обычный Enter
        },
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.helm" },

}
