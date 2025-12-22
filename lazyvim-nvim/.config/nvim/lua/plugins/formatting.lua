-- PHP/Blade formatting with Laravel Pint
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "pint" },
        blade = { "pint" },
      },
    },
  },
}
