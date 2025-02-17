-- Moving while in insert mode
vim.keymap.set('i', '<C-j>', '<DOWN>')
vim.keymap.set('i', '<C-k>', '<UP>')
vim.keymap.set('i', '<C-h>', '<LEFT>')
vim.keymap.set('i', '<C-l>', '<RIGHT>')

-- mini starter
vim.keymap.set('n', '<leader>ms', ':lua require("mini.starter").open()<CR>', { desc = 'Open [M]ini.[S]tarter' })
