return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        "html-lsp",
        "emmet-ls",
        "tailwindcss-language-server",
        "intelephense",
        "pint",
        "css-lsp",
      })
    end,
  },
}
