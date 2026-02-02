-- Load default configurations
local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities
local on_init = nvlsp.on_init

-- Helper function to create server configs
local function setup_server(name, config)
  config = config or {}
  
  vim.lsp.config[name] = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
    on_init = on_init,
  }, config)
  
  vim.lsp.enable(name)
end

-- List of servers with default config
local servers = { 
  "html", "cssls", "ts_ls", "clangd", "prismals", 
  "intelephense", "gopls", "gh_actions_ls", "buf_ls", 
  "sqlls", "sqls", "dockerls", "tailwindcss", "eslint", "pyright","marksman"
}

-- Setup each server with defaults
for _, server in ipairs(servers) do
  setup_server(server)
end

-- JDTLS with custom config
setup_server("jdtls", {
  cmd = { "jdtls" },
  root_dir = vim.fs.root(0, {"pom.xml", "gradle.build", ".git"}),
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "automatic",
      },
      inlayHints = {
        parameterNames = { enabled = "all" },
      },
    },
  },
})

-- Emmet LS with custom config
setup_server("emmet_ls", {
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
})

-- R Language Server
setup_server("r_language_server", {
  cmd = { "R", "--slave", "-e", "languageserver::run()" },
  filetypes = { "r", "rmd" },
})

-- Dart LS
setup_server("dartls", {
  cmd = { 
    'dart', 
    os.getenv('HOME') .. '/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', 
    '--lsp' 
  },
  root_dir = vim.fs.root(0, {'pubspec.yaml'}),
})
