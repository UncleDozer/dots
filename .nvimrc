set nocompatible

filetype off

" Bash Shell for Vundle Compatibility
set shell=sh

"------------------------------------------
"VUNDLE PLUGIN MANAGER CONFIG
"------------------------------------------
"{{{

" Set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim

" Vundle Install Path
call vundle#begin('~/.nvim/bundle')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"--------------------------
"Syntax Specific Plugins
"--------------------------
"{{{

" Scss Syntax Highlighting
Plugin 'cakebaker/scss-syntax.vim'

" Javascript Syntax Highlighting
Plugin 'jelera/vim-javascript-syntax'

" Javascript Libraries Syntax
Plugin 'othree/javascript-libraries-syntax.vim'

" Bracket/tag/etc completion
Plugin 'tpope/vim-sleuth'

" HTML and PHP
Plugin 'othree/html5.vim'
Plugin 'joshtronic/php.vim'
Plugin 'vim-scripts/php.vim-html-enhanced'

" AutoClose HTML Tags
Plugin 'vim-scripts/HTML-AutoCloseTag'

" Vimperator Syntax
"Plugin ''
"}}}

"--------------------------
" Other Plugins
"--------------------------
"{{{

" Vim AutoClose
Plugin 'Townk/vim-autoclose'

" Auto Commenting
Plugin 'The-NERD-Commenter'

" Gvim color support for color terminals
Plugin 'vim-scripts/colorsupport.vim'

" Fish Syntax
Plugin 'dag/vim-fish'

" CSS Color Highlighting
"Plugin 'ap/vim-css-color'
Plugin 'chrisbra/colorizer'

" Vim Powerline
Plugin 'bling/vim-airline'

" Vimbed for Pterosaur (firefox vim)
Plugin 'ardagnir/vimbed'

" Alignment
Plugin 'Align'

" CtrlP fuzzy file finder
Plugin 'kien/ctrlp.vim'

" Undo history visualizer
Plugin 'sjl/gundo.vim'
"}}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
set lazyredraw        " Only Redraw When Needed

syntax enable         " Enable Syntax Highlighting

"colorscheme glacier  " Colorscheme Set

set background=dark   " Let Vim Choose Good Colors for Dark BG
"set background
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
set sidescrolloff=25
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

set softtabstop=2

set noexpandtab

set list "Show Whitespace and Tabs
set listchars=tab:▸\ ,trail:·

"}}}
"--------------------------
" Search/Undo/ETC
"--------------------------
 "{{{
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
let g:rainbow_active = 0 " Enable Rainbow Highlighting

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


" Hilight Current Line Number
"hi clear CursorLine
"augroup CLClear
  "autocmd! ColorScheme * hi clear CursorLine
"augroup END

"augroup CLNRSet
  "autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=5
"augroup END


"Syntax Check
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list            = 1
"let g:syntastic_check_on_open            = 1
"let g:syntastic_check_on_wq              = 0

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
let g:airline_theme                               = 'bubblegum'
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

" old vim-powerline symbols


" Airline Pallette function
" 2=foreground
" 3=background
"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
	"for colors in values(a:palette.inactive)
		"let colors[3] = 7
		"let colors[2] = 15
		"let colors[1] = 2
	"endfor
	"for colors in values(a:palette.normal)
		"let colors[3] = 7
		"let colors[2] = 13
		"let colors[1] = 10
	"endfor
"endfunction

" Readable Highlighting
"hi Visual ctermbg=Green ctermfg=Black

" Php Syntax Highlighting
let g:php_htmlInStrings = 1

" CtrlP Settings
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 0
"}}}
"--------------------------
" Fix for esc and autoclose & ycm
"--------------------------
 "{{{
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}
"}}}
"----------------------------------------------------
"}}}

"--------------------------
" Popup Menu Settings
"--------------------------
"{{{
set wildmenu

set wildmode=list:longest

" Auto Completion Vim Popup
set completeopt=longest,menuone

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
nnoremap <S-h> :bn<CR>

"Imap movement
"inoremap <c-l> <Esc>ea
"inoremap <c-h> <Esc>bi

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
"OTHER SETTINGS
"------------------------------------------
"{{{
" Set Extra File Types
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.nvim set filetype=vim
au BufRead,BufNewFile *.nvimrc set filetype=vim
autocmd BufRead,BufNewFile vimperratorrc set filetype=vim
"au BufRead,BufNewFile *.scss set filetype=css.scss
"au BufRead,BufNewFile *.php set filetype=html.php
"}}}

"------------------------------------------
" Colors
"------------------------------------------
"{{{
hi CursorLine ctermbg=7 cterm=none
hi Search term=reverse cterm=reverse gui=reverse ctermfg=none ctermbg=none
hi CursorLineNr cterm=bold ctermfg=1 ctermbg=235
hi LineNr ctermfg=15
hi Constant ctermfg=2
hi Statement ctermfg=1
hi MatchParen cterm=bold ctermfg=8 ctermbg=15
hi TabLineFill term=bold cterm=bold ctermbg=7 ctermfg=15
hi TabLine ctermfg=4 ctermbg=7 cterm=none
hi TabLineSel ctermfg=1 ctermbg=none cterm=bold
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi StatusLine cterm=none ctermfg=0 ctermbg=7
hi StatusLineNC cterm=none ctermfg=235 ctermbg=235
hi Normal ctermfg=0 ctermbg=none
hi Directory ctermfg=4 cterm=none
hi Folded cterm=none ctermfg=4 ctermbg=none
hi SpecialKey ctermfg=7
hi Nontext ctermfg=7
hi TagbarIcon ctermfg=red cterm=none
hi TagbarHighlight ctermfg=red ctermbg=none
hi TagbarScope ctermfg=blue ctermbg=none cterm=none
hi TagbarKind ctermfg=blue ctermbg=none cterm=none
hi TagbarNestedKind ctermbg=blue ctermbg=none cterm=none
hi Visual ctermbg=3 ctermfg=16
hi Pmenu ctermfg=8 ctermbg=3
hi Pmenusel cterm=bold ctermfg=16 ctermbg=1
hi Number cterm=bold ctermfg=red
hi Comment cterm=NONE term=NONE gui=NONE ctermfg=4
hi String ctermfg=5
"}}}

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
	augroup myvimrchooks
		au!
		autocmd bufwritepost .nvimrc source ~/.nvimrc
	augroup END
endif
