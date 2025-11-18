return {
  -- 1. Tokyo Night
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- 2. Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      transparent_mode = true,
      contrast = "hard",
    },
  },

  -- 3. Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      flavour = "mocha",
    },
  },

  -- 4. Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "main",
      disable_background = true,
    },
  },

  -- 5. Dracula
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    opts = {
      transparent_bg = true,
    },
  },

  -- 6. LazyVim: Start with tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- 7. Force Transparency on EVERY Colorscheme Change
  {
    "folke/lazy.nvim",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- Clear backgrounds for floats, sidebars, etc.
          local hl_groups = {
            "NormalFloat",
            "FloatBorder",
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "NeoTreeFloatBorder",
            "TelescopeNormal",
            "TelescopeBorder",
            -- Add more if needed, like "WhichKeyFloat"
          }
          for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE" })
          end

          -- Global transparency tweaks
          vim.opt.winblend = 0
          vim.opt.pumblend = 0
        end,
      })
    end,
  },

  -- 8. CYCLE KEY: <leader>tc
  {
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>tc",
        function()
          local schemes = {
            "tokyonight",
            "gruvbox",
            "peachpuff",
            "catppuccin-mocha",
            "rose-pine",
            "dracula",
          }

          local current = vim.api.nvim_eval("g:colors_name")
          if not current then
            current = "tokyonight"
          end

          local next_scheme = schemes[1]
          for i, scheme in ipairs(schemes) do
            if scheme == current then
              next_scheme = schemes[i % #schemes + 1]
              break
            end
          end

          if next_scheme == "peachpuff" then
            vim.cmd("colorscheme peachpuff")
            vim.o.background = "light"
          else
            vim.cmd("colorscheme " .. next_scheme)
            vim.o.background = "dark"
          end

          -- Force update + trigger autocmd
          vim.schedule(function()
            vim.cmd("doautocmd ColorScheme")
          end)

          print("Colorscheme: " .. next_scheme)
        end,
        desc = "Cycle: tokyonight ↔ gruvbox ↔ peachpuff ↔ catppuccin ↔ rose-pine ↔ dracula",
      },
    },
  },
}
