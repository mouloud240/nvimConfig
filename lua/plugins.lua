local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  	{
		"ThePrimeagen/99",
		config = function()
			local _99 = require("99")

            -- For logging that is to a file if you wish to trace through requests
            -- for reporting bugs, i would not rely on this, but instead the provided
            -- logging mechanisms within 99.  This is for more debugging purposes
            local cwd = vim.uv.cwd()
            local basename = vim.fs.basename(cwd)
			_99.setup({
				logger = {
					level = _99.DEBUG,
					path = "/tmp/" .. basename .. ".99.debug",
					print_on_error = true,
				},

                --- A new feature that is centered around tags
                completion = {
                    --- Defaults to .cursor/rules
                    -- I am going to disable these until i understand the
                    -- problem better.  Inside of cursor rules there is also
                    -- application rules, which means i need to apply these
                    -- differently
                    -- cursor_rules = "<custom path to cursor rules>"

                    --- A list of folders where you have your own SKILL.md
                    --- Expected format:
                    --- /path/to/dir/<skill_name>/SKILL.md
                    ---
                    --- Example:
                    --- Input Path:
                    --- "scratch/custom_rules/"
                    ---
                    --- Output Rules:
                    --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
                    --- ... the other rules in that dir ...
                    ---
                    custom_rules = {
                      "scratch/custom_rules/",
                    },

                    --- What autocomplete do you use.  We currently only
                    --- support cmp right now
                    source = "cmp",
                },

                --- WARNING: if you change cwd then this is likely broken
                --- ill likely fix this in a later change
                ---
                --- md_files is a list of files to look for and auto add based on the location
                --- of the originating request.  That means if you are at /foo/bar/baz.lua
                --- the system will automagically look for:
                --- /foo/bar/AGENT.md
                --- /foo/AGENT.md
                --- assuming that /foo is project root (based on cwd)
				md_files = {
					"AGENT.md",
				},
			})

            -- Create your own short cuts for the different types of actions
			vim.keymap.set("n", "<leader>9f", function()
				_99.fill_in_function()
			end)
            -- take extra note that i have visual selection only in v mode
            -- technically whatever your last visual selection is, will be used
            -- so i have this set to visual mode so i dont screw up and use an
            -- old visual selection
            --
            -- likely ill add a mode check and assert on required visual mode
            -- so just prepare for it now
			vim.keymap.set("v", "<leader>9v", function()
				_99.visual()
			end)

            --- if you have a request you dont want to make any changes, just cancel it
			vim.keymap.set("v", "<leader>9s", function()
				_99.stop_all_requests()
			end)

            --- Example: Using rules + actions for custom behaviors
            --- Create a rule file like ~/.rules/debug.md that defines custom behavior.
            --- For instance, a "debug" rule could automatically add printf statements
            --- throughout a function to help debug its execution flow.
			vim.keymap.set("n", "<leader>9fd", function()
				_99.fill_in_function()
			end)
		end,
	},
{
  "nvim-tree/nvim-tree.lua",
  opts = {
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
  },
},

{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},
{
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
        processor = "magick_cli",
    }
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
    'MeanderingProgrammer/render-markdown.nvim',

    ft={"markdown"},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
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
