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
syntax enable         " Enable Syntax Highlighting
filetype plugin indent on

"------------------------------------------
" VIM-PLUG CONFIG
"------------------------------------------
"{{{

" Start Vim-Plug
call plug#begin('~/.nvim/bundle')

"--------------------------
" Syntax Specific Plugins
"--------------------------
"{{{

" Scss Syntax Highlighting
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss' }

" Javascript Syntax Highlighting
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }

" Javascript Libraries Syntax
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'js' }

" HTML and PHP
Plug 'othree/html5.vim', { 'for': [ 'html', 'php' ] }

" AutoClose HTML Tags
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for': [ 'html', 'php' ] }

" i3 Config Syntax
Plug 'PotatoesMaster/i3-vim-syntax'

" Fish Syntax
Plug 'dag/vim-fish', { 'for': 'fish' }

"}}}

"--------------------------
" Other Plugins
"--------------------------
"{{{

" Vim AutoClose
Plug 'Townk/vim-autoclose'

" Auto Commenting
Plug 'The-NERD-Commenter'

" Alignment
Plug 'Align', { 'on': 'Align' }

" CtrlP fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Fast Fold
Plug 'Konfekt/FastFold'

" Buftabline
Plug 'ap/vim-buftabline'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Goyo, Vim Focus Mode
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Vim Surround
Plug 'tpope/vim-surround'

" Vim Session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

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

set background=dark

set ttyfast           " Faster Character Drawing

" set lazyredraw      " Only Redraw When Needed

set number            " Line Numbering

set nowrap            " No Text Wrap

set autoread          " Auto Reload File

set autowriteall

set laststatus=2      " Show Status Line

set ruler             " Show Line and Column Position

set hidden            " UnHide Closed Buffers

set showcmd           " Show The Last Command

set showtabline=2     " Always Show Tab Line

set scrolloff=20      " How Many Lines visible before scrolling of buffer

set sidescrolloff=10

set sidescroll=1

set showmatch         " Highlight Brackets

set matchtime=2       " Tenths of a Second to Show the Matching Bracket

set cursorline        " Enable Line Highlighting

set title             " Disable All Bells
set novisualbell
set noerrorbells
set t_vb=
set tm=500

let g:plug_window='top new' " Force Vim-Plug to split horizontally instead of Vertically

set foldmethod=marker       " Use Default Fold Marker

" When Editing A File, Always Jump to the Last Known Cursor Position
" Unless Cursor Position is Invalid or the First Line
if has('autocmd')
    augroup jump
        au!
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END
endif

"}}}

"--------------------------
" Tab Stuff
"--------------------------
"{{{

set expandtab " Expand Tabs to Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set breakindent " Visually Break Lines in Wrap Mode

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

set undodir=$HOME/.dots/nvim/.nvim/undo

set hlsearch                   " Highlight Searches

set incsearch                  " Enable Incremental Searching

set ignorecase                 " Ignore Uppercase When Typing all Lower Case

set smartcase                  " Unless an Uppercase Character is Typed

set backspace=indent,eol,start " Allow Deletion of Lines etc

set timeoutlen=250             " Timeout for Commands
set ttimeoutlen=50             " Timeout for Commands

set history=1000               " Loads of History
set undolevels=1000            " And Undo
set undoreload=1000

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

let g:ctrlp_show_hidden = 1

let g:ctrlp_max_files = 2000

" Auto Completion Vim Popup
set completeopt=longest,menu,preview

set wildignore=*/.git/*,*/node_modules/*,*/dist/*

"}}}

"}}}

"------------------------------------------
" PLUGIN SETTINGS
"------------------------------------------
"{{{

" Jquery Syntax Highlighting
let g:used_javascript_libs                    = 'jquery'

" Nerd Commenter
let g:NERDRemoveExtraSpaces                   = 1
let g:NERDSpaceDelims                         = 1

" CtrlP Settings
let g:ctrlp_switch_buffer                     = 1
let g:ctrlp_working_path_mode                 = 0

" HTML5 and PHP syntax settings
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete          = 0
let g:html5_aria_attributes_complete          = 0

let g:PHP_outdentphpescape                    = 0
let g:PHP_BracesAtCodeLevel                   = 0

" FastFold Settings
let g:fastfold_savehook                       = 1
let g:fastfold_fold_command_suffixes          = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands         = [']z', '[z','zj','zk']

" Goyo Settings
let g:goyo_width                              = 90
let g:goyo_margin_top                         = 0
let g:goyo_margin_bottom                      = 0
let g:goyo_linenr                             = 1

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=5
    set linebreak
    set wrap
    set numbers
    set tabline
    noremap <Leader>e g$
    noremap <Leader>b g0
endfunction

function! s:goyo_leave()
    set nolinebreak
    set nowrap
    set showmode
    set showcmd
    set tabline
    set notabline = 0
    set scrolloff=20
    highlight! clear
    source $MYVIMRC
    noremap <Leader>e g_
    noremap <Leader>b _
endfunction

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

" Get Filepath relative to working dir
nnoremap <leader>en :echo @%<CR>

nnoremap <leader>scr :e $HOME/.note/scratch.note<CR>ggVGdP

" Treat Linebreaks as Seperate Lines
noremap k gk
noremap j gj

" Move Line Up or Down
noremap <A-j> :m .+1<CR>==
noremap <A-k> :m .-2<CR>==

" Generate ComDoc
nnoremap  <Leader>doc :set paste<CR>i/*{{{<CR> * @Author: Kristopher Watts <kristopher.a.watts@gmail.com><CR> * @Location: ""<CR> *<CR> * @Uses:<CR> * @Example:<CR> *<CR> *<CR>}}}*/<CR><Esc>:set nopaste<CR>

