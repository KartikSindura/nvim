-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Force LSP floating windows to use a border
local border = 'rounded' -- or 'single', 'double', 'shadow', 'none'

-- Hover and Signature Help
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = border,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = border,
})

-- Diagnostics Float
vim.diagnostic.config {
  float = {
    border = border,
  },
}

require('lazy').setup({
  { import = 'custom.plugins' },
  { import = 'kickstart.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
