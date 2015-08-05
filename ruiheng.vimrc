" all we need to do here is just one simple source command:
" source <path_to_vimfiles_project>/rc_entry.vim
"
" all works are done in rc_entry.vim.
"
" but to make this vimrc file work as portable as possible,
" (so that I can copy around, without minimal modifications)
" use a loop to test a list of possible values.

" this is just a list of possible values for all my computers,
" you should change to your favorite.
let s:vimfiles_project_dir_list = [
	\'D:\devel\vimfiles',
	\'D:\MyData\vimfiles',
	\'S:\ruiheng\vim\vimfiles',
	\'~/vimfiles',
	\]

" bundles in this list will be loaded, don't need to create symblic
" link in 'bundle' dir.
let g:load_bundles = [
	\'l9',
	\'fuzzyfinder',
	\'surround',
	\'repeat',
	\'zencoding',
	\'numbertoggle',
	\]

let g:ghcmod_ghc_options = ['-package-db=' . expand('$HS_HOME') . '/lib/package.conf.d']

for s:dir in s:vimfiles_project_dir_list
	if isdirectory(expand(s:dir))
		let s:vimfiles_project_dir = s:dir
		break
	endif
endfor
if exists('s:vimfiles_project_dir')
	let g:vimfiles_username = 'ruiheng'
	execute 'source ' . s:vimfiles_project_dir . '/rc_entry.vim'
endif

let g:zv_zeal_directory = "/usr/local/bin/zeal"
