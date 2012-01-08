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

" ====== for taglist == begin ==

if !exists('loaded_taglist')
	if !exists('Tlist_Ctags_Cmd') || !executable(Tlist_Ctags_Cmd)
		" if user has not set this Tlist_Ctags_Cmd
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
