"put must frequently changed items on top

let s:ext_vimfiles_dir = expand('<sfile>:h')
let s:vundle_bundle_dir = expand('~/vim-vundle')

function s:source_if_readable(filename)
	if filereadable(a:filename)
		exec 'source ' . fnameescape(a:filename)
	endif
endfunction

function s:if_bundle_enabled(bundle_dirname)
	for s:p in g:load_bundles
		if s:p == a:bundle_dirname
			return 1
		endif
	endfor
	if isdirectory(s:ext_vimfiles_dir . '/bundle/'. a:bundle_dirname)
		return 1
	else
		return 0
	endif
endfunction

function s:if_vundle_bundle_enabled(bundle_dirname)
	if isdirectory(s:vundle_bundle_dir . '/' .  a:bundle_dirname)
		return 1
	else
		return 0
	endif
endfunction

function s:load_bundle_settings(bundle_dirname)
	if exists('g:vimfiles_username')
		call s:source_if_readable(s:ext_vimfiles_dir . '/settings.' . g:vimfiles_username . '/' . a:bundle_dirname . '.vim')
	else
		call s:source_if_readable(s:ext_vimfiles_dir . '/settings/' . a:bundle_dirname . '.vim')
	endif
endfunction

" local default var values
call s:source_if_readable(s:ext_vimfiles_dir . '/local_settings.default.vim')

" user can use 'local_settings' file to set some vars
" that are truely local to current system.
if exists('g:vimfiles_username')
	call s:source_if_readable(s:ext_vimfiles_dir . '/local_settings.' . g:vimfiles_username . '.vim')
else
	call s:source_if_readable(s:ext_vimfiles_dir . '/local_settings.vim')
endif


if has('win32') && exists('g:win_tools_dir_list') && !exists('g:win_tools_dir')
	for s:tools_dir in g:win_tools_dir_list
		if isdirectory(s:tools_dir)
			let g:win_tools_dir = s:tools_dir
			break
		endif
	endfor
endif

" for clang_complete
if has('win32')
	if !exists('g:my_clang_bin_dir') && exists('g:win_tools_dir')
		let g:my_clang_bin_dir = g:win_tools_dir . '\clang'
	endif
	if !exists('g:my_clang_lib_dir') && exists('g:win_tools_dir')
		let g:my_clang_lib_dir = g:win_tools_dir . '\clang'
	endif
endif

if !exists('g:clang_exec') && exists('g:my_clang_bin_dir')
	let g:clang_exec = g:my_clang_bin_dir . '/clang.exe'
endif
if !exists('g:clang_library_path') && exists('g:my_clang_lib_dir')
	let g:clang_library_path = g:my_clang_lib_dir . '/libclang.dll'
endif

" ====== for taglist == begin ==

" taglist plugin checks that Exuberant ctags command before loading,
" so we must set Tlist_Ctags_Cmd to a working value before loading plugins.
if !exists('Tlist_Ctags_Cmd') || !executable(Tlist_Ctags_Cmd)
	" if user has not set this Tlist_Ctags_Cmd correctly,
	" check if exuberant-ctags/exctags/ctags exists in PATH
	let s:ctags_cmds = [ 'exuberant-ctags', 'exctags', 'ctags' ]
	let s:ctags_found = 0
	for s:ctags in s:ctags_cmds
		if executable(s:ctags)
			let s:ctags_found = 1
			break
		endif
	endfor
	if !s:ctags_found
		if has("win32")
			if exists('g:win_tools_dir')
				" assumes that ctags is installed under 'tools' dir
				let Tlist_Ctags_Cmd = g:win_tools_dir. '\ctags.exe'
			endif
		else
			" for unix
			let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
		endif
	endif
endif

" ====== for taglist == end ==

