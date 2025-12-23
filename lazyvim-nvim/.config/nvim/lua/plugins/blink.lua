return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = opts.sources.default
        or {
          "lsp",
          "path",
          "snippets",
          "buffer",
        }

      -- ensure laravel is included in the default source list
      if not vim.tbl_contains(opts.sources.default, "laravel") then
        table.insert(opts.sources.default, 1, "laravel")
      end

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.laravel = {
        name = "laravel",
        module = "laravel.blink_source",
      }
    end,
  },
}
