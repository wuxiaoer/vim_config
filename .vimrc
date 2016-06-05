" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" alternatively, pass a path where Vundle should install plugins "let path = '~/some/path/here'
"call vundle#rc(path) " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'


Plugin 'a.vim'
Plugin 'grep.vim'
Plugin 'taglist.vim'
Plugin 'cscope.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sickill/vim-monokai'

"html
"Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python sytax checker
"Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
""Plugin 'klen/python-mode'
"Plugin 'Valloric/YouCompleteMe'
""""""""""""""""""""""""""""""""""""""""""""""""""
"
" 常用配置
"
""""""""""""""""""""""""""""""""""""""""""""""""""
" General {
	" 启动的时候不显示那个援助乌干达儿童的提示  
    set shortmess=atI


	syntax enable

	"去掉有关vi一致性模式,避免以前版本的bug和局限
	"set nocompatible

	"显示行号
	set number
    set numberwidth=1
	
	"支持256色
	set t_Co=16

	"背景使用颜色
	if has('gui_running') 
		set background=light 
	else 
		set background=dark
	endif

	"设置主题颜色
	"colorscheme murphy
	colorscheme monokai

    "let g:solarized_termcolors=16
	"colorscheme solarized

	"设置字体, 字体名和字号
	"set guifont=Courier\ New\ 12

	"检查文件类型
	filetype on

	"载入文件类型插件
	filetype plugin on

	"为特定文件类型载入相关缩进文件
	filetype indent on

	"搜索时忽略大小写
	set ignorecase

	"记录历史的行数
	set history=1000

	"vim使用自动对齐, 就是把当前行的对齐格式应用到下一行（自动缩进）
	set autoindent

	"针对C语言语法自动缩进
	set cindent

	"依据上面的对齐格式, 智能的选择对齐方式
	set smartindent

	"设置tab键为4各空格
	set tabstop=4

	"统一缩进为4
	set softtabstop=4

	"设置当行之间交错时使用4个空格
	set shiftwidth=4

	"自动转tab为空格
	set expandtab

    "设置80列对齐线
    set cc=80

    "设置对齐线宽度
    let g:indent_guides_guide_size=1

	"设置匹配模式, 类似当输入一个左括号时会匹配相应的右括号
	set showmatch

	"突出显示当前行
	set cursorline

    "高亮当前列
    set cursorcolumn
    "hi CursorLine  cterm=NONE   ctermbg=red ctermfg=white
    "hi CursorColumn cterm=NONE ctermbg=red ctermfg=white

	"在处理未保护或只读文件的时候, 弹出确认
	set confirm

	"隐藏工具栏
	set guioptions-=T

	"隐藏菜单栏
	set guioptions-=m

	"搜索逐字符高亮
	set hlsearch

	"在程序中查询一单词，自动匹配单词的位置；如查询desk单词，当输到/d时，会自动找到第一个d开头的单词，当输入到/de时，会自动找到第一个以ds开头的单词，以此类推，进行查找；当找到要匹配的单词时，别忘记回车 
	set incsearch

	"用浅色高亮当前行
	"autocmd InsertLeave * se nocul
	"autocmd InsertEnter * se cul

	"显示中文帮助
	if version >= 603
		set helplang=cn
		set encoding=utf-8
	endif

	"fileencodings(fencs):编码自动识别
	set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
	"fileencoding(fenc):vim从磁盘上读取文件时,会对文件编码进行探测,
	set fileencoding=utf-8
	"termencoding(tenc):vim用于屏幕显示的编码
	set termencoding=utf-8
	"encoding(enc):vim内部使用的字符编码方式
	set encoding=utf-8

	"设置状态栏总为显示状态
	set laststatus=2

	"设置状态栏显示内容
	set statusline=\|文件路径:%F\|\文件类型:%y\|\总行数:%L\|\百分比:%p%%\|\行:%l\ 列:%c\|

	"设置鼠标
	set mouse=a

    " 系统剪切板
    set clipboard=unnamed

    "设置取消备份 禁止临时文件生成
    set nobackup
    set noswapfile
