local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  
{
  "vyfor/cord.nvim",
  build = ":Cord update", -- needs compilation
  event = "VeryLazy",
  config = function()
    require("cord").setup({
        editor={
          tooltip="Better than VSCode!",
          
        },
                assets={

    },
        })
          
  end,
},
  {
  "iamcco/markdown-preview.nvim",
    lazy=false,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
},


{
  "stevearc/dressing.nvim",
  event = "VeryLazy"
},
{
"christoomey/vim-tmux-navigator",
    lazy = false,
  }
,
  
  {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- LSP Servers
      "html-lsp",
      "css-lsp",
      "typescript-language-server",
      "clangd",
      "prisma-language-server",
      "jdtls",
      "dockerfile-language-server",
        "pyright",
"tailwindcss-language-server",
      "eslint-lsp",
      "emmet-ls",
      "pyright",
      
      -- Formatters
      "prettierd",
      "stylua",

      -- (Optional) linters or other utilities
      -- Add any other tools you're using with null-ls or conform
    },
  },
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
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
        debug=true,
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
            },
            on_attach = function(client, bufnr)
                -- Only enable formatting for null-ls
                if client.name == "null-ls" then
                    client.server_capabilities.documentFormattingProvider = true
                    client.server_capabilities.documentRangeFormattingProvider = true
                else
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end
            end,
        })
    end,
} , 
  {
  "prisma/vim-prisma",
    ft={
      "prisma",
    }
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
  "folke/todo-comments.nvim",

  lazy=false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
  
  }
  
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
