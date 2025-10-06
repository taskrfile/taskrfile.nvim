local M = {}

local augroup = vim.api.nvim_create_augroup("taskrfile", {})

-- add plugin dir to runtimepath
local plugin_dir = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
vim.opt.rtp:append(plugin_dir .. "../../")

-- set filetype to taskrfile when filename matches "taskrfile"
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*",
    group = augroup,
    callback = function(args)
        local fname = vim.fn.fnamemodify(args.file, ":t") -- get filename only
        if fname:lower() == "taskrfile" then
            vim.bo.filetype = "taskrfile"
        end
    end,
})

-- attach lsp
vim.api.nvim_create_autocmd("FileType", {
    pattern = "taskrfile",
    callback = function(args)
        local bufnr = args.buf
        vim.lsp.start({
            name = "taskr_ls",
            cmd = { "taskr_ls" },
            root_dir = vim.fn.getcwd(),
            bufnr = bufnr,
        })
    end,
})

return M