" Fold Keys
nnoremap <Leader>fm :AutoCloseToggle<CR>i{{{<ESC><plug>NERDComenterComment:AutoCloseToggle<CR>
nnoremap <Leader>fn :AutoCloseToggle<CR>i}}}<ESC><plug>NERDComenterComment:AutoCloseToggle<CR>
nnoremap <Leader>fd za
nnoremap <Leader>fa zA

" Clear Search Highlight
noremap <silent><Leader>/ :nohlsearch<CR>

" Fast Save
noremap <silent><Leader>w :w<CR>

" AutoClose Toggle
noremap <Leader>at :AutoCloseToggle<CR>

" Paste From System Clipboard
noremap <Leader>p "+p

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

" Switch to Previous Buffer
nnoremap <Leader>t <C-^>

" Toggle Goyo for Nice Reading
nnoremap <Leader>g :Goyo<CR>

" Use Enter, Tab, Space Keys in Normal Mode
noremap <CR> o<ESC>
noremap <TAB> i<TAB><ESC>
noremap <Leader><CR> O<ESC>
noremap <SPACE> i<SPACE><ESC>

" Increment Interger Up
nnoremap <C-j> <C-x>
nnoremap <C-k> <C-a>

" Load ~/.nvimrc for editing
nnoremap <Leader>av :e $MYVIMRC<CR>

" Source .nvimrc
nnoremap <Leader>sov :source $MYVIMRC<CR>

" Unmap Arrow Keys
nnoremap Ïa <nop>
nnoremap Ïd <nop>
nnoremap Ïb <nop>
nnoremap Ïc <nop>
" nnoremap <C-Up> <nop>
" nnoremap <C-Down> <nop>
nnoremap <C-Left> <nop>
nnoremap <C-Right> <nop>

" Change Fonts and Font Sizes on The Fly
" Urxvt Tested Only

" Define The Default Font Style
function! FontChange()

    let g:FontDefault = {
                \ "name": 'terminesspowerline',
                \ "size": 32,
                \ "style": 'bold',
                \ "xft": 0,
                \ "xfont": 1,
                \ }

    function! GetFontString()
        if (g:FontDefault.xft)
            let g:FontString = join(['xft:',g:FontDefault.name,'pixelsize:',g:FontDefault,'style:',g:FontDefault.style],'')

        elseif (g:FontDefault.xfont)
            let l:FontString = join(['-*-',g:FontDefault.name,'-',g:FontDefault.style,'-*-*-*-',g:FontDefault.size,'-*-*-*-*-*-*-*'],'')

        else " Default to xfont for safety
            let l:FontString = join(['-*-',g:FontDefault.name,'-',g:FontDefault.style,'-*-*-*-',g:FontDefault.size,'-*-*-*-*-*-*-*'],'')
        endif

        let g:FontDefault.fontstring = l:FontString
    endfunction

    function! GetTermFontEsc()
        call GetFontString()
        let l:escst = '"\033]710;'
        let l:esced = '\033\\"'
        let l:termescape = join([l:escst,g:FontDefault.fontstring,l:esced],'')
        let g:FontDefault.termescape = l:termescape
    endfunction

    call GetTermFontEsc()

    "Echo the escape code in terminal
    let g:EchoMe = join(['echo -e ',g:FontDefault.termescape],'')
    let g:EchoMe = g:EchoMe
    execute ':terminal ' . g:EchoMe

endfunction

" }}}

"--------------------------
" EX: Mappings
"--------------------------
"{{{

" Sudo Save
command! W :execute ':silent w !sudo tee % > /dev/null'

" 

"}}}

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
vnoremap <Leader>y "+y

" Exit Visual Mode
vnoremap <CR> <ESC>

"}}}

"--------------------------
" Paste From Registers
"--------------------------
"{{{

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
hi CursorLineNr ctermfg=9 ctermbg=234
hi LineNr ctermfg=0
hi StatusLine cterm=none ctermfg=0 ctermbg=235
hi StatusLineNC cterm=none ctermfg=7 ctermbg=236
hi TabLineFill term=bold cterm=bold ctermbg=none ctermfg=0
hi TabLine ctermfg=2 ctermbg=235 cterm=none
hi TabLineSel ctermfg=10 ctermbg=none cterm=none

