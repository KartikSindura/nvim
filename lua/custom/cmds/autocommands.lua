-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- if vim.fn.exists '$TMUX' then
--   vim.api.nvim_create_autocmd({ 'BufReadPost', 'FileReadPost', 'BufNewFile' }, {
--     callback = function()
--       local current_file = vim.fn.expand '%:t'
--       vim.fn.system(string.format('tmux rename-window "%s"', current_file))
--     end,
--   })
--
--   vim.api.nvim_create_autocmd({ 'VimLeave' }, {
--     callback = function()
--       vim.fn.system(string.format 'tmux rename-window fish')
--     end,
--   })
-- end
