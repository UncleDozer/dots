"{{{
"
"     \  |                     _)
"      \ |   _ \   _ \ \ \   /  |  __ `__ \    __|  __|
"    |\  |   __/  (   | \ \ /   |  |   |   |  |    (
"   _| \_| \___| \___/   \_/   _| _|  _|  _| _|   \___|
"  ___________________________________________________
"  |                                                  |\
"  |   │█║▌║▌║▌║▌[          VIM         ]│█║▌║▌║▌║▌   |||
"  |__________________________________________________|||
"   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|
"    ---------------------------------------------------
"
"   ıllıllııllıllı    Out Of The Box    ıllıllııllıllııllı
"
"
"---------------------------------------------------
" Author              : Kristopher Watts (UncleDozer)
" Email               : Kristopher.A.Watts@Gmail.com
" Github              : https://github.com/UncleDozer/
" Website             : http://www.webtastic-development.net
" I'm new to VIM, so any suggestions or improvements would be greatly
" appreciated. Thanks!
"---------------------------------------------------
"}}}

set nocompatible
filetype plugin indent on

"------------------------------------------
" PLUGINS CONFIG
"------------------------------------------
"{{{

" Start Vim-Plug
call plug#begin('~/.nvim/bundle')

"--------------------------
" Syntax Specific Plugins
"--------------------------
"{{{

" Scss Syntax Highlighting
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}

" Javascript Syntax Highlighting
Plug 'jelera/vim-javascript-syntax', {'for': 'js'}

" Javascript Libraries Syntax
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'js'}

" AutoIndent
Plug 'vim-scripts/Smart-Tabs'

" HTML and PHP
Plug 'othree/html5.vim', {'for': ['html', 'php']}
Plug 'joshtronic/php.vim', {'for': ['html', 'php']}
Plug 'vim-scripts/php.vim-html-enhanced', {'for': 'php'}

" AutoClose HTML Tags
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'php']}

" i3 Config Syntax
Plug 'PotatoesMaster/i3-vim-syntax'

" Todo Syntax
Plug 'todo.vim'

" Vim Surround
Plug 'tpope/vim-surround'

"}}}

"--------------------------
" Other Plugins
"--------------------------
"{{{

" Vim AutoClose
Plug 'Townk/vim-autoclose'

" Auto Commenting
Plug 'The-NERD-Commenter'

" Fish Syntax
Plug 'dag/vim-fish'

" Vim Powerline
Plug 'bling/vim-airline'

" Alignment
Plug 'Align'

" CtrlP fuzzy file finder
Plug 'kien/ctrlp.vim'

" Editor Config
Plug 'editorconfig/editorconfig-vim'

" Temporary CapsLock
Plug 'tpope/vim-capslock'

"Fuzzy Finder
Plug 'FuzzyFinder'

" L9 Vim-Script Library
Plug 'L9'

" Fast Fold
Plug 'Konfekt/FastFold'

"}}}

call plug#end()
"}}}

"------------------------------------------
" GENERAL SETTINGS
"------------------------------------------
"{{{

"--------------------------
" UI Settings
"--------------------------
"{{{

set ttyfast           " Faster Character Drawing

set lazyredraw        " Only Redraw When Needed

syntax enable         " Enable Syntax Highlighting

set background=dark   " Let Vim Choose Good Colors for Dark BG

set number            " Line Numbering

set nowrap            " No Text Wrap

set autoread          " Auto Reload File

set laststatus=2      " Show Status Line

set ruler             " Show Line and Column Position

set nohidden          " UnHide Closed Buffers

set showcmd           " Show The Last Command

set showtabline=2     " Always Show Tab Line

set scrolloff=20      " How Many Lines visible before scrolling of buffer
set sidescrolloff=10
set sidescroll=1

set showmatch         " Highlight Brackets
set matchtime=2

set cursorline        " Enable Line Highlighting

set title             " Disable All Bells
set novisualbell
set noerrorbells
set t_vb=
set tm=500

let g:plug_window='top new' " Force Vim-Plug to split horizontally instead of Vertically

"set lines=65
"set columns=80

set foldmethod=marker " Use Default Fold Marker

if has('mouse') "Enable The Mouse
	set mouse=a
endif

" When Editing A File, Always Jump to the Last Known Cursor Position
" Unless Cursor Position is Invalid or the First Line
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"}}}

"--------------------------
" Tab Stuff
"--------------------------
 "{{{

set smartindent " Auto Indenting
set autoindent

set list          " Show Whitespace and Tabs
set listchars=tab:▸\ ,trail:·

"}}}

"--------------------------
" Search/Undo/ETC
"--------------------------
 "{{{

set undodir=".,~/.nvim/undo,~/" " Storage for Undo Files

set undofile                    " Save a File With Undo History

set hlsearch                    " Highlight Searches

set incsearch                   " Enable Incremental Searching

