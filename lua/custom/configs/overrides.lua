local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "htmldjango",
    "go",
    "templ",
    "cpp",
    "c",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "prettier",

    -- python
    "pyright",
    "ruff",
    "djlint",

    -- go
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "golines",
    "templ",

    -- c++
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  filters = {
    git_ignored = false,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        hidden = true,
      },
    },
  },
}

M.conform = {
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
  format_on_save = {},
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = {
      -- To fix auto-fixable lint errors.
      "ruff_fix",
      -- To run the Ruff formatter.
      "ruff_format",
      -- To organize the imports.
      "ruff_organize_imports",
    },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
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
}

return M
