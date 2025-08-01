return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for icons
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
        "                                  by Berkay C.       "
      }


      -- Buttons Section
      dashboard.section.buttons.val = {
        dashboard.button("<leader> ff", " Find file", "<cmd>Telescope find_files <CR>"),
        dashboard.button("<leader> fw", " Find text", "<cmd>Telescope live_grep <CR>"),
        dashboard.button("<leader> fo", " Recent files", "<cmd>Telescope oldfiles <CR>"),
        dashboard.button(
          "<leader> ql",
          " Load Last Session",
          "<cmd>lua require('persistence').load({ last = true }) <CR>"
        ),
        dashboard.button("n", " New file", "<cmd>ene <BAR> startinsert <CR>"),

        -- Config nvim (cd to nvim C:\Users\Donato\AppData\Local\nvim) and open init.lua)
        dashboard.button(
          "c",
          " Config",
          "<cmd>edit $MYVIMRC <CR> <cmd>cd " .. vim.fn.stdpath "config" .. " <CR>"
        ),
        dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/config/mappings.lua<CR>"),
        dashboard.button("p", "  Plugins", ":Lazy<CR>"),

        dashboard.button("q", " Quit", "<cmd>q <CR>"),
      }
      dashboard.section.buttons.opts.hl = "AlphaButtons"

      -- Layout
      dashboard.opts.layout = {
        { type = "padding", val = 4 }, -- Upper margin
        dashboard.section.header,
        { type = "padding", val = 2 }, -- Space between logo and buttons
        dashboard.section.buttons,
        { type = "padding", val = 1 }, -- Space between buttons and recent files
        dashboard.section.footer,
      }

      -- Lazy Loading
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      alpha.setup(dashboard.opts)


      -- Draw Footer After Startup
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

          -- Footer
          dashboard.section.footer.val = "⚡ Neovim loaded "
              .. stats.loaded
              .. "/"
              .. stats.count
              .. " plugins in "
              .. ms
              .. "ms"
          pcall(vim.cmd.AlphaRedraw)
          dashboard.section.footer.opts.hl = "AlphaFooter"
        end,
      })
    end,
  },
}
