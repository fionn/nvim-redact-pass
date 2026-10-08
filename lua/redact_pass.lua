local M = {}

function M.redact_pass()
    -- These are global options so we intentionally set them globally.
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.swapfile = false
    vim.opt.shada = ""
    vim.opt.undofile = false
    vim.opt.shelltemp = false
    vim.opt.history = 0
    vim.opt.modeline = false
    vim.notify("pass: leaky options disabled", vim.log.levels.INFO)
end

return M