" execute 'source ' . fnameescape(s:ext_vimfiles_dir) . '/load_plugins.vim'
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin(s:vundle_bundle_dir)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'
Plugin 'fuzzyfinder'
Plugin 'tpope/vim-repeat'
Plugin 'visualrepeat'
Plugin 'tpope/vim-surround'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" Plugin 'KabbAmine/zeavim.vim'
Plugin 'ruiheng/vim-haskell-cabal'
Plugin 'raichoo/haskell-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'spf13/vim-colors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'bitc/vim-hdevtools'
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
Plugin 'kshenoy/vim-signature'
Plugin 'Shougo/neocomplete.vim'
Plugin 'blueyed/vim-diminactive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" some settings may depend on the plugins loaded,
" put those settings in some files in a special dir,
" so that they are sourced at last. (Deprecated )
execute 'set rtp+=' . fnameescape(s:ext_vimfiles_dir) . '/fixed/after'

" .........    here begins our real vim settings ..........

set hidden


" remember more command history
set history=1000

" we always use utf-8 as the internal char encoding of vim.
" but 'tenc' should depends on the system's locale
if &tenc == ''
	let &tenc = &enc	" because 'enc' defaults is set according to env.
endif

set enc=utf-8
"a better test list, can handle most chinese file in china
set fencs=ucs-bom,utf-8,gbk,default,latin1

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
filetype plugin on

if has('gui_running')
	set go-=T
else
	if has('unix')
		set mouse=a
		set ttymouse=xterm2
		set t_Co=256
	endif
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

" don't need help windows to be restored
set sessionoptions-=help

" don't restore empty windows
set sessionoptions-=blank

" always persist Vim's window size
set sessionoptions+=resize

let mapleader = ","

" see
" http://vim.1045645.n5.nabble.com/How-to-store-the-color-scheme-td1172369.html
nmap <F6> :exec ":wa \| mksession! " . v:this_session<CR>
           \ :call writefile(
           \   ['set bg='.&bg, 'color '.colors_name],
           \   fnamemodify(v:this_session, ':p:r') . 'x.vim')<CR> 

imap <F6> <ESC><F6>

vmap <F2> "0p
nmap <F2> viw"0p

" see
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> <F4> '`[' . strpart(getregtype(), 0, 1) . '`]'

" the trailing ';' is magic
set tags=tags;

function MySetLocalTabStop (n)
	exec 'setlocal ts=' . a:n . ' sts=' . a:n . ' sw=' . a:n
endfunction

nmap <leader>t2 :call MySetLocalTabStop(2)<CR>
nmap <leader>t4 :call MySetLocalTabStop(4)<CR>
nmap <leader>t8 :call MySetLocalTabStop(8)<CR>

autocmd FileType haskell setlocal expandtab | call MySetLocalTabStop(4)
autocmd FileType elm setlocal expandtab | call MySetLocalTabStop(2)
autocmd FileType html setlocal noexpandtab si | call MySetLocalTabStop(4)
autocmd BufEnter *.hamlet setlocal expandtab si | call MySetLocalTabStop(4)
autocmd BufFilePost *.hamlet setlocal expandtab si | call MySetLocalTabStop(4)

autocmd BufReadPre *.hs setlocal fencs=utf-8

" to make active window more obvious
" augroup BgHighlight
"     autocmd!
"     autocmd WinEnter * set cul
"     autocmd WinEnter * set number
"     autocmd WinEnter * set relativenumber
"     autocmd WinLeave * set nocul
"     autocmd WinLeave * set nonumber
"     autocmd WinLeave * set norelativenumber
" augroup End

