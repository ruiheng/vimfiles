" many plug-ins needs to know where python interpreter is
if has('win32')
	let g:python_exe = 'd:\python27.32\python.exe'
endif

if !exists('g:win_tools_dir_list')
	let g:win_tools_dir_list = [
		\'D:\tools',
		\'S:\ruiheng\tools',
		\]
endif

"colo molokai
colo darkblue

" for 'session' plugin
let g:session_autosave = 'yes'
if has('win32')
	let g:session_directory = 's:\ruiheng\vimfiles\sessions'
endif

" for vimwiki plugin
let s:wiki_1 = {}
if has('win32')
	let s:wiki_1.path = 'z:/git/vimwiki/default'
else
	let s:wiki_1.path = '~/vimwiki/default'
endif

let g:vimwiki_list = [s:wiki_1]