"}

" 常用快捷键 {
	nmap <C-a> <Esc>ggvG$  
	nmap <C-l> <Esc>v$
	map <C-s> :w<CR>
	map! <C-s> <Esc>:w<CR>a
	nmap 8 :nohl<CR>

	let mapleader="," 
    nmap <leader>v "+gp  
    nmap <leader>c "+y  
" }
"

" Python 自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete

iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"新文件标题

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 
func SetTitle() 

    "如果文件类型为.sh文件 
    if &filetype == 'sh' 

        call setline(1,"\#########################################################################") 

        call append(line("."), "\# File Name: ".expand("%")) 

        call append(line(".")+1, "\# Author: Fantasy") 

        call append(line(".")+2, "\# mail: fantasy@gmail.com") 

        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 

        call append(line(".")+4, "\#########################################################################") 

        call append(line(".")+5, "\#!/bin/bash") 

        call append(line(".")+6, "") 

    else 

        call setline(1, "/*************************************************************************") 

        call append(line("."),   "* 文件: ".expand("%")) 

        call append(line(".")+1, "* 作者: fantasy") 

        call append(line(".")+2, "* 邮箱: fantasy@gmail.com ") 

        call append(line(".")+3, "* 创建时间: ".strftime("%c")) 

        call append(line(".")+4, "*************************************************************************/") 

        call append(line(".")+5, "")

    endif

    if &filetype == 'cpp'

        call append(line(".")+6, "#include <iostream>")

        call append(line(".")+7, "using namespace std;")

        call append(line(".")+8, "")

    endif

    if &filetype == 'c'

        call append(line(".")+6, "#include <stdio.h>")

        call append(line(".")+7, "")

    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G

