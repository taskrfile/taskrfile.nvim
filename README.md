# taskrfile.nvim
Neovim plugin that handles filetype, lsp attachments and Treesitter highlighting.

For highlighting to work, make sure to install the tree-sitter parser. This can be done like this:
```lua
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.taskr = {
    install_info = {
        url = "https://github.com/taskrfile/tree-sitter-taskr",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "taskrfile",
}

local ensureInstalled = {
    "taskr",
}
```
