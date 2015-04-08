set nocompatible

" SH Shell
"set shell=sh
filetype plugin on
filetype plugin indent on

"------------------------------------------
"PLUGINS CONFIG
"------------------------------------------
"{{{

" Start Vim-Plug
call plug#begin('~/.nvim/bundle')

"--------------------------
"Syntax Specific Plugins
"--------------------------
"{{{

" Scss Syntax Highlighting
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}

" Javascript Syntax Highlighting
Plug 'jelera/vim-javascript-syntax', {'for': 'js'}

" Javascript Libraries Syntax
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'js'}

" AutoIndent
Plug 'tpope/vim-sleuth'

" HTML and PHP
Plug 'othree/html5.vim'
Plug 'joshtronic/php.vim', {'for': 'php'}
Plug 'vim-scripts/php.vim-html-enhanced', {'for': 'php'}

" AutoClose HTML Tags
Plug 'vim-scripts/HTML-AutoCloseTag'

" i3 Config Syntax
Plug 'PotatoesMaster/i3-vim-syntax'

" Todo Syntax
Plug 'todo.vim'

"}}}

"--------------------------
" Other Plugins
"--------------------------
"{{{

" Git Gutter
Plug 'vim-gitgutter'

" Vim AutoClose
Plug 'Townk/vim-autoclose'

" Auto Commenting
Plug 'The-NERD-Commenter'

" Gvim color support for color terminals
Plug 'vim-scripts/colorsupport.vim'

" Fish Syntax
Plug 'dag/vim-fish'

" CSS Color Highlighting
"Plug 'ap/vim-css-color'
Plug 'chrisbra/colorizer'

" Vim Powerline
Plug 'bling/vim-airline'

" Alignment
Plug 'Align'

" CtrlP fuzzy file finder
Plug 'kien/ctrlp.vim'

" Undo history visualizer
Plug 'sjl/gundo.vim'
"}}}

call plug#end()
"------------------------------------------
"}}}

"------------------------------------------
"GENERAL SETTINGS
"------------------------------------------
"{{{
"--------------------------
"UI Settings
"--------------------------
"{{{
set ttyfast           " Faster Character Drawing
"set lazyredraw        " Only Redraw When Needed

syntax enable         " Enable Syntax Highlighting

set background=dark   " Let Vim Choose Good Colors for Dark BG

set number            " Line Numbering

set nowrap            " No Text Wrap

set autoread          " Auto Reload File

set laststatus=2      " Show Status Line

set ruler             " Show Line and Column Position

set hidden            " Hide Closed Buffers

set showcmd           " Show The Last Command
set showtabline=2     " Always Show Tab Line

set autoindent
set smartindent

set scrolloff=20      " How Many Lines at Bottom or Top of buffer
set sidescrolloff=10
set sidescroll=1

set showmatch         " Highlight Brackets
set matchtime=2

set cursorline        " Enable Cursor Highlighting

set title             " Disable All Bells
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set lines=65 columns=80

set foldmethod=marker
"}}}
"--------------------------
" Tab Stuff
"--------------------------
 "{{{

set tabstop=2      " Tabs are 2 characters long and are not spaces

set shiftwidth=2   " Use Tabstop when indenting

set shiftround     " Round up using tabstop

set smarttab

set noexpandtab

set list "Show Whitespace and Tabs
set listchars=tab:▸\ ,trail:·

"}}}
"--------------------------
" Search/Undo/ETC
"--------------------------
 "{{{
 set undodir="//~/.nvim/undo//"
set undofile                   " Save a file with undo history

set hlsearch                   " Highlight Searches

set incsearch                  " Enable Incremental Searching

set ignorecase                 " Ignore Uppercase when typing all lower case

set smartcase                  " Unless an Uppercase Character is typed

set backspace=indent,eol,start " Allow Deletion of lines etc

set timeoutlen=550             " Timeout for commands

set history=1000               " Loads of History
set undolevels=1000            " And Undo

set noswapfile                 " Disable Vim Swap
set nobackup                   " Disable Vim Backup

set formatoptions=qn1

set formatoptions-=cro

set viminfo='10,\"100,:20,%,n~/.viminfo'"Set Nifty Stuff
"}}}

"--------------------------
"Plugin Settings
"--------------------------
 "{{{
