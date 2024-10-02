return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup {
      testcases_use_single_file = true,
      compile_command = {
        cpp = { exec = 'g++', args = { '-Wall', '$(FNAME)', '--std=c++20' } },
      },
      run_command = {
        cpp = { exec = './a.out' },
      },
      testcases_directory = '../testcases',
    }

    --  Competitest keymaps
    vim.keymap.set('n', '<C-v>', '<cmd>CompetiTest receive testcases<CR>', { desc = 'Receive Testcases' })
    vim.keymap.set('n', '<leader>cr', '<cmd>CompetiTest run<CR>', { desc = '[C]omptitest [R]un' })
    vim.keymap.set('n', '<leader>su', '<cmd>CompetiTest show_ui<CR>', { desc = '[S]how [U]I' })
    vim.keymap.set('n', '<leader>at', '<cmd>CompetiTest add_testcase<CR>', { desc = '[A]dd [T]estcase' })
    vim.keymap.set('n', '<leader>dt', '<cmd>CompetiTest delete_testcase<CR>', { desc = '[D]elete [T]estcase' })
  end,
}
