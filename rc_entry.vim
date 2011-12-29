"put must frequently changed items on top
set hidden

let s:ext_vimfiles_dir = expand('<sfile>:h')
execute 'source ' . s:ext_vimfiles_dir . '/load_plugins.vim'

" for clang_complete
if exists('g:my_clang_bin_dir')
	let g:clang_exec = g:my_clang_bin_dir . '/clang.exe'
endif
if exists('g:my_clang_lib_dir')
	let g:clang_library_path = g:my_clang_lib_dir . '/libclang.dll'
endif


"colo molokai
colo darkblue

" depends on terminal settings
"set tenc=gbk

" remember more command history
set history=1000

set enc=utf-8
set fileencodings=gbk,utf-8

try
  lang en_US
catch
endtry

"set so=7
set wildmenu
set ruler
set hls

set nocompatible

syn on
set hls
set ruler
filetype plugin on

if has('gui_running')
  set go-=T
else
  set mouse=a
  set ttymouse=xterm2
endif

" from
" http://stackoverflow.com/questions/5547943/display-number-of-current-buffer?1322283757
" Status Line {  
        set laststatus=2                             " always show statusbar  
        set statusline=  
        set statusline+=%-10.3n\                     " buffer number  
        set statusline+=%f\                          " filename   
        set statusline+=%h%m%r%w                     " status flags  
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
        set statusline+=%=                           " right align remainder  
        set statusline+=0x%-8B                       " character value  
        set statusline+=%-14(%l,%c%V%)               " line, character  
        set statusline+=%<%P                         " file position  
"}  


" ====== for taglist == begin ==
if has("win32")
  let Tlist_Ctags_Cmd = 'd:\tools\ctags.exe'
else
  let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif

" the trailing ';' is magic
set tags=tags;
" ====== for taglist == end ==

source ~/local.vimrc

