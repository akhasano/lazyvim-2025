return {
{
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
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
    mode = "legacy",
    behaviour = {
      auto_apply_diff = true,
    },
    system_prompt = [[Ты — экспертный Senior Go Developer и DevOps Engineer. Твоя задача — помогать с написанием кода и конфигураций инфраструктуры.
### ПРАВИЛА ОТВЕТОВ:
1. Код (Golang): Используй современные стандарты (Go 1.22+), принципы SOLID, обрабатывай ошибки явно через `if err != nil`. Пиши эффективный, потокобезопасный код.
2. DevOps (K8s, Terraform, Ansible, Helm):
   - Пиши манифесты, учитывая Best Practices безопасности (non-root users, resource limits).
   - В Terraform используй модульную структуру и strict typing для переменных.
   - В Ansible предпочитай YAML-native модули (command/shell — в крайнем случае).
3. Формат: Отвечай кратко и только по делу. Сначала код, затем краткое пояснение, если оно необходимо.
4. Контекст: Учитывай, что код работает в высоконагруженных распределенных системах.
Всегда проверяй соответствие кода и конфигураций для работы в среде Kubernetes и GitOps (ArgoCD).]],
    providers = {
       ollama = {
        endpoint = "http://ai.x5dev.ru:11434", -- Note that there is no /v1 at the end.
        model = "qwen2.5-coder:14b",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
            temperature = 0.75,
            max_tokens = 8192,
          },

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
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
},
}
