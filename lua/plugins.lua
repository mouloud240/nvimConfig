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
      }
    }
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require('flutter-tools').setup({
            color = {
                enabled = true,
                background = false,
                foreground = false,
                virtual_text = true,
                virtual_text_str = "■",
            },
        })
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
    "tsx"
  },
  config = function()
    require('nvim-ts-autotag').setup {
      filetypes = {
        "javascript",
        "typescript",
        "html",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx"
      }
    }
  end
},

  {
    "tpope/vim-surround",
    lazy=false
  },
  {
    "alvan/vim-closetag",
    config=function ()
    end,
    lazy=false
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
        require('colorizer').setup({
            'css',
            'scss',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'dart', -- Ensure Dart is included
            'html',
            'jsx',
            'tsx',
        }, {
            mode = 'background', -- Display mode
            RRGGBBAA = true,      -- Enable #RRGGBBAA hex codes
            rgb_fn = true,        -- Enable rgb(...) and rgba(...) functions
            hsl_fn = true,        -- Enable hsl(...) and hsla(...) functions
            css = true,           -- Enable all CSS features
            css_fn = true,        -- Enable all CSS functions
            -- Additional Dart-specific settings
            dart = {
                rgb_0x = true, -- Enable 0xRRGGBB colors for Dart
            },
        })
    end
},
  {
    "ThePrimeagen/vim-be-good",
    lazy=false
  },
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require('tailwindcss-colorizer-cmp').setup({
                color_square_width = 2, -- Customize the width of the color square
            })
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
    "Djancyp/better-comments.nvim",
    lazy=false,
    config=function ()
      require('better-comments').setup({
tags = {
        {
            name = "TODO",
            fg = "white",
            bg = "#0a7aca",
            bold = true,
            virtual_text = "",
        },
        {
            name = "FIX",
            fg = "white",
            bg = "#f44747",
            bold = true,
            virtual_text = "This is virtual Text from FIX",
        },
        {
            name = "WARNING",
            fg = "#FFA500",
            bg = "",
            bold = false,
            virtual_text = "This is virtual Text from WARNING",
        },
        {
            name = "!",
            fg = "#f44747",
            bg = "",
            bold = true,
            virtual_text = "",
        }

    }
      })
      
    end
   }
}

return plugins


