" on windows, I put all those 'tools' program under one dir
" this is a list of possible values on all my computers.
let s:tools_dir_1 = 'S:\ruiheng\tools'
let s:tools_dir_2 = 'D:\tools'

let i = 1
while 1:
	let varname = 's:tools_dir_' . i
	if !exits(varname)
		break
	endif
	if filereadable(varname)
		let g:win_tools_dir = varname
	endif