set ignorecase                  " Ignore Uppercase When Typing all Lower Case

set smartcase                   " Unless an Uppercase Character is Typed

set backspace=indent,eol,start  " Allow Deletion of Lines etc

set timeoutlen=550              " Timeout for Commands

set history=1000                " Loads of History
set undolevels=1000             " And Undo

set noswapfile                  " Disable Vim Swap
set nobackup                    " Disable Vim Backup

set formatoptions=qn1           " Text Formatting

" Persistent Info
set viminfo='10,\"100,:20,%,n~/.nviminfo'

"}}}

"--------------------------
" Plugin Settings
"--------------------------
"{{{

" Jquery Syntax Highlighting
let g:used_javascript_libs  = 'jquery'

" Nerd Commenter
let g:NERDRemoveExtraSpaces = 1
let g:NERDSpaceDelims       = 1

" CtrlP Settings
let g:ctrlp_switch_buffer     = 1
let g:ctrlp_working_path_mode = 0

"--------------------------
" Airline Settings
"--------------------------
 "{{{

let g:airline_theme              = 'lucius'

" Symbols
let g:airline_symbols            = {}
" let g:airline_powerline_fonts  = 1
let g:airline_left_sep          = '»'
let g:airline_left_alt_sep      = '▶'
let g:airline_right_sep           = '«'
let g:airline_right_alt_sep       = '◀'
let g:airline_symbols.linenr     = '␊'
let g:airline_symbols.paste      = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr     = '¶'

" Sections
let g:airline_toggle_whitespace          = 1
let g:airline#extensions#tabline#enabled = 1

" Tab Line
let g:airline#extensions#tabline#show_buffers      = 1
let g:airline#extensions#tabline#show_tabs         = 1
let g:airline#extensions#tabline#tab_nr_type       = 1
let g:airline#extensions#tabline#buffer_min_count  = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter         = 'unique_tail_improved'

" Plugin Integration
let g:airline#extensions#capslock#enabled          = 1

" Mode Mappings
let g:airline_mode_map = {
		\ '__' : '-',
		\ 'n'  : 'N',
		\ 'i'  : 'I',
		\ 'R'  : 'R',
		\ 'c'  : 'C',
		\ 'v'  : 'V',
		\ 'V'  : '-V-',
		\ '' : '[V]',
		\ 's'  : 'S',
		\ 'S'  : 'S',
		\ '' : 'S',
		\ }

" More Symbols for Reference ---{{{
" let g:airline_left_sep           = '⮀'
" let g:airline_left_alt_sep       = '⮁'
" let g:airline_right_sep          = '⮂'
" let g:airline_right_alt_sep      = '⮃'
" let g:airline_symbols.branch     = '⭠'
" let g:airline_symbols.readonly   = '⭤'
" let g:airline_left_sep          = '»'
" let g:airline_left_sep          = '▶'
" let g:airline_right_sep         = '«'
" let g:airline_right_sep         = '◀'
" let g:airline_symbols.linenr    = '␊'
" let g:airline_symbols.linenr    = '␤'
" let g:airline_symbols.branch    = '⎇'
" let g:airline_symbols.paste     = 'Þ'
" let g:airline_symbols.paste     = '∥'
" ---}}}

"}}}

"--------------------------
" YouCompleteMe
"--------------------------
 "{{{

" Fix for esc and Autoclose
let g:AutoClosePumvisible                               = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Allow YCM to Complete Inside Comments and Strings
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Complete Identifiers With Syntax
let g:ycm_seed_identifiers_with_syntax                  = 1

" Close YCM Menu After a Completion
let g:ycm_autoclose_preview_window_after_completion     = 1

"}}}

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

"}}}

"------------------------------------------
" KEY MAPPINGS
"------------------------------------------
"{{{

" Remap Leader Key
let mapleader=","

"--------------------------
" Normal/Visual/Operator Mode
"--------------------------
"{{{

" Remap Command key for Faster Commands
noremap ; :

" Move Line Up or Down
noremap <A-j> :m .+1<CR>==
noremap <A-k> :m .-2<CR>==

" Fold Keys
noremap <leader>fm :AutoCloseToggle<CR>i{{{<ESC>c,<space>:AutoCloseToggle<CR>
noremap <leader>fn :AutoCloseToggle<CR>i}}}<ESC>c,<space>:AutoCloseToggle<CR>
noremap <leader>fd za
noremap <leader>fa zA

" Clear Search Highlight
noremap <silent><Leader>/ :nohlsearch<CR>

" Fast Save
noremap <leader>w :w<CR>

" AutoClose Toggle
noremap <leader>at :AutoCloseToggle<CR>

" Paste From System Clipboard
noremap <leader>p "*p

" Jump to Either end or Beginning of the Line
noremap <leader>e $
noremap <leader>b ^