" UI Highlighting
hi Search cterm=reverse ctermfg=none ctermbg=none
hi MatchParen cterm=bold ctermfg=8 ctermbg=15
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi Directory ctermfg=4 cterm=none
hi SpecialKey ctermfg=7
hi Special ctermfg=2
hi Nontext ctermfg=7
hi Visual ctermbg=3 ctermfg=15
hi Number cterm=bold ctermfg=3
hi Error ctermfg=15 ctermbg=9 cterm=bold
hi ErrorMsg ctermbg=9 ctermfg=15 cterm=bold

" Menu Highlighting
hi Pmenu ctermfg=15 ctermbg=4
hi Pmenusel cterm=bold ctermfg=15 ctermbg=12
hi WildMenu ctermfg=16 ctermbg=12

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
hi User3 ctermfg=235 ctermbg=12
hi User4 ctermbg=235 ctermfg=12
hi User5 ctermbg=235 ctermfg=12
hi User6 ctermfg=12 ctermbg=235
hi User7 ctermbg=235 ctermfg=13
hi User8 ctermbg=235 ctermfg=10
hi User9 ctermbg=235 ctermfg=12

" Left--------{{{

set statusline=                       " Clear Statusline

set statusline=%3*                    " Set Color

set statusline+=%{GetModified()}      " If file has been modified, change color of file name

set statusline+=%-4{GetMode()}%6*▓▒░  " Set Mode name and color

set statusline+=%1*\                  " Spacer

set statusline+=%-25t%m               " Tail of the file name and the modified tag

set statusline+=%1*\                  " Spacer

" ----------}}}

set statusline+=%= " Switch to the right side

" Right--------{{{

set statusline+=%9*                                " Set Color for clock

set statusline+=%-7{CurrentTime()}                 " Get The Current Time

set statusline+=%5*                                " Color scheme User5

set statusline+=\ %5.5Y                            " Filetype

set statusline+=%-5.20{GetFileType()}              " Change color scheme based on filetype (just for some added pizzaz)

set statusline+=%7*                                " Color Scheme User4

set statusline+=%5{''}\ %8*%03.04l\ %7*%02.02c\ \ " Show line and column numbers

set statusline+=%*                                 " Return to statusline colors

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
    if mode() ==# 'n' " Normal
        hi! User3 ctermfg=235 ctermbg=12
        hi! User6 ctermfg=12 ctermbg=235
        return '  N '
    elseif mode() ==# 'i' " Insert
        hi! User3 ctermfg=235 ctermbg=8
        hi! User6 ctermfg=8 ctermbg=235
        return '  I '
    elseif mode() ==# 'R' " Replace All
        hi! User3 ctermfg=235 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  R '
    elseif mode() ==# 'r' " Replace Selection
        hi! User3 ctermfg=235 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  r '
    elseif mode() ==# 'v' " Visual
        hi! User3 ctermfg=235 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  V '
    elseif mode() ==# 'V' " Visual Line
        hi! User3 ctermfg=235 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  -V- '
    elseif mode() ==# "" " Visual Block
        hi! User3 ctermfg=235 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  [V] '
    elseif mode() ==# 'c' " Search
        hi! User3 ctermfg=235 ctermbg=13
        hi! User6 ctermfg=13  ctermbg=235
        return '  / '
    else
        return mode()
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

if has("autocmd")

    " Re-Source Vimrc on save
    augroup mynvimrchooks
        au!
        autocmd BufWritePost .nvimrc source $MYVIMRC
        autocmd BufWritePost .nvimrc silent YcmRestartServer
    augroup END

    " Filetype Commands
    augroup autofiletypes
        au!
        au BufRead,BufNewFile *.nvim set filetype=vim
        au BufRead,BufNewFile *.nvimrc set filetype=vim
        au BufReadPost,BufNewFile *.html set filetype=html
        au BufReadPost,BufNewFile *.php set filetype=php.html
        au BufReadPost,BufNewFile *.js set filetype=javascript
        au BufRead,BufNewFile *.vimperratorrc set filetype=vim
    augroup END

    " Markdown Specific
    augroup mdsettings
        au!
        au BufRead,BufNewFile *.md   setlocal filetype=markdown
        au BufRead,BufNewFile *.txt  setlocal filetype=markdown
        au BufRead,BufNewFile *.note setlocal filetype=markdown
        au BufRead,BufNewFile *.todo setlocal filetype=markdown
        au BufRead,BufNewFile vimp*.tmp setlocal filetype=markdown
    augroup END

    " Filetype Specific Mappings
    augroup filemappings
        au!
        au BufRead,BufNewFile *.php iabbrev <buffer> <?i <?php  ?><ESC>2hi
        au BufRead,BufNewFile *.php iabbrev <buffer> <?o <?php<CR><CR>?><ESC>ki
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>flo <ESC>i<?php<CR><CR>?><ESC>k
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>fli <ESC>i<?php  ?><ESC>2hi
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>ch <ESC>I<!--<ESC>A  --!><ESC>4h
    augroup END

    " Goyo autos
    augroup Goyo
        au! User GoyoEnter
        au! User GoyoLeave
        au  User GoyoEnter nested call <SID>goyo_enter()
        au  User GoyoLeave nested call <SID>goyo_leave()
    augroup END

endif

"}}}
