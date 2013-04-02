if !has('python')
	echo 'Error: require vim build with +python'
	finish
endif

if exists('*VithonInit')
	finish
endif

function VithonInit()
	if filereadable($HOME.'/.vim/python/vim.py')
		pyfile $HOME/.vim/python/vim.py
	endif
endfunction

call VithonInit()
