--[[
Clone the package manager (Lazy) if it isn't already installed and set the 
location for plugin definitions to be: `.config/nvim/lua/mcaballero/lazy`
]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
 
require("lazy").setup({
    spec = "mcaballero.lazy",
    change_detection = { notify = false }
})
