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

" HTML and PHP
Plug 'othree/html5.vim', {'for': ['html', 'php']}

" AutoClose HTML Tags
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'php']}

" i3 Config Syntax
Plug 'PotatoesMaster/i3-vim-syntax'

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

" Alignment
Plug 'Align'

" CtrlP fuzzy file finder
Plug 'kien/ctrlp.vim'

"Fuzzy Finder
Plug 'FuzzyFinder'

" L9 Vim-Script Library
Plug 'L9'

" Fast Fold
Plug 'Konfekt/FastFold'

" Buftabline
Plug 'ap/vim-buftabline'

"}}}

call plug#end()
"}}}

"------------------------------------------
" GENERAL SETTINGS
"------------------------------------------
"{{{

set encoding=utf-8

"--------------------------
" UI Settings
"--------------------------
"{{{

set ttyfast           " Faster Character Drawing

" set lazyredraw        " Only Redraw When Needed

syntax enable         " Enable Syntax Highlighting

set background=dark   " Let Vim Choose Good Colors for Dark BG

set number            " Line Numbering

set nowrap            " No Text Wrap

set autoread          " Auto Reload File

set laststatus=2      " Show Status Line

set ruler             " Show Line and Column Position

set hidden            " UnHide Closed Buffers

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

set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

set smartindent " Auto Indenting
set autoindent

set list          " Show Whitespace and Tabs
set listchars=tab:▸\ ,trail:·

"}}}

"--------------------------
" Search/Undo/ETC
"--------------------------
"{{{

set undofile                   " Save a File With Undo History

set undodir='/home/uncledozer/.nvim/tmp'

set hlsearch                   " Highlight Searches

set incsearch                  " Enable Incremental Searching

set ignorecase                 " Ignore Uppercase When Typing all Lower Case

set smartcase                  " Unless an Uppercase Character is Typed

set backspace=indent,eol,start " Allow Deletion of Lines etc

set timeoutlen=550             " Timeout for Commands

set history=1000               " Loads of History
set undolevels=1000            " And Undo

set noswapfile                 " Disable Vim Swap
set nobackup                   " Disable Vim Backup

set formatoptions=qn1          " Text Formatting

" Persistent Info
set viminfo='10,\"100,:20,%,n~/.nviminfo'

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

let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_aria_attributes_complete = 0

let g:PHP_outdentphpescape = 0
let g:PHP_BracesAtCodeLevel = 0

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

" Treat Linebreaks as Seperate Lines
noremap j gj
noremap k gk

" Move Line Up or Down
noremap <A-j> :m .+1<CR>==
noremap <A-k> :m .-2<CR>==

" Fold Keys
noremap <Leader>fm :AutoCloseToggle<CR>i{{{<ESC><plug>NERDComenterComment:AutoCloseToggle<CR>
noremap <Leader>fn :AutoCloseToggle<CR>i}}}<ESC><plug>NERDComenterComment:AutoCloseToggle<CR>
noremap <Leader>fd za
noremap <Leader>fa zA

" Clear Search Highlight
noremap <silent><Leader>/ :nohlsearch<CR>

" Fast Save
noremap <silent><Leader>w :w<CR>

" AutoClose Toggle
noremap <Leader>at :AutoCloseToggle<CR>

" Paste From System Clipboard
noremap <Leader>p "*p

" Jump to Either end or Beginning of the Line
noremap <Leader>e g_
noremap <Leader>b _

" Quick Align
noremap <Leader>a :Align<Space>

" Remove Search Highlight
nnoremap <ESC> :nohlsearch<CR>

" Copy Line and Return to Cursor Position
nnoremap <Leader>c mzVy`z:delmarks z<CR>

" Copy and Past Line and Return to Cursor Position
noremap <Leader>d mzVyp`z:delmarks z<CR>

" Prev Buffer
nnoremap <S-h> :bp<CR>

" Next Buffer
nnoremap <S-l> :bn<CR>

" Close Buffer
nnoremap <Leader>x :bd<CR>

" Reopen Prev. Closed Buffer
nnoremap <Leader>t <C-^>

" Use Enter, Tab, Space Keys in Normal Mode
nnoremap <CR> o<ESC>
nnoremap <TAB> i<TAB><ESC>
nnoremap <Leader><CR> O<ESC>
nnoremap <SPACE> i<SPACE><ESC>

" Increment Interger Up
nnoremap <C-j> <C-x>
nnoremap <C-k> <C-a>

" Load ~/.nvimrc for editing
nnoremap <Leader>ev :w<CR>:e $MYVIMRC<CR>

" Source .nvimrc
nnoremap <Leader>sov :source $MYVIMRC<CR>

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
vnoremap <Leader>y "*y

" Exit Visual Mode
vnoremap <CR> <ESC>

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
hi Error ctermfg=8 cterm=bold

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
" STATUSLINE
"------------------------------------------
"{{{

hi User1 ctermbg=235 ctermfg=12

