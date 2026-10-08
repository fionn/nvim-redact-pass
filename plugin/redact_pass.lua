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
        require("redact_pass").redact_pass()
    end
})
