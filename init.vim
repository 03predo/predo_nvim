imap jj <Esc>
tnoremap jj <C-\><C-n>

set tabstop=2
set shiftwidth=2
set expandtab

lua require("config.lazy")

nmap <C-t> :Telescope <Enter>
nmap <C-p> :Telescope find_files <Enter>
nmap <C-F> :Telescope live_grep <Enter>

command D call Dash()

function Dash()
  term bash
  vert sp .
  vertical resize 35
endfunction
