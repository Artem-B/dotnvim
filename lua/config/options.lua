-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.opt.number=true


vim.filetype.add({
  extension = {
    conf = "conf",
    config = "conf",
    md = "markdown",
    ll = "llvm",
    mir = "llvm_mir",
    td = "tablegen",
    lua = "lua",
    sh = "sh",
    zsh = "sh",
    h = function(path, bufnr)
      if vim.fn.search("\\C^#include <[^>.]\\+>$", "nw") ~= 0 then
        return "cpp"
      end
      return "c"
    end,
  },

  pattern = {
    ["^\\.(?:zsh(?:rc|env)?)$"] = "sh",
  },

  filename = {
    ["TODO"] = "markdown",
    [".git/config"] = "gitconfig",
    -- ["~/.dotfiles/zsh/.zshrc"] = "sh",
    -- ["~/.zshrc"] = "sh",
    -- [ "~/.config/mutt/muttrc"] = "muttrc",
    ["README$"] = function(path, bufnr)
      if string.find("#", vim.api.nvim_buf_get_lines(bufnr, 0, 1, true)) then
        return "markdown"
      end
      -- no return means the filetype won't be set and to try the next method
    end,
  },
})
