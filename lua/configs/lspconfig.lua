-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = vim.lsp.config

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "ruff", "templ", "clangd", "zls" }
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable { lsp }
end

lspconfig("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
  filetypes = { "rust", "rs" },
})
vim.lsp.enable "rust-analyzer"

lspconfig("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    },
  },
})
vim.lsp.enable "pyright"

lspconfig("tailwindcss", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "templ", "astro", "javascript", "typescript", "react", "html", "typescriptreact" },
  settings = {
    tailwindCSS = {
      includeLanguages = {
        templ = "html",
      },
    },
  },
})
vim.lsp.enable "tailwindcss"

lspconfig("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  -- root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
    },
  },
})
vim.lsp.enable "gopls"
