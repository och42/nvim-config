vim.g.netrw_liststyle = 3

-- stylua: ignore
vim.api.nvim_exec2([[

let g:netrw_list_hide = netrw_gitignore#Hide() .. ',.git/'

]], { output = false })
