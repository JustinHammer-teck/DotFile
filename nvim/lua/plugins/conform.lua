return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
      c_sharp = { "csharpier" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
    },
    formatters = {
      prettierd = {
        append_args = { "--single-quote", "--bracket-same-line" },
      },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_format = "fallback",
    },
    log_level = vim.log.levels.DEBUG,
  },
}
