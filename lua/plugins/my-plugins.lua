return {

  {
    -- Super fast git decorations implemented purely in Lua.
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
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
    "marko-cerovac/material.nvim",
    config = function()
      vim.cmd("colorscheme material-darker")
    end,
  },

  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",
      -- for example
      provider = "ollama",
      system_prompt = "Ты — профессиональный программист. Отвечай кратко и по делу на языке пользователя.",
      providers = {
        ollama = {
          endpoint = "http://ai.x5dev.ru:11434", -- Note that there is no /v1 at the end.
          model = "qwen3:14b",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
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
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup("python3")
    end,
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
      "nvim-neotest/nvim-nio", -- <--- вот эта строка
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
}
