return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      c_sharp = { "csharpier" },
    },
    format_on_save = { timeout_ms = 250 },
  },
}
