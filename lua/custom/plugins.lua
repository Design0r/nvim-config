local plugins = {
  

  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy=false,
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
        "tailwindcss-language-server",
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
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {"roobert/tailwindcss-colorizer-cmp.nvim", config=true},
    },
    opts = function (_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function (entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
return plugins
