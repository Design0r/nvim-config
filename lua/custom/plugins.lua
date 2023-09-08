local plugins = {
  

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "javascript", "html", "css", "javascriptreact", "json", "typescript", "typescriptreact", "svelte"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "ruff",
        "pyright",
        "prettier",
        "typescript-language-server",
        "svelte-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}
return plugins