" Quick Align
noremap <leader>a :Align =

" Remove Search Highlight
nnoremap <ESC> :nohlsearch<CR>

" Copy Line and Return to Cursor Position
nnoremap <leader>c mzVy`z:delmarks z<CR>

" Copy and Past Line and Return to Cursor Position
noremap <leader>d mzVyp`z:delmarks z<CR>

" Prev Buffer
nnoremap <S-h> :bp<CR>

" Next Buffer
nnoremap <S-l> :bn<CR>

" Close Buffer
nnoremap <leader>x :bd<CR>

" Reopen Prev. Closed Buffer
nnoremap <leader>t <C-^>

" Use Enter, Tab, Space Keys in Normal Mode
nnoremap <CR> o<ESC>
nnoremap <leader><CR> O<ESC>
nnoremap <TAB> i<TAB><ESC>
nnoremap <SPACE> i<SPACE><ESC>

" Increment Interger Up
nnoremap <C-j> <C-x>
nnoremap <C-k> <C-a>

" }}}

"--------------------------
" Insert Mode
"--------------------------
"{{{

" Exit Insert Mode
inoremap jk <ESC>:nohlsearch<CR>

" Comment Insert Mode
inoremap  <C-o>,c<space>

" CapsLock Toggle
imap <C-L> <Plug>CapsLockToggle

" Yank (or Copy) Text to System Clipboard
vnoremap <leader>y "*y

" Exit Visual Mode
vnoremap <CR> <ESC>

" Paste Toggle For Insert Mode Pasting
set pastetoggle=<f2>

" Sudo Save
command! W :execute ':silent w !sudo tee % > /dev/null'

"}}}

"}}}

"------------------------------------------
" CURSOR SETTINGS
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
" COLORS
"------------------------------------------
"{{{

" Line Highlighting
hi CursorLine ctermbg=235 cterm=italic
hi CursorLineNr cterm=bold ctermfg=1 ctermbg=234
hi LineNr ctermfg=7
hi StatusLine cterm=none ctermfg=0 ctermbg=235
hi StatusLineNC cterm=none ctermfg=7 ctermbg=236
hi TabLineFill term=bold cterm=bold ctermbg=235 ctermfg=0
hi TabLine ctermfg=2 ctermbg=235 cterm=none
hi TabLineSel ctermfg=10 ctermbg=7 cterm=bold

" UI Highlighting
hi Search term=reverse cterm=reverse gui=reverse ctermfg=none ctermbg=none
hi MatchParen cterm=bold ctermfg=8 ctermbg=15
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi Directory ctermfg=4 cterm=none
hi SpecialKey ctermfg=7
hi Special ctermfg=2
hi Nontext ctermfg=7
hi Visual ctermbg=3 ctermfg=16
hi Number cterm=bold ctermfg=3

" Menu Highlighting
hi Pmenu ctermfg=8 ctermbg=4
hi Pmenusel cterm=bold ctermfg=4 ctermbg=8
hi WildMenu ctermfg=7 ctermbg=12

" Syntax Highlighting
hi Statement ctermfg=9
hi Constant ctermfg=5
hi Folded cterm=none ctermfg=4 ctermbg=234
hi Title ctermfg=12 cterm=bold
hi TagbarIcon ctermfg=red cterm=none
hi TagbarHighlight ctermfg=red ctermbg=none
hi TagbarScope ctermfg=blue ctermbg=none cterm=none
hi TagbarKind ctermfg=blue ctermbg=none cterm=none
hi TagbarNestedKind ctermbg=blue ctermbg=none cterm=none
hi Comment ctermfg=4
hi String ctermfg=13

"}}}

"------------------------------------------
" AUTO COMMANDS
"------------------------------------------
"{{{

" Re-Source Vimrc on save
" Toggle YCM and Airline on .nvimrc (They Break After Sourcing)
if has("autocmd")
  augroup mynvimrchooks
    au!
    autocmd BufRead .nvimrc :AirlineToggle
    autocmd bufwritepost .nvimrc
        \ source ~/.nvimrc |
        \ :YCMRestartServer |
  augroup END
endif

" Filetype Commands
if has("autocmd")
  augroup autofiletypes
    au!
    " Vim
    au BufRead * set formatoptions-=c
    au BufRead * set formatoptions-=r
    au BufRead * set formatoptions-=o
    au BufRead,BufNewFile *.nvim          set filetype   =vim
    au BufRead,BufNewFile *.nvimrc        set filetype   =vim
    au BufRead,BufNewFile *.vimperratorrc set filetype   =vim

    " Markdown
    au BufRead,BufNewFile *.md            set filetype   =markdown
    au FileType           *.md            set wrap linebreak nolist
    au BufRead,BufNewFile *.note          set filetype   =markdown
    au BufRead            *.todo          set filetype   =todo
  augroup END
endif

"}}}
