-- Load default configurations
local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local lspconfig = require "lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

-- List of servers to setup with default config
local servers = { "html", "cssls", "ts_ls","clangd","prismals" }

-- Setup each LSP server
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = nvlsp.on_init
  }

end
lspconfig.jdtls.setup({
    cmd = { "jdtls" },
    root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
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
lspconfig.dockerls.setup({
  on_attach=on_attach,
  capabilities=capabilities
})
lspconfig.tailwindcss.setup({
  on_attach=on_attach,
  capabilities=capabilities
})
lspconfig.eslint.setup({
  on_attach=on_attach,
  capabilities=capabilities
})
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})
lspconfig.pyright.setup({
  on_attach=on_attach,
  capabilities=capabilities,
  filetypes={"python"}
})
lspconfig.dartls.setup({
  cmd = { 'dart', os.getenv('HOME') .. '/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot', '--lsp' },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern('pubspec.yaml'),
  settings = {
    dart = {
      enableSdkFormatter = true,
    },
  },
})
-- 
--
--Example of setting up a single server with custom config
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_init = nvlsp.on_init,
-- }
