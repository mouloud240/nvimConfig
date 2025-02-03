local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },

  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        flutter_path = os.getenv "HOME" .. "/snap/flutter/common/flutter/bin/flutter",
        lsp = {
          cmd = {
            os.getenv "HOME" .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/dart",
            os.getenv "HOME"
              .. "/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot",
            "--lsp",
          },
          color = {
            enabled = true,
            background = true,
            background_color = { r = 19, g = 17, b = 24 }, -- Define background color

            foreground = false,
            virtual_text = false,
            virtual_text_str = "■",
          },
          on_attach = function(_, bufnr)
            -- Your custom on_attach function here, if needed
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          settings = {
            dart = {
              completeFunctionCalls = true,
            },
          },
        },
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "html",
      "javascriptreact",
      "typescriptreact",
      "jsx",
      "tsx",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = {
          "javascript",
          "typescript",
          "html",
          "javascriptreact",
          "typescriptreact",
          "jsx",
          "tsx",
        },
      }
    end,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "alvan/vim-closetag",
    config = function() end,
    lazy = false,
  },

  {
    "norcalli/nvim-colorizer.lua",
    ft = {
      "javascript",
      "typescript",
      "html",
      "javascriptreact",
      "typescriptreact",
      "dart", -- Add Dart here
      "css",
      "scss",
      "jsx",
      "tsx",
    },
    config = function()
      require("colorizer").setup({
        "css",
        "scss",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "dart", -- Ensure Dart is included
        "html",
        "jsx",
        "tsx",
      }, {
        mode = "background", -- Display mode
        RRGGBBAA = true, -- Enable #RRGGBBAA hex codes
        rgb_fn = true, -- Enable rgb(...) and rgba(...) functions
        hsl_fn = true, -- Enable hsl(...) and hsla(...) functions
        css = true, -- Enable all CSS features
        css_fn = true, -- Enable all CSS functions
        -- Additional Dart-specific settings
        dart = {
          rgb_0x = true, -- Enable 0xRRGGBB colors for Dart
        },
      })
    end,
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2, -- Customize the width of the color square
      }
    end,
    ft = {
      "html",
      "css",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
      "rust",
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        dart = { "dartformat" }, -- Use dart format for Dart files
      },
      formatters = {
        dartformat = {
          command = "dart",
          args = function()
            return { "format", vim.api.nvim_buf_get_name(0) } -- Pass the file path
          end,
          stdin = false, -- Disable stdin as it's not required
        },
      },
    },
  },
{
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('null-ls').setup()
  end
}
  ,{
  'wa11breaker/flutter-bloc.nvim',
  ft = { "dart" },
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('flutter-bloc').setup()
  end
},
  {
  "prisma/vim-prisma",
    ft={
      "prisma",
    }
  },
 {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true ,}
      ,
  
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
    keys:{
      {
        "n",
        "<leader>mm",
        function ()
         Snacks=require("Snacks")
          Snacks.picker.grep
          
        end
      }
    },
},
  {
  "CopilotC-Nvim/CopilotChat.nvim",
    lazy=false,
  dependencies = { "github/copilot.vim" }, -- Requires copilot.vim
    ft = {
      "markdown",
      "vimwiki",
      "text",
      "dart",
    },
  config = function()
      
    require("CopilotChat").setup()
  end
  },
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>fr",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },

  },
}
}

return plugins
