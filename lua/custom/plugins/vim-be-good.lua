return {
  'ThePrimeagen/vim-be-good',
  {
    'echasnovski/mini.starter',
    version = '*',
    config = function()
      require('mini.starter').setup {
        header = 'Hello Kartik!',
        footer = '',
      }
    end,
  },
}
