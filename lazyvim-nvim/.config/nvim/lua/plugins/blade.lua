-- Blade (Laravel) support for LazyVim
return {
  -- Make sure treesitter is present (LazyVim already uses it, but this is safe)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Filetype detection for *.blade.php
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })

      -- Tell treesitter that the "blade" filetype uses the "blade" parser
      -- (you still must provide the parser + queries manually)
      pcall(vim.treesitter.language.register, "blade", "blade")

      return opts
    end,
  },

  -- Extend LSP server filetypes so they attach in blade buffers
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = opts.servers or {}

      -- Intelephense: include blade
      servers.intelephense = servers.intelephense or {}
      servers.intelephense.filetypes = { "php", "blade" }

      -- HTML: include blade
      servers.html = servers.html or {}
      servers.html.filetypes = { "html", "blade" }

      -- Emmet: include blade
      servers.emmet_ls = servers.emmet_ls or {}
      servers.emmet_ls.filetypes = {
        "html",
        "blade",
        "css",
        "vue",
        "javascriptreact",
        "typescriptreact",
      }

      -- Tailwind: include blade + includeLanguages mapping
      servers.tailwindcss = servers.tailwindcss or {}
      servers.tailwindcss.filetypes = {
        "html",
        "blade",
        "vue",
        "css",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      }
      servers.tailwindcss.settings = vim.tbl_deep_extend("force", servers.tailwindcss.settings or {}, {
        tailwindCSS = {
          includeLanguages = { blade = "html" },
          experimental = {
            classRegex = {
              "@apply\\s+([^;]*)",
            },
          },
        },
      })

      opts.servers = servers
      return opts
    end,
  },
}
