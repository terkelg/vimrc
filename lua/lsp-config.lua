local vim = vim
local coq = require 'coq'
local lsp = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspinstall').setup() -- important

coq.settings = {
  auto_start = true,
}

local servers = require('lspinstall').installed_servers()
for _, server in pairs(servers) do
  lsp[server].setup(coq.lsp_ensure_capabilities())
end

vim.fn.sign_define(
  'LspDiagnosticsSignError',
  { text = '', numhl = 'LspDiagnosticsDefaultError' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignWarning',
  { text = '', numhl = 'LspDiagnosticsDefaultWarning' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignInformation',
  { text = '', numhl = 'LspDiagnosticsDefaultInformation' }
)
vim.fn.sign_define(
  'LspDiagnosticsSignHint',
  { text = '', numhl = 'LspDiagnosticsDefaultHint' }
)

-- set default prefix.
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- virtual_text = false,
    virtual_text = { prefix = '' },
    signs = true,
    update_in_insert = false,
  }
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ',
  '   (Method)',
  '   (Function)',
  '   (Constructor)',
  ' ﴲ  (Field)',
  '[] (Variable)',
  '   (Class)',
  ' ﰮ  (Interface)',
  '   (Module)',
  ' 襁 (Property)',
  '   (Unit)',
  '   (Value)',
  ' 練 (Enum)',
  '   (Keyword)',
  '   (Snippet)',
  '   (Color)',
  '   (File)',
  '   (Reference)',
  '   (Folder)',
  '   (EnumMember)',
  ' ﲀ  (Constant)',
  ' ﳤ  (Struct)',
  '   (Event)',
  '   (Operator)',
  '   (TypeParameter)',
}
