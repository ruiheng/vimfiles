" this file contains some settings that are conditional according what
" plugins have been loaded.


" =========== Conque ======== begin

if exists('g:ConqueTerm_Loaded')

	if exists('g:python_exe') && executable(g:python_exe)
		let g:ConqueTerm_PyExe = g:python_exe
	endif

	if has('win32')
		let s:vc10_bat = 'C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat'
		exec "nmap <Leader>vc10 :ConqueTermTab " . $comspec . " /k \"". fnamemodify(s:vc10_bat, ':8') . "\"<CR>"
	endif
else
	echo 'conqueterm not installed'
endif

" =========== Conque ======== end


" ====== for vimwiki == begin ==

if exists("loaded_vimwiki") || &cp
	" because ctrl-space will toggle IME
	map <leader>tt <Plug>VimwikiToggleListItem
endif

" ====== for vimwiki == end ==


" ========= for capslock == begin ==

if (exists("g:loaded_capslock") && g:loaded_capslock) || &cp
	set statusline+=%{exists('*CapsLockSTATUSLINE')?CapsLockSTATUSLINE():''}
endif

" ========= for capslock == end ==