let g:used_javascript_libs = 'jquery' " Jquery Syntax Highlighting

if has('mouse') "Enable The Mouse
	set mouse=a
endif


" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif


"--------------------------
"Airline Settings
"--------------------------
 "{{{
let g:airline_symbols = {}
let g:airline_powerline_fonts                     = 1
let g:airline_left_sep                            = '⮀'
let g:airline_left_alt_sep       = '⮁'
let g:airline_right_sep                           = '⮂'
let g:airline_right_alt_sep      = '⮃'
let g:airline_theme                               = 'lucius'
let g:airline_toggle_whitespace                   = 1
let g:airline#extensions#tabline#enabled          = 1
let g:airline#extensions#tabline#show_buffers     = 1
let g:airline#extensions#tabline#show_tabs        = 1
let g:airline#extensions#tabline#formatter        = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'
"let g:airline_symbols.linenr    = '⭡'

let g:airline_mode_map = {
		\ '__' : '-',
		\ 'n'  : 'N',
		\ 'i'  : 'I',
		\ 'R'  : 'R',
		\ 'c'  : 'C',
		\ 'v'  : 'V',
		\ 'V'  : 'V',
		\ '' : 'V',
		\ 's'  : 'S',
		\ 'S'  : 'S',
		\ '' : 'S',
		\ }

" unicode symbols
"let g:airline_left_sep          = '»'
"let g:airline_left_sep          = '▶'
"let g:airline_right_sep         = '«'
"let g:airline_right_sep         = '◀'
"let g:airline_symbols.linenr    = '␊'
"let g:airline_symbols.linenr    = '␤'
let g:airline_symbols.linenr     = '¶'
"let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste      = 'ρ'
"let g:airline_symbols.paste     = 'Þ'
"let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep          = ''
"let g:airline_left_alt_sep      = ''
"let g:airline_right_sep         = ''
"let g:airline_right_alt_sep     = ''
"let g:airline_symbols.branch    = ''
"let g:airline_symbols.readonly  = ''
"let g:airline_symbols.linenr    = ''

" Php Syntax Highlighting
let g:php_htmlInStrings = 1

" CtrlP Settings
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 0
"}}}

"--------------------------
" YouCompleteMe
"--------------------------
 "{{{

" Fix for esc and autoclose & ycm
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Allow ycm to complete inside comments and strings
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings  = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Complete Identifiers with syntax
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_autoclose_preview_window_after_completion = 1
"}}}
"----------------------------------------------------
"}}}

"--------------------------
" Popup Menu Settings
"--------------------------
"{{{
set wildmenu
set wildchar=<TAB>

set wildmode=list:full

" Auto Completion Vim Popup
set completeopt=longest,menuone,preview

