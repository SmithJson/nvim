
function! utils#source_file(root_path,path, ...)
	" Source user configuration files with set/global sensitivity
	let use_global = get(a:000, 0, ! has('vim_starting'))
	let abspath = resolve(a:root_path . '/' . a:path)
	if ! use_global
		execute 'source' fnameescape(abspath)
		return
	endif

	let tempfile = tempname()
	let content = map(readfile(abspath),
		\ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
	try
		call writefile(content, tempfile)
		execute printf('source %s', fnameescape(tempfile))
	finally
		if filereadable(tempfile)
			call delete(tempfile)
		endif
	endtry
endfunction

function! utils#tap(name)
  if !has_key(g:plugs, a:name)
        \ || !isdirectory(g:plugs[a:name].dir) | return 0 | endif
     " let g:plug#name = a:name
     " let g:plug#plugin = g:plugs[a:name]
    return 1
  endif
endfunction

