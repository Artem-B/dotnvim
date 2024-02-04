return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      "llvm",
      "llvm_mir",
      "tablegen",
    })
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.tablegen = {
      install_info = {
        url = "https://github.com/Flakebi/tree-sitter-tablegen",
        files = { "src/parser.c" },
      },
      filetype = "tablegen",
    }
    parser_config.llvm_mir = {
      install_info = {
        url = "https://github.com/Flakebi/tree-sitter-llvm-mir",
        files = { "src/parser.c" },
      },
      filetype = "llvm_mir",
    }
  end,
}
