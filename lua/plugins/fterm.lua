return {
  {
    "numToStr/FTerm.nvim",
    config = function()
      require("FTerm").setup({
        border     = 'double',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
      local fterm = require("FTerm")
      local gitui = fterm:new({
        ft = 'fterm_gitui',
        cmd = "gitui",
        dimensions = {
          height = 0.9,
          width = 0.9
        }
      })
      vim.keymap.set('n', '<A-g>', function()
        gitui:toggle()
      end)

      vim.keymap.set('t', '<A-g>', function()
        gitui:toggle()
      end)
    end
  }
}
