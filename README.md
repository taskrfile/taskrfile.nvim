# taskrfile.nvim
Neovim plugin that handles filetype, lsp ([taskr_ls](https://github.com/taskrfile/taskr-ls)) and Treesitter highlighting.

## Installation
With [folke/lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
    'taskrfile/taskrfile.nvim',
    config = function ()
        require('taskr').setup()
    end
}
```

## Treesitter
To enable treesitter support for `taskr`, you can add the following Lua snippet to your [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) configuration.
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

local config = require("nvim-treesitter.configs")
config.setup({
    auto_install = true,
    ensure_installed = ensureInstalled,
    highlight = { enable = true },
    indent = { enable = true },
})

```
