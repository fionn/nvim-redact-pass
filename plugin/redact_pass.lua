if vim.g.loaded_redact_pass then
    return
end

vim.g.loaded_redact_pass = true

vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("redact_pass", {clear = true}),
    desc = "Prevent leaks when editing passwords",
    pattern = {
        "/dev/shm/pass.?*/?*.txt",
        "$TMPDIR/pass.?*/?*.txt",
        "/tmp/pass.?*/?*.txt",
        "/private/var/?*/pass.?*/?*.txt"
    },
    callback = function()
        -- These are global options so we intentionally set them globally.
        vim.opt.backup = false
        vim.opt.writebackup = false
        vim.opt.swapfile = false
        vim.opt.shada = ""
        vim.opt.undofile = false
        vim.opt.shelltemp = false
        vim.opt.history = 0
        vim.opt.modeline = false
        vim.print("pass: leaky options disabled")
    end
})
