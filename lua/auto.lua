vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
  pattern = { '*.*' },
  callback = function()
    if vim.bo.filetype ~= 'man' then vim.cmd('silent! loadview') end
  end
})

local autoCmdPattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.rs", "*.json", "*.yaml", "*.css", "*.scss", "*.html",
  "*.py", "*.java", "*.xml", "*.sh", ".txt", ".zsh*", "*.lua", "*.bash*", "*.conf" }

-- before save, run formatter
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = autoCmdPattern,
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end
})
-- vim.lsp.buf.format({
--   async = true,
--   format_on_save = true
-- })

-- when leaving buffer, save view (folds, etc)
vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "BufLeave", "BufHidden", "QuitPre" }, {
  pattern = autoCmdPattern,
  callback = function()
    if vim.bo.filetype ~= 'man' then vim.cmd('mkview') end
  end
})

vim.api.nvim_create_user_command(
  'TreeConfig',
  "execute '!tree -I \"plugged\" ~/.config/nvim'",
  {}
)

-- following var isn't working, seems it has value of "none" when it should be default
local initialWinborder = vim.o.winborder
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.o.winborder = "none"
  end
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.o.winborder = initialWinborder
  end
})
