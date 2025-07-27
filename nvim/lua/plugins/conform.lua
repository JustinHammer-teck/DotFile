return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  optional = true,
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "nixfmt" },
      c_sharp = { "csharpier" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    },
    log_level = vim.log.levels.DEBUG,
  },
}
