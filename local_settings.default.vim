" on windows, I put all those 'tools' program under one dir
" this is a list of possible values on all my computers.

let s:tools_dir_list = [
	\'D:\tools',
	\'S:\ruiheng\tools',
	\]
if has('win32')
	for s:tools_dir in s:tools_dir_list
		if isdirectory(s:tools_dir)
			let g:win_tools_dir = s:tools_dir
			break
		endif
	endfor
endif
