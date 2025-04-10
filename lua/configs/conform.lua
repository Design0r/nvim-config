local options = {
  formatters = {
    djlint = {
      prepend_args = { "--indent", "2" },
    },
    -- ["goimports-reviser"] = {
    --   prepend_args = { "--rm-unused" },
    -- },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = {
      -- To fix auto-fixable lint errors.
      "ruff_fix",
      -- To run the Ruff formatter.
      "ruff_format",
      -- To organize the imports.
      "ruff_organize_imports",
    },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    html = { "djlint", "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    htmldjango = { "djlint", stop_after_first = true },
    go = { "gofumpt", "golines", "goimports-reviser" },
    templ = { "templ" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    lsp_fallback = true,
  },
}

return options
