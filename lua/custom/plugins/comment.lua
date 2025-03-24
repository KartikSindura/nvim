return
-- "gc" to comment visual regions/lines
{
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  config = function()
    -- vim.keymap.set('v', '<leader>/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = 'Toggle comment for selection' })

    -- vim.keymap.set('n', '<leader>/', function()
    --   require('Comment.api').toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
    -- end, { desc = 'Toggle comment line' })

    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
