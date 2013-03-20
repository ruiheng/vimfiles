if !exists('g:ghc')
	if has('win32')
		let g:ghc="d:/devel/ghc-7.6.2-mingw32/bin/ghc.exe"
		let g:haddock_docdir="d:/devel/haskell/doc"
		let g:haddock_browser="cmd"
		let g:haddock_browser_callformat = '%s /C start "%s"'
	else
	endif
endif
