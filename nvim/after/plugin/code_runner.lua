require('code_runner').setup({
    filetype = {
        lua = "lua",
        java = {
            "cd $dir &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt"
        },
        python = "python3 -u",
        typescript = "deno run",
        rust = {
            "cd $dir &&",
            "rustc $fileName &&",
            "$dir/$fileNameWithoutExt"
        },
        cpp = function(...)
            cpp_base = {
                "cd $dir &&",
                "g++ *.cpp -o", -- "g++ $fileName -o"
                "/tmp/$fileNameWithoutExt",
                -- compiler flags
                "-ggdb -pedantic-errors -Werror -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -std=c++23",
            }
            local cpp_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            require("code_runner.commands").run_from_fn(vim.list_extend(cpp_base, cpp_exec))
        end,

        c = function(...)
            c_base = {
                "cd $dir &&",
                "gcc $fileName -o",
                "/tmp/$fileNameWithoutExt",
            }
            local c_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
                c_base[4] = input
                vim.print(vim.tbl_extend("force", c_base, c_exec))
                require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
            end)
        end,
    },
})

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
