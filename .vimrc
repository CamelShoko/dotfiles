" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" 文件探测编码顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
if has("win32")
    " windows默认保存为cp936
    set fileencoding=cp936
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch  " high light search
set mouse=a

" 检查文件类型脚本
filetype plugin indent on

" 开启语法高亮
syntax on

" 显示行号
set nu
 
" >>和<<的移动格数
set shiftwidth=4

" 一个 tab 键缩进 4 格
set tabstop=4

" 搜索时忽略大小写，但如果搜索词包含大写则不忽略
set ignorecase smartcase

" 自动缩进
set autoindent
 
" 智能缩进
set smartindent

" Makefile需要Tab开头的命令,但是Python插件用Tab换行-_-!!!
" 插入tab用空格代替
set softtabstop=4
" 显示Tab用空格代替
set expandtab

" 关闭自动备份
set nobackup

" 空格滚动
map <Space>  4j
map <S-Space> 4k

" 默认不自动断行
set nowrap

" 切换Buffer列表
map <S-h>    gT
map <S-l>    gt

" 颜色主题
colorscheme darkblue

" 折叠
set fdm=syntax
set foldnestmax=1
set foldlevel=1

" mapleader
let mapleader=','

if has("unix")
    " 自动切换当前目录
    set autochdir
endif

" 自动保存文件(在切换窗口时)!!!!:)
set autowrite

" 切换窗口
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" 去掉菜单栏、工具栏、滚动条
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" txt默认断行
autocmd BufRead,BufNewFile *.txt  set wrap

if has('gui_running') && has("win32")
    " 最大化窗口
    au GUIEnter * simalt ~x
    " 全屏模式
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" make快捷键: ,<space>
autocmd FileType c,cpp,h nmap <buffer> <leader><space> :make<cr><cr>:copen<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

if has("win32")
    " 设置BCB编译器，修改过的bcc.vim
    compiler bcc

    " Grep
    :let Grep_Path = 'D:\SoftWare\Grep\bin\grep.exe'
    :let Grep_Default_Filelist = '*.c *.cpp *.h *.asm *.hpp' 
    " :let Grep_Default_Filelist = '.' 
    " :let Grep_Default_Options = '-r' 
    :let Grep_Skip_Dirs = '.svn'
    :let Grep_Skip_Files = '*.bak *.obj *.exe *.dsk *.dfm *.res *.xml *.bpr'
    nnoremap <silent> <F3> :Grep<CR> 

    " diff
    set diffexpr=MyDiff()
    function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          let cmd = '""' . $VIMRUNTIME . '\diff"'
          let eq = '"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" tagbar
nmap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_left = 1
let g:tagbar_set = 0

" winmanage
let g:winManagerWindowLayout = "NERDTree|TagList"
" 因为NEDTREE 调用时会产生一个空Buffer，所以运行:q关闭
nmap wm :WMToggle<CR>:q<CR>

" compiler and debug python with compiler\python.vim
autocmd! BufRead,BufNewFile *.py compiler pyunit
nmap <leader>e :!python "%"<cr><cr>

" 切换头文件: ,a  会自动保存当前文件(以前要敲:w, 现在设置了autowrite)
autocmd FileType c,cpp,h  map <leader>a :A<cr>


if has("win32")
    " Markdown to HTML on Windows
    nmap <leader>md :w<cr>:silent !start cmd /c "markdown.py %>%.html" && %.html<cr>
else
    " markdown to HTML on Linux 
    nmap <leader>md :w<cr>:silent !markdown_py "%">"%.html"<cr>:silent !firefox "%.html"<cr>
endif

" MiniBufferExpl
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplSplitToEdge = 0
" let g:miniBufExplUseSingleClick = 1
" hi MBEVisibleChanged guifg=#FFFF00 guibg=#000040
" hi MBEVisibleNormal guifg=#FFFF00 guibg=#000040
" hi MBEChanged guifg=#FFFFFF guibg=#000040
" hi MBENormal guifg=#FFFFFF guibg=#000040

" NERD Tree
nmap <silent> <F9> :NERDTreeToggle<cr>
let g:NERDTree_title="[NERD Tree]"
let g:NERDTreeWinSize=20 
let g:NERDTreeWinPos='right'
