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
    config = function ()
      require('flutter-tools').setup({

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
     ft={
          "javascript",
    "typescript",
    "html",
    "javascriptreact",
    "typescriptreact",

    "tsx"

    },
    config=function ()
      require('colorizer').setup(
        {
          "dart",
          "css",
          "javascript",
    "typescript",
    "html",
    "javascriptreact",
    "typescriptreact",
    "jsx",
    "tsx",
          

      },{mode="foreground"}
        
)      
    end
  }

}

return plugins
 

