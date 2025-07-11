" version: 25.7.11
" Configuration file for vim
set modelines=0		" CVE-2007-2438

" 自定义设置
" set mouse=a

" colorscheme desert           " 着色模式:灰色背景
set guifont=Monaco:h14

set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu!                      " 显示行号
set showmatch                " 显示括号配对情况
" set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
set nocompatible             " 关闭兼容模式
set cursorline               " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区
set list                     " 显示Tab符，使用一高亮竖线代替
set listchars=tab:\|\        " 显示Tab符，使用一高亮竖线代替
set noswapfile               " 设置无交换区文件"
set writebackup              " 设置无备份文件
set nobackup                 " 设置无备份文件
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=syntax        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set laststatus=2             " 开启状态栏信息
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set showtabline=2            " 设置默认显示标签
set clipboard+=unnamed       " 与系统公用剪贴板
set autoread                 " 当文件在外部被修改，自动更新该文件
set scrolloff=5              " 设定光标离窗口上下边界 5 行时窗口自动滚动
set guioptions-=T            " 去掉上方工具栏
set autochdir                " 自动切换到当前目录"
set autoread                 " 自动检测并加载外部对文件的修改"
set autowrite                " 自动检测并加载外部对文件的修改"
set showcmd                  " 命令栏显示命令 "
set ignorecase smartcase     " 搜索时智能忽略大小写
set tabstop=4 " (ts) 设置一个 <tab> 显示为多少个空格
set expandtab " (et) 把 <tab> 转换为空格
set number
set relativenumber

" [总是使用系统粘贴板]
set clipboard=unnamedplus

" [删除而不是剪切]
nnoremap d "_d
nnoremap D "_D
nnoremap c "_c
nnoremap C "_C
nnoremap x "_x

vnoremap d "_d
vnoremap c "_c
vnoremap < <gv
vnoremap > >gv

inoremap <Space> <Space><C-g>u
inoremap <Tab> <Tab><C-g>u
inoremap <CR> <CR><C-g>u

" [括号补全]
" [https://github.com/Houl/repmo-vim]
" " map a motion and its reverse motion:
" :noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
" :noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj', you can keep that:
" :map <expr> j repmo#Key('gj', 'gk')|sunmap j
" :map <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
" :map <expr> ; repmo#LastKey(';')|sunmap ;
" :map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
" :noremap <expr> f repmo#ZapKey('f')|sunmap f
" :noremap <expr> F repmo#ZapKey('F')|sunmap F
" :noremap <expr> t repmo#ZapKey('t')|sunmap t
" :noremap <expr> T repmo#ZapKey('T')|sunmap T

" :noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
" :noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')
" repeat the last [count]motion:
" :map <expr> <Space> repmo#LastKey('')|sunmap <Space>
" :map <expr> <BS>    repmo#LastRevKey('')|sunmap <BS>
"
" :let g:repmo_require_count = 1

" 这里用 noremap 则在 vim 编辑器和 VSCode 中行为不同
" :map j gj
" :map k gk
:map ; 5gj
:map , 5gk
" :map j gj " 这玩意导致 vscode neovim 缩到短行的时候会无法记住水平位置
" 是因为 gk 会定位到 newline 符号上随后强制位移一次
" :map k gk

