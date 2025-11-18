-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.perl_host_prog = "/usr/bin/perl"
--vim.env.PERL5LIB = vim.fn.expand("~/perl5/lib/perl5") .. ":" .. vim.env.PERL5LIB

if vim.g.neovide then
  vim.g.neovide_opacity = 0.85
  vim.g.transparency = 0.85

  --vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
  --vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.opt.winblend = 0
  vim.opt.pumblend = 0
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    if vim.g.neovide then
      vim.g.neovide_transparency = 0.85
      vim.g.transparency = 0.85
    end
  end,
})
