-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Moving while in insert mode
vim.keymap.set('i', '<C-j>', '<DOWN>')
vim.keymap.set('i', '<C-k>', '<UP>')
vim.keymap.set('i', '<C-h>', '<LEFT>')
vim.keymap.set('i', '<C-l>', '<RIGHT>')

-- mini starter
vim.keymap.set('n', '<leader>ms', ':lua require("mini.starter").open()<CR>', { desc = 'Open [M]ini.[S]tarter' })

-- Table of print statement formats by language
local print_formats = {
  javascript = 'console.log("%s: ", %s);',
  typescript = 'console.log("%s: ", %s);',
  python = 'print("%s: ", %s)',
  lua = 'print("%s: ", %s)',
  go = 'fmt.Println("%s: ", %s)',
  cpp = 'cout << "%s: " << %s << endl;',
  java = 'System.out.println("%s: " + %s);',
  rust = 'println!("%s: {:?}", %s);',
}

-- Helper function to generate print statement
local function generate_print_statement(var_name, var_label)
  local filetype = vim.bo.filetype
  local format = print_formats[filetype]

  if not format then
    print('Unsupported language: ' .. filetype)
    return nil
  end

  return string.format(format, var_label, var_name)
end

-- Debug print function for yanked text (visual mode)
_G.DebugPrintFromYank = function()
  local var_name = vim.fn.getreg '"' -- Get content from the default register

  if var_name == '' then
    print 'No variable selected.'
    return
  end

  -- For multiline selections, use only the first line for the print label
  local var_label = var_name:gsub('\n.*', '')
  -- Limit the label length if it's too long
  if #var_label > 30 then
    var_label = var_label:sub(1, 27) .. '...'
  end

  local print_stmt = generate_print_statement(var_name, var_label)
  if print_stmt then
    -- Insert print statement below the current line
    vim.api.nvim_put({ print_stmt }, 'l', true, true)
  end
end

-- Normal mode function
_G.DebugPrint = function()
  -- Mark cursor position
  vim.cmd 'normal! mz'

  -- Get word under cursor
  local var_name = vim.fn.expand '<cword>'

  if var_name == '' then
    print 'No variable selected.'
    return
  end

  local print_stmt = generate_print_statement(var_name, var_name)
  if print_stmt then
    -- Insert print statement below the current line
    vim.api.nvim_put({ print_stmt }, 'l', true, true)

    -- Restore cursor position
    vim.cmd 'normal! `z'
  end
end

-- Keymaps
vim.api.nvim_set_keymap('n', '<leader>dp', ':lua _G.DebugPrint()<CR>', { noremap = true, silent = true, desc = '[D]ebug [P]rint (normal mode)' })
vim.api.nvim_set_keymap('v', '<leader>dp', 'y:lua _G.DebugPrintFromYank()<CR>', { noremap = true, silent = true, desc = '[D]ebug [P]rint (visual mode)' })