hi User2 ctermbg=235 ctermfg=11

hi User3 ctermfg=8 ctermbg=4

hi User4 ctermbg=235 ctermfg=4

hi User5 ctermbg=235 ctermfg=4

hi User6 ctermfg=4 ctermbg=235

hi User7 ctermbg=235 ctermfg=13

hi User8 ctermbg=235 ctermfg=10

hi User9 ctermbg=235 ctermfg=12

" Left--------{{{

set statusline=                       " Clear Statusline

set statusline=%3*                    " Set Color

set statusline+=%{GetModified()}      " If file has been modified, change color of file name

set statusline+=%-4{GetMode()}%6*▓▒░  " Set Mode name and color

set statusline+=%1*\ \ \              " Spacer

set statusline+=%.20t%m               " Tail of the file name and the modified tag

" ----------}}}

set statusline+=%= " Switch to the right side

" Right--------{{{

set statusline+=%9*                           " Set Color for clock

set statusline+=%25.25{CurrentTime()}         " Get The Current Time

set statusline+=%5*                           " Color scheme User5

set statusline+=\ %5.5Y                       " Filetype

set statusline+=%{GetFileType()}              " Change color scheme based on filetype (just for some added pizzaz)

set statusline+=%7*                           " Color Scheme User4

set statusline+=%5{''}\ %8*%03.04l\ %7*%02.02c\ \  " Show line and column numbers

set statusline+=%*                            " Return to statusline colors

" ----------}}}

function! GetModified()
    if &modifiable
        if &modified
            hi! User1 ctermfg=11
            return ''
        else
            hi! User1 ctermfg=12
            return ''
        endif
    elseif !&modifiable
        hi User1 ctermfg=1
        return ''
    endif
endfunction

function! GetMode()
    if mode() ==# 'n'
        hi! User3 ctermfg=8 ctermbg=4
        hi! User6 ctermfg=4 ctermbg=235
        return '  N'
    elseif mode() ==# 'i'
        hi! User3 ctermfg=4 ctermbg=8
        hi! User6 ctermfg=8 ctermbg=235
        return '  I'
    elseif mode() ==# 'R'
        hi! User3 ctermfg=8 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  R'
    elseif mode() ==# 'r'
        hi! User3 ctermfg=8 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  r'
    elseif mode() ==# 'v'
        hi! User3 ctermfg=7 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  V'
    elseif mode() ==# 'V'
        hi! User3 ctermfg=7 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  -V-'
    elseif visualmode() ==? "\<C-v>"
        hi! User3 ctermfg=7 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  [V]'
    endif
endfunction

function! GetFileType()
    if &filetype == 'vim'
        hi! User5 ctermfg=10
    elseif &filetype == 'php'
        hi! User5 ctermfg=13
    elseif &filetype == 'html'
        hi! User5 ctermfg=6
    elseif &filetype == 'javascript'
        hi! User5 ctermfg=1
    elseif &filetype == ''
        hi! User5 ctermfg=4
    endif
    return ''
endfunction

function! CurrentTime()
    return strftime("%H:%M")
endfunction

"}}}

"------------------------------------------
" AUTO COMMANDS
"------------------------------------------
"{{{

" Re-Source Vimrc on save
if has("autocmd")
    augroup mynvimrchooks
        au!
        autocmd BufWrite .nvimrc source $MYVIMRC
        autocmd BufWritePost .nvimrc silent YcmRestartServer
    augroup END
endif

" Filetype Commands
if has("autocmd")
    augroup autofiletypes
        au!
        au BufRead,BufNewFile * set formatoptions-=c
        au BufRead,BufNewFile * set formatoptions-=r
        au BufRead,BufNewFile * set formatoptions-=o
        au BufRead,BufNewFile *.html          set filetype   =html5
        au BufRead,BufNewFile *.nvim          set filetype   =vim
        au BufRead,BufNewFile *.nvimrc        set filetype   =vim
        au BufRead,BufNewFile *.vimperratorrc set filetype   =vim
    augroup END
endif

" Markdown Specific
if has ("autocmd")
    augroup mdsettings
        au!
        au FileType markdown setlocal wrap linebreak nolist
        au BufRead,BufNewFile *.md   set filetype=markdown
        au BufRead,BufNewFile *.txt  set filetype=markdown
        au BufRead,BufNewFile *.note set filetype=markdown
        au BufRead,BufNewFile *.todo set filetype=markdown
    augroup END
endif

" PHP Specific
if has ("autocmd")
    augroup phpsettings
        au!
        au BufRead,Bufnewfile *.php nnoremap <buffer><Leader>ph li<?php  ?><ESC>F<Space>i
        au BufReadPost,BufNewFile *.php set autoindent smartindent
    augroup END
endif

" Help Specific
if has ("autocmd")
    augroup helpsettings
        au!
        au FileType help setlocal nowrap
    augroup END
endif

"}}}
