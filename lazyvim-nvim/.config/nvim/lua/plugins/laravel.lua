return {
  {
    "adibhanna/laravel.nvim",
    ft = { "php", "blade" },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>la", "<cmd>Artisan<cr>", desc = "Laravel Artisan" },
      { "<leader>lc", "<cmd>Composer<cr>", desc = "Composer" },
      { "<leader>lr", "<cmd>LaravelRoute<cr>", desc = "Laravel Routes" },
      { "<leader>lm", "<cmd>LaravelMake<cr>", desc = "Laravel Make" },
      { "<leader>lg", "<cmd>LaravelGoto<cr>", desc = "Laravel: Goto" },
      {
        "gd",
        function()
          local fallback = false
          local orig_notify = vim.notify

          -- suppress only the "pattern not detected" warning and use it as a
          -- signal to fall back
          vim.notify = function(msg, level, opts)
            local s = tostring(msg)
            if s:find("No Laravel navigation pattern detected", 1, true) then
              fallback = true
              return
            end
            return orig_notify(msg, level, opts)
          end

          local ok = pcall(vim.cmd, "LaravelGoto")
          vim.notify = orig_notify

          if not ok or fallback then
            -- fallback to normal goto definition
            vim.lsp.buf.definition()
          end
        end,
        desc = "Goto definition (Laravel when possible, else LSP)",
      },
    },
    config = function()
      require("laravel").setup()
    end,
  },
}
