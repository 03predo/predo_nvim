imap jj <Esc>

set tabstop=4
set shiftwidth=4
set expandtab

lua require("plugins")

lua local actions = require("diffview.actions")

lua require("diffview").setup({})


nmap <C-t> :Telescope <Enter>
nmap <C-p> :Telescope find_files <Enter>
nmap <C-F> :Telescope live_grep <Enter>
