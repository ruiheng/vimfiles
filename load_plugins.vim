execute 'source ' . expand('<sfile>:h') . '/available/pathogen/autoload/pathogen.vim'

if exists('g:load_bundles')
	for s:p in g:load_bundles
		call pathogen#surround(expand('<sfile>:h') . '/available/' . s:p)
	endfor
endif

call pathogen#infect(expand('<sfile>:h') . '/bundle/{}')
