return
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "muniftanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- optional image support in preview window: see `# preview mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<C-n>', '<Cmd>Neotree toggle<CR>', {})
  end
}