cabbrev lvim
      \ lvim /\<lt><C-R><C-W>\>/gj
      \ **/*<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

if filereadable(expand('*.cabal'))
	set wig+=*.o,*.hi,*.dyn_hi,*.dyn_o,*/dist/*
endif

" .................... all 'standard' settings ends here .....................

" ......... some default but plugin-depending settings begins .......

if s:if_vundle_bundle_enabled('ctrlp.vim')
	let g:ctrlp_open_new_file = 'r'
	" nmap <leader>p :CtrlP<cr>
	let g:ctrlp_map = '<leader>p'
	" Easy bindings for its various modes
	nmap <leader>bb :CtrlPBuffer<cr>
	nmap <leader>bm :CtrlPMixed<cr>
	nmap <leader>bs :CtrlPMRU<cr>
endif

if s:if_vundle_bundle_enabled('vim-airline')
" if exists('g:loaded_airline')
	" let g:airline#extensions#tabline#buffer_nr_show = 0
	let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:airline#extensions#tabline#enabled = 1
	nmap <leader>1 <Plug>AirlineSelectTab1
	nmap <leader>2 <Plug>AirlineSelectTab2
	nmap <leader>3 <Plug>AirlineSelectTab3
	nmap <leader>4 <Plug>AirlineSelectTab4
	nmap <leader>5 <Plug>AirlineSelectTab5
	nmap <leader>6 <Plug>AirlineSelectTab6
	nmap <leader>7 <Plug>AirlineSelectTab7
	nmap <leader>8 <Plug>AirlineSelectTab8
	nmap <leader>9 <Plug>AirlineSelectTab9

	nmap <leader>l :bnext<CR>
	nmap <leader>h :bprevious<CR>
endif

if s:if_vundle_bundle_enabled('haskellmode')
	au BufEnter *.hs compiler ghc
	call s:load_bundle_settings('haskellmode')
endif

if s:if_vundle_bundle_enabled('fuzzyfinder')
	nmap <leader>fb :FufBuffer<cr>
	nmap <leader>ff :FufFile<cr>
endif

if s:if_vundle_bundle_enabled('vim-easy-align')
	vmap <Enter> <Plug>(EasyAlign)
	nmap ga <Plug>(EasyAlign)
endif

if s:if_vundle_bundle_enabled('YankRing')
	nnoremap <silent> <F11> :YRShow<CR>
endif

if s:if_vundle_bundle_enabled('haskell-cabal') || s:if_vundle_bundle_enabled('vim-haskell-cabal')
	nmap <F8> <F6>:Cabal build<CR>
	imap <F8> <ESC><F8>
endif

if s:if_vundle_bundle_enabled('fugitive') || s:if_vundle_bundle_enabled('vim-fugitive')
	nmap <leader>gs :Gstatus<CR>
	nmap <leader>gd :Gdiff<CR>
	nmap <leader>gc :Gcommit<CR>
	nmap <leader>gl :Glog<CR>
	nmap <leader>gp :Git push<CR>
endif

if s:if_vundle_bundle_enabled('tagbar')
	let g:tagbar_type_haskell = {
	    \ 'ctagsbin'  : 'hasktags',
	    \ 'ctagsargs' : '-x -c -o-',
	    \ 'kinds'     : [
		\  'm:modules:0:1',
		\  'd:data: 0:1',
		\  'd_gadt: data gadt:0:1',
		\  't:type names:0:1',
		\  'nt:new types:0:1',
		\  'c:classes:0:1',
		\  'cons:constructors:1:1',
		\  'c_gadt:constructor gadt:1:1',
		\  'c_a:constructor accessors:1:1',
		\  'ft:function types:1:1',
		\  'fi:function implementations:0:1',
		\  'o:others:0:1'
	    \ ],
	    \ 'sro'        : '.',
	    \ 'kind2scope' : {
		\ 'm' : 'module',
		\ 'c' : 'class',
		\ 'd' : 'data',
		\ 't' : 'type'
	    \ },
	    \ 'scope2kind' : {
		\ 'module' : 'm',
		\ 'class'  : 'c',
		\ 'data'   : 'd',
		\ 'type'   : 't'
	    \ }
	\ }
	nmap <leader>tb :TagbarToggle<CR>
endif

if s:if_vundle_bundle_enabled('syntastic')
	let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [],
		\ "passive_filetypes": []
		\ }
endif

" ......... some 'standard' but plugin-dependent settings ends .......

" user can use ~/local.vimrc to adjust some settings finally.
" for example, override some settings above.
call s:source_if_readable(s:ext_vimfiles_dir . '/final_settings.vim')
