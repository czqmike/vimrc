" 设置leader为,
let mapleader=","
let g:mapleader=","

set noswapfile
set fenc=utf-8
set fencs=utf-8,cp936,gb18030,ucs-bom,shift-jis,gbk,gb2312

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" set mouse=a
set showcmd
set wildmode=longest:list

set nocompatible            " 关闭 vi 兼容模式
syntax on                   " 自动语法高亮
filetype on                  " 检测文件的类型
filetype plugin on          " 开启插件检测
filetype indent off          " 开启检测文件缩进
set number                  " 显示行号
set ruler                   " 显示标尺
set nocursorline            " 不突出显示当前行
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set expandtab               " 使用空格取代制表符
set nobackup                " 覆盖文件时不备份
set autochdir               " 自动切换当前目录为当前文件所在的目录
set backupcopy=yes          " 设置备份时的行为为覆盖
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=3             " 短暂跳转到匹配括号的时间
" set nowrap                  " 不自动换行
set magic                   " 显示括号配对情况
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
"set autoindent              " 新行自动缩进
"set smartindent             " 开启新行时使用智能自动缩进
:set backspace=indent,eol,start
                " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
" set foldenable              " 开始折叠
" set foldmethod=syntax       " 设置语法折叠
" set foldcolumn=0            " 设置折叠区域的宽度
" setlocal foldlevel=1        " 设置折叠层数为
" set foldclose=all           " 设置为自动关闭折叠
colorscheme elflord       " 设定配色方案
set wrapscan		" 设定循环查找

" 清除搜索高亮
" nnoremap <esc> :noh<return><esc>

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
" inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

function CloseBracket()
  if match(getline(line('.') + 1), '\s*}') < 0
    return "\<CR>}"
  else
    return "\<Esc>j0f}a"
  endif
endf

function QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
    if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
      return a:char
    elseif line[col - 1] == a:char
    "Escaping out of the string
      return "\<Right>"
    else
    "Starting a string
      return a:char.a:char."\<Esc>i"
    endif
endf

:set vb t_vb= " Turn off the noisy bell.
