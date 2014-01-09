" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch  " high light search
set mouse=a

" ¼ì²éÎÄ¼þÀàÐÍ½Å±¾
filetype plugin indent on

" ¿ªÆôÓï·¨¸ßÁÁ
syntax on

" ÏÔÊ¾ÐÐºÅ
set nu
 
" >>ºÍ<<µÄÒÆ¶¯¸ñÊý
set shiftwidth=4

" Ò»¸ö tab ¼üËõ½ø 4 ¸ñ
set tabstop=4

" ËÑË÷Ê±ºöÂÔ´óÐ¡Ð´£¬µ«Èç¹ûËÑË÷´Ê°üº¬´óÐ´Ôò²»ºöÂÔ
set ignorecase smartcase

" ×Ô¶¯Ëõ½ø
" set autoindent
 
" ÖÇÄÜËõ½ø
" set smartindent

" MakefileÐèÒªTab¿ªÍ·µÄÃüÁî,µ«ÊÇPython²å¼þÓÃTab»»ÐÐ-_-!!!
" ²åÈëtabÓÃ¿Õ¸ñ´úÌæ
set softtabstop=4
" ÏÔÊ¾TabÓÃ¿Õ¸ñ´úÌæ
set expandtab

" turn off auto comment
set formatoptions-=cro

" ¹Ø±Õ×Ô¶¯±¸·Ý
set nobackup

" ¿Õ¸ñ¹ö¶¯
map <Space>  4j
map <S-Space> 4k

" Ä¬ÈÏ²»×Ô¶¯¶ÏÐÐ
set nowrap

" ÇÐ»»Tab´°¿ÚÁÐ±í
map <S-h>    gT
map <S-l>    gt

" ÑÕÉ«Ö÷Ìâ
" in terminal
if has('gui_running')
    colorscheme darkblue
else
    set t_Co=256
    colorscheme torte
endif

" ÕÛµþ
set fdm=syntax
set foldnestmax=7
set foldlevel=8

" mapleader
let mapleader=','

" ×Ô¶¯ÇÐ»»µ±Ç°Ä¿Â¼
" set autochdir

" ×Ô¶¯±£´æÎÄ¼þ(ÔÚÇÐ»»´°¿ÚÊ±)!!!!:)
set autowrite

" ÇÐ»»´°¿Ú
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" È¥µô²Ëµ¥À¸¡¢¹¤¾ßÀ¸¡¢¹ö¶¯Ìõ
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has('gui_running') && has('unix')
    set guifont=Monospace\ Regular\ 11
endif

" txtÄ¬ÈÏ¶ÏÐÐ
autocmd BufRead,BufNewFile *.txt,*.md  set wrap

" ×î´ó»¯´°¿Ú
" au GUIEnter * simalt ~x
" È«ÆÁÄ£Ê½
if has('gui_running') && has('win32')
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" ÉèÖÃBCB±àÒëÆ÷£¬ÐÞ¸Ä¹ýµÄbcc.vim
" compiler bcc

" make¿ì½Ý¼ü: ,<space>
" autocmd FileType c,cpp,h nmap <buffer> <leader><space> :make<cr><cr>:copen<cr>
nmap <leader><space> :make<cr><cr>:copen<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" tagbar
nmap <silent> <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 20
let g:tagbar_left = 1
let g:tagbar_set = 0

" winmanage
let g:winManagerWindowLayout = 'FileExplorer|TagList' 
nmap wm :WMToggle<CR> 

" compiler and debug python with compiler\python.vim
autocmd! BufRead,BufNewFile *.py compiler pyunit
nmap <leader>e :!python "%"<cr>

" lua
nmap <leader>l :!lua "%"<cr>

" ÇÐ»»Í·ÎÄ¼þ: ,a  »á×Ô¶¯±£´æµ±Ç°ÎÄ¼þ(ÒÔÇ°ÒªÇÃ:w, ÏÖÔÚÉèÖÃÁËautowrite)
autocmd FileType cpp,c,h  map <leader>a :A<cr>

" markdown to HTML on Linux 
nmap <leader>md :w<cr>:silent !markdown_py "%" -f "%.html"<cr>:silent !firefox "%.html"<cr>:redraw!<cr>

" tagbar
nmap <F8> :TagbarToggle<CR> 

" miniBufExpl
" let g:miniBufExplSplitToEdge = 0 let g:miniBufExplMapCTabSwitchBufs = 1
hi MBENormal  guifg=#FFFFFF guibg=#000040
hi MBEChanged  guifg=#FFFFFF guibg=#000040 
hi MBEVisibleNormal  guifg=#FFFF00 guibg=#000040
hi MBEVisibleChanged guifg=#FFFF00 guibg=#000040

" NERDTree
nmap <silent> <F9> :NERDTreeToggle<cr>
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=15

" indent-guides
let g:indent_guides_guide_size=1

" javacomplete
setlocal omnifunc=javacomplete#Complete 
setlocal completefunc=javacomplete#CompleteParamsInfo 
au FileType java imap <tab><tab> <C-x><C-o>

" background transparent
nmap <leader>tr :hi Normal ctermbg=None<cr>
nmap <leader>ntr :hi Normal ctermbg=0<cr>
