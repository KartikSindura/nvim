return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'marko-cerovac/material.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    require('material').setup {
      disable = {
        background = true,
      },
      custom_colors = function(colors)
        -- Modify the colors table to set your custom colors
        -- Add more customizations as needed
        colors.syntax.comments = '#5c637b'
        colors.editor.line_numbers = '#5c637b'
        colors.editor.selection = '#373d5b'
      end,
    }

    vim.g.material_style = 'deep ocean'
    vim.cmd.colorscheme 'material'
    --Lua:

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=italic'
  end,
}