set wildignore=*/.git/*,*/node_modules/*,*/dist/*

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
	\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
	\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>
"}}}
"----------------------------------------------------
"}}}

"------------------------------------------
" KEY COMMANDS
"------------------------------------------
"{{{
" Remap Leader Key
let mapleader=","

" Remap command key for faster commands
nnoremap ; :
vnoremap ; :

" Prev Buffer
nnoremap <S-h> :bp<CR>

" Next Buffer
nnoremap <S-l> :bn<CR>

" Close Buffer
nnoremap <leader>x :bd<CR>

" Reopen Prev. Closed Buffer
nnoremap <leader>t <C-^>

" Close Tab
"nnoremap <C-x> :tabclose<CR>

" Enter Key in Normal mode
nnoremap <CR> o<ESC>
nnoremap <leader><CR> O<ESC>

" Undo Insert Mode
imap <C-z> <C-o>:u<CR>

" Save Insert Mode
imap <C-s> <C-o>:w<CR>

" Exit Insert Mode
imap jk <ESC>:nohlsearch<CR>

" Remove Search highlight
nmap <ESC> :nohlsearch<CR>

" Comment Insert Mode
imap  <C-o>,c<space>

" Paste Toggle For Insert Mode Pasting
set pastetoggle=<f2>

" Clear Search Highlight
nmap <silent><Leader>/ :nohlsearch<CR>

" Fast Save
nmap <leader>w :w<CR>

" AutoClose Toggle
nmap <leader>at :AutoCloseToggle<CR>

"Paste From System Clipboard
nmap <leader>p "*p

"Jump to either end or beginning of the line
nnoremap <leader>e $
nnoremap <leader>b ^

" Yank (or copy) Text to System Clipboard
vmap <leader>y "*y

" Move Line Up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> <Esc>:m .+1<CR>gv=gv
vnoremap <A-k> <Esc>:m .-2<CR>gv=gv

" Copy Line
nnoremap <leader>c mzVy`z:delmarks z<CR>

" Copy and Past Line
nnoremap <leader>d mzVyp`z:delmarks z<CR>

" Sudo Save
command! W :execute ':silent w !sudo tee % > /dev/null'

"Fold Keys
nmap <leader>fm :AutoCloseToggle<CR>i{{{<ESC>c,<space>:AutoCloseToggle<CR>
nmap <leader>fn :AutoCloseToggle<CR>i}}}<ESC>c,<space>:AutoCloseToggle<CR>
nmap <leader>fd za
nmap <leader>fa zA
"------------------------------------------
"}}}

"------------------------------------------
"CURSOR SETTINGS
"------------------------------------------
"{{{
" 1,0 -> Blinking Block
" 2   -> Solid Block
" 3   -> Blinking Underscore
" 4   -> Solid Underscore
" 5   -> Blinking Vertical Bar
" 6   -> Solid Vertical Bar

" Insert Mode
let &t_SI .= "\<Esc>[5 q"

" Normal Mode
let &t_EI .= "\<Esc>[2 q"
"}}}
"------------------------------------------

"------------------------------------------
" Colors
"------------------------------------------
"{{{

" Line Highlighting
hi CursorLine ctermbg=7 cterm=none
hi CursorLineNr cterm=bold ctermfg=1 ctermbg=235
hi LineNr ctermfg=240
hi StatusLine cterm=none ctermfg=0 ctermbg=7
hi StatusLineNC cterm=none ctermfg=235 ctermbg=235
hi TabLineFill term=bold cterm=bold ctermbg=7 ctermfg=15
hi TabLine ctermfg=4 ctermbg=7 cterm=none
hi TabLineSel ctermfg=1 ctermbg=none cterm=bold

" Gui Highlighting
hi Search term=reverse cterm=reverse gui=reverse ctermfg=none ctermbg=none
hi MatchParen cterm=bold ctermfg=8 ctermbg=15
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi Directory ctermfg=4 cterm=none
hi SpecialKey ctermfg=7
hi Special ctermfg=green
hi Nontext ctermfg=7
hi Visual ctermbg=3 ctermfg=16
hi Pmenu ctermfg=8 ctermbg=3
hi Pmenusel cterm=bold ctermfg=16 ctermbg=1
hi Number cterm=bold ctermfg=red

" Syntax Highlighting
hi Statement ctermfg=1
hi Constant ctermfg=2
hi Folded cterm=none ctermfg=4 ctermbg=none
hi Title ctermfg=blue cterm=bold
hi TagbarIcon ctermfg=red cterm=none
hi TagbarHighlight ctermfg=red ctermbg=none
hi TagbarScope ctermfg=blue ctermbg=none cterm=none
hi TagbarKind ctermfg=blue ctermbg=none cterm=none
hi TagbarNestedKind ctermbg=blue ctermbg=none cterm=none
hi Comment cterm=NONE term=NONE gui=NONE ctermfg=4
hi String ctermfg=5
"}}}

"------------------------------------------
"OTHER SETTINGS
"------------------------------------------
"{{{

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
  augroup myvimrchooks
    au!
    "autocmd bufwritepost .nvimrc source ~/.nvimrc
  augroup END
endif

" Set File Types
if has("autocmd")
  augroup autofiletypes
    au!
    au filetype *. setlocal fo-=cro
    au FileType php so ~/.vim/ftplugin/html_autoclosetag.vim
    au BufRead *.todo set filetype=todo
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile *.nvim set filetype=vim
    au BufRead,BufNewFile *.nvimrc set filetype=vim
    au BufRead, BufNewFile *.note set filetype=markdown
    au BufRead,BufNewFile *.vimperratorrc set filetype=vim
    "au BufRead,BufNewFile *.scss set filetype=css.scss
    "au BufRead,BufNewFile *.php set filetype=html.php
  augroup END
endif

"}}}
