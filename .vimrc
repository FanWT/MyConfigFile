set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://home/hzc/.vim/bundle'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

Bundle 'derekwyatt/vim-scala'

set tabstop=4
set shiftwidth=4
set softtabstop=4
set nu
filetype on
set background=dark
"colorscheme solarized
syntax on
set autoindent
set smartindent
set cursorline
set hlsearch

"taglist
autocmd BufWritePost *.* :TlistUpdate "配合easytag，每次保存后都会自动更新Taglist
map <leader>tt :TlistToggle<CR> 
let Tlist_Use_Right_Window = 1

"-- Cscope setting --
if has("cscope")
set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
set csto=0 "设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
set cst " 同时搜索cscope数据库和标签文件
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
set nocsverb
if filereadable("cscope.out") "若当前目录下存在cscope数据库，添加该数据库到vim
cs add cscope.out
elseif $CSCOPE_DB != "" "否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
cs add $CSCOPE_DB
endif
set csverb
endif
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR> 
"将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-,然后很快再按下c）
nmap <C>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <C>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>

