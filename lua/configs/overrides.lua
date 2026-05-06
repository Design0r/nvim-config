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


return M
