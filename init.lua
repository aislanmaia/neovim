require "options"
require "plugins"

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

require("lazy").setup("pluginlist")

-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
-- vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
--   desc = "Open neo-tree on enter",
--   group = "neotree_autoopen",
--   once = true,
--   callback = function()
--     if not vim.g.neotree_opened then
--       vim.cmd "Neotree show"
--       vim.g.neotree_opened = true
--     end
--   end,
-- })

vim.cmd [[
  " Abre automaticamente o Neotree ao iniciar o Neovim
  autocmd VimEnter * Neotree show 
]]
