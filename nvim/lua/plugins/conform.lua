return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      c_sharp = { "dotnet-csharpier" },
    },
  },
}
