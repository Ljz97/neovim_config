"居正的vimrc配置

"将leader键换成空格
let mapleader=" "

"让vim识别不同文件格式
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

"让编辑器可以使用鼠标
set mouse=a

"设置编码格式
set encoding=utf-8

"让vim配色不受终端影响
let &t_ut=''


"设置tab键缩进长度为2
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"显示行尾空格
set list
set listchars=tab:▸\ ,trail:▫

"缩进相关配置
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

"让vim在不同模式有不同光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"设置状态栏长度等于2
set laststatus=2

"vim执行的命令在当前目录下执行
set autochdir

"打开文件后光标保持在上次关闭时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"语法高亮显示
syntax on

"显示行号
set number

"显示相对行号
set relativenumber

"在当前编辑行显示条线
set cursorline

"自动换行，不让字书超出窗口宽度
set wrap

"显示按键操作
set showcmd

"命令模式下代码补全
set wildmenu

"插入模式下更改esc键为jj
inoremap jj <esc>

"设置sl为向右分屏快捷键，sh为向左分屏，sk为向上分屏，sj为向下分屏
map s<right> :set splitright<CR>:vsplit<CR>
map s<left> :set nosplitright<CR>:vsplit<CR>
map s<up> :set nosplitbelow<CR>:split<CR>
map s<down> :set splitbelow<CR>:split<CR>

"设置窗口分屏后光标移动快捷键
map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <lEADER>j <C-w>j

"上下左右设置分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"t键打开新的标签页
map t :tabe<CR>

"高亮搜索结果
set hlsearch

"防止打开文件后高亮显示仍然存在
exec "nohlsearch"

"边搜索边高亮显示搜索结果
set incsearch

"取消高亮显示
noremap <LEADER><CR> :nohlsearch<CR>

"忽略大小写搜索,用小写搜索时可以搜到大写
set ignorecase

"适应大小写搜索，当输入的搜索内容有大小写区分时按输入搜索
set smartcase




"安装vim插件*****************************************

call plug#begin('~/.vim/plugged')

"显示底部状态栏
Plug 'vim-airline/vim-airline'

"snazzy配色插件
Plug 'connorholyday/vim-snazzy'

" File navigation(第一个是文件树，
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist显示函数列表
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete安装coc插件
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Undo Tree显示历史版本
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown记笔记插件，实时预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks添加书签
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()

"===
"===Taglist按T键显示函数列表
"===
map <silent> T :TagbarOpenAutoClose<CR>

"===
"==换成snazzy配色（需要snazzy插件）
"===
"color snazzy
"let g:SnazzyTransparent = 1
"let g:lightline = {
"\ 'colorscheme': 'snazzy',
"\ }

" ===
" === NERDTree
" ===
"
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }



" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = '/Applications/Google Chrome.app'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === vim-table-mode进入制表模式
" ===
map <LEADER>tm :TableModeToggle<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

"****************************************************
"coc配置*********************************************

"coc插件
let g:coc_global_extensions = [
\ 'coc-actions',
\ 'coc-css',
\ 'coc-diagnostic',
\ 'coc-explorer',
\ 'coc-flutter-tools',
\ 'coc-gitignore',
\ 'coc-html',
\ 'coc-json',
\ 'coc-lists',
\ 'coc-prettier',
\ 'coc-pyright',
\ 'coc-python',
\ 'coc-snippets',
\ 'coc-sourcekit',
\ 'coc-stylelint',
\ 'coc-syntax',
\ 'coc-tasks',
\ 'coc-todolist',
\ 'coc-translator',
\ 'coc-tslint-plugin',
\ 'coc-tsserver',
\ 'coc-vimlsp',
\ 'coc-vetur',
\ 'coc-yaml',
\ 'coc-yank',
\'coc-clangd',
\'coc-cmake']

" TextEdit might fail if hidden is not set.允许不保存的情况下切换文件。
set hidden

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.加快响应速度
set updatetime=300

" Don't pass messages to |ins-completion-menu|.精简补全候选项
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.将git选项和行数合并
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"使用tab键实现代码补全。
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"使用中括号[]+g转到上一个下一个代码报错
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
"查看函数的定义和调用位置。
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
"使用大写K预览显示文档。
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
 "if (index(['vim','help'], &filetype) >= 0)
   "execute 'h '.expand('<cword>')
 "elseif (coc#rpc#ready())
   "call CocActionAsync('doHover')
 "else
   "execute '!' . &keywordprg . " " . expand('<cword>')
 "endif
endfunction

" Highlight the symbol and its references when holding the cursor.
"光标所在相同单词高亮显示
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"重命名变量
nmap <leader>rn <Plug>(coc-rename)

 "Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"
" Use <c-space> to trigger completion.
"使用ctrl+o打开代码补全
inoremap <silent><expr> <c-o> coc#refresh()

"tt打开coc exployer
"nnoremap tt :CocCommand  explorer<CR>

"****************************************************


