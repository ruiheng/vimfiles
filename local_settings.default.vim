" We need to define some global variables the is truely local to the system,
" and those variables will be used in other vim source file,
" so must be defined early.
" most of these variables are paths.
" This file contains the default values of these variables and
" commented with their purpose (served as docs).


"
" on windows, put all those 'tools' program under one dir
"
" g:win_tools_dir_list is just a list of possible values for all your computers,
" if this variable defined, here vim will choose the first one that exists.
" you can override with your own in ~/vimfiles/local_settings.vim,
" or predefine it in your .vimrc/_vimrc before rc_entry.vim
" example:
"
"	let g:win_tools_dir_list = [
"		\'D:\tools',
"		\'S:\ruiheng\tools',
"		\]

