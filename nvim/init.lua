-- 1. Load settings and remaps FIRST
require("user.set")
require("user.remap")

-- 2. Bootstrap Lazy.nvim (Auto-installs it if you don't have it)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Load your plugins from lua/user/plugins.lua
require("lazy").setup("user.plugins")
