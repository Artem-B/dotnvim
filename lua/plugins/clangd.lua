return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        clangd = {
          root_dir = function(fname)
            local lu = require("lspconfig.util")
            if string.match(fname, "/google/src") then
              return nil
            end
            return lu.root_pattern("compile_commands.json", "compile_flags.txt")(fname)
              or lu.find_git_ancestor(fname)
              or lu.root_pattern(
                "Makefile",
                "configure.ac",
                "configure.in",
                "config.h.in",
                "meson.build",
                "meson_options.txt",
                "build.ninja"
              )(fname)
          end,
          on_attach = function(client, bufnr)
            print("on_attach")
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()
          end,
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
            { "<leader>cH", "<cmd>ClangdTypeHierarchy<cr>", desc = "Type hierarchy" },
            { "<leader>cA", "<cmd>ClangdAST<cr>", mode = "x", desc = "Show AST" },
            { "<leader>ct", "<cmd>ClangdSymbolInfo<cr>", desc = "Show symbol info" },
          },
        },
      },
    },
  },
}
