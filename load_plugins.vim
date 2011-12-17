execute 'source ' . expand('<sfile>:h') . '/bundle/pathogen/autoload/pathogen.vim'

call pathogen#infect(expand('<sfile>:h') . '/bundle')

nmap <leader>fb :FufBuffer<cr>
nmap <leader>ff :FufFile<cr>