endfunc 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags的设定  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags {
	"按照名称排序
	"let Tlist_Sort_Type = "name"     

	"压缩方式 
	let Tlist_Compart_Format = 1     

	"如果只有一个buffer，kill窗口也kill掉buffer
	let Tlist_Exist_OnlyWindow = 1    

	"不要显示折叠树 
	let Tlist_Enable_Fold_Column = 0     

	"autocmd FileType java set tags+=D:\tools\java\tags  

	"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  

	"不同时显示多个文件的tag，只显示当前文件的
	let Tlist_Show_One_File=1            

	"设置tags  

	set tags=tags  

	"set autochdir 


	"""""""""""""""""""""""""""""" 

	" Tag list (ctags) 

	"""""""""""""""""""""""""""""""" 
	let Tlist_Ctags_Cmd = '/home/fantasy/opt/ctags/bin/ctags' 

	"默认不打开Taglist,有winmanager来进行打开(winmanager中该功能有问题，此处暂且打开)
	let Tlist_Auto_Open=1		

	"不同时显示多个文件的tag，只显示当前文件的 
	let Tlist_Show_One_File = 1 

	"如果taglist窗口是最后一个窗口，则退出vim
	let Tlist_Exit_OnlyWindow = 1  

	"在右侧窗口中显示taglist窗口
    "let Tlist_Use_Right_Window = 1 

	"设置Taglist宽度
	let Tlist_WinWidth = 32

	"让当前不被编辑的文件的方法列表自动折叠起来
	let Tlist_File_Fold_Auto_Close = 1	

	"显示Taglist菜单
	let Tlist_Show_Menu = 1		

	nmap tg :TlistToggle<CR>
"}
""""""""""""""""""""""""""""""""""
"
" NERDTree
"
""""""""""""""""""""""""""""""""""
" NERDTree {
	nmap nt :NERDTreeToggle<CR>

	"右边显示
	"let NERDTreeWinPos="left"
	let NERDTreeWinPos="right"

	"目录箭头1,显示箭头,0传统+-|号
	let NERDTreeDirArrows=1
"}
""""""""""""""""""""""""""""""""""
"
" cscope
"
""""""""""""""""""""""""""""""""""
" cscope {
	if has("cscope")
		set csprg=/home/fantasy/opt/cscope/bin/cscope	" 指定用来执行cscope的命令
		set csto=0					" 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
		set cst						" 同时搜索cscope数据库和标签文件
		set cscopequickfix=s-,g-,c-,d-,i-,t-,e-		" 使用QuickFix窗口来显示cscope查找结果
		set nocsverb
		if filereadable("cscope.out")			" 若当前目录下存在cscope数据库，添加该数据库到vim
			cs add cscope.out
		elseif $CSCOPE_DB != ""				" 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
			cs add $CSCOPE_DB
		endif
		set csverb
	endif

	nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap cs :cs find s <C-R>=expand("<cword>")<CR><CR>	"查找C语言符号，即查找函数名、宏、枚举值等出现的地方
	nmap cg :cs find g <C-R>=expand("<cword>")<CR><CR>	"查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
	nmap cd :cs find d <C-R>=expand("<cword>")<CR><CR>	"查找本函数调用的函数
	nmap cc :cs find c <C-R>=expand("<cword>")<CR><CR>	"查找调用本函数的函数
	nmap ct :cs find t <C-R>=expand("<cword>")<CR><CR>	"查找指定的字符串
	nmap ce :cs find e <C-R>=expand("<cword>")<CR><CR>	"查找egrep模式，相当于egrep功能，但查找速度快多了
	nmap cf :cs find f <C-R>=expand("<cfile>")<CR><CR>	"查找并打开文件，类似vim的find功能
	nmap ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	"查找包含本文件的文
	
	nmap cs/ :cs find s <C-R>=expand("<cword>")<CR>
	nmap cg/ :cs find g <C-R>=expand("<cword>")<CR>
	nmap cd/ :cs find d <C-R>=expand("<cword>")<CR>	
	nmap cc/ :cs find c <C-R>=expand("<cword>")<CR>
	nmap ct/ :cs find t <C-R>=expand("<cword>")<CR>	
	nmap ce/ :cs find e <C-R>=expand("<cword>")<CR>
	nmap cf/ :cs find f <C-R>=expand("<cfile>")<CR>
	"键映射map说明：
	"例如nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>

    	"nmap 表示在vim的普通模式下，即相对于：编辑模块和可视模式，以下是几种模式
        ":map            普通，可视模式及操作符等待模式
        ":vmap           可视模式
        ":omap           操作符等待模式
        ":map!           插入和命令行模式
        ":imap           插入模式
        ":cmap           命令行模式
	"1) <C-/>表示：Ctrl+/
	"2) s表示输入(即按：s)s
	"3) : 表示输入':'
	"4) “cs find s"表示输入"cs find s"也即是要输入的命令
	"5) <C-R>=expand("cword")总体是为了得到：光标下的变量或函数。cword 表示：cursor word, 类似的还有：cfile表示光标所在处的文件名吧
	"6) ＜CR＞＜CR＞就是回车吧，不太清楚
"}
""""""""""""""""""""""""""""""""""
"SrcExpl
""""""""""""""""""""""""""""""""""
" SrcExpl {
	nmap se :SrcExplToggle<CR>
    let g:SrcExpl_winHeight = 8         "指定SrcExpl Windows高度
    let g:SrcExpl_refreshTime = 100     "refresh time = 100ms
    let g:SrcExpl_jumpKey = "<ENTER>"   "跳转(jump)到相关定义definition
    let g:SrcExpl_gobackKey = "<SPACE>" "back
    let g:SrcExpl_isUpdateTags = 0      "tag file update = off
"}
"
""""""""""""""""""""""""""""""""""
"vim-indent-guides
""""""""""""""""""""""""""""""""""
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_autocmds_enabled = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


