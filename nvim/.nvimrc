"{{{
"
"     \  |                     _)
"      \ |   _ \   _ \ \ \   /  |  __ `__ \    __|  __|
"    |\  |   __/  (   | \ \ /   |  |   |   |  |    (
"   _| \_| \___| \___/   \_/   _| _|  _|  _| _|   \___|
"   __________________________________________________
"  |                                                  |\
"  |   │█║▌║▌║▌║▌[          VIM         ]│█║▌║▌║▌║▌   |||
"  |__________________________________________________|||
"   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|
"     --------------------------------------------------
"
"   ıllıllııllıllı    Out Of The Box    ıllıllııllıllııl
"
"
" ---------------------------------------------------
" Author              : Kristopher Watts (UncleDozer)
" Email               : Kristopher.A.Watts@gmail.com
" Github              : https://github.com/UncleDozer/
" Website             : http://www.webtastic-development.net
" I'm new to VIM, so any suggestions or improvements would be greatly appreciated. Thanks!
" ---------------------------------------------------
"}}}

set nocompatible
syntax enable         " Enable Syntax Highlighting
filetype plugin indent on

" NeoVim Python Settings
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.4'

"------------------------------------------
" 1: VIM-PLUG CONFIG
"------------------------------------------
"{{{

" Start Vim-Plug
call plug#begin('~/.nvim/bundle')

"--------------------------
" 1.A: Syntax Specific Plugins
"--------------------------
"{{{

" CSS & PreProcessors
Plug 'hail2u/vim-css3-syntax', { 'for' : [ 'css', 'scss', 'less' ] } " CSS3
Plug 'cakebaker/scss-syntax.vim', { 'for' : 'scss' } " SCSS
Plug 'groenewege/vim-less', { 'for' : 'less' } " LESS

" Javascript Syntax Highlighting
Plug 'jelera/vim-javascript-syntax', { 'for' : 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }

" HTML and PHP
Plug 'othree/html5.vim', { 'for' : [ 'html', 'php', 'eruby' ] }
Plug 'StanAngeloff/php.vim', { 'for' : 'php' }
Plug 'nicklasos/vimphphtml', { 'for' : 'php' }

" AutoClose HTML Tags
Plug 'vim-scripts/HTML-AutoCloseTag', { 'for' : [ 'html', 'php' ] }
Plug 'vim-scripts/closetag.vim', { 'for' : [ 'html', 'php' ] }

" Match for tags
Plug 'edsono/vim-matchit', { 'for' : [ 'html', 'php' ] }

" i3 Config Syntax
Plug 'PotatoesMaster/i3-vim-syntax'

" Fish Syntax
Plug 'dag/vim-fish', { 'for' : 'fish' }

" Markdown
Plug 'tpope/vim-markdown', { 'for' : [ 'ghmarkdown', 'markdown' ] }
Plug 'jtratner/vim-flavored-markdown', { 'for' :  [ 'ghmarkdown', 'markdown' ] }

" Markdown Composer
function! BuildComposer( info )
    if a:info.status != 'unchanged' || a:info.force
        !cargo build --release
        UpdateRemotePlugins
    endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function( 'BuildComposer' ), 'for' : [ 'markdown', 'ghmarkdown' ] }

" LaTeX
Plug 'lervag/vimtex', { 'for' : [ 'tex', 'latex' ] }
Plug 'xuhdev/vim-latex-live-preview', { 'for' : [ 'tex', 'latex' ] }

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby' }

" Ruby On Rails
Plug 'tpope/vim-rails'

" Endwise.vim
Plug 'tpope/vim-endwise'

" GDscript
Plug 'a-watson/vim-gdscript'

" C++ better highlighting
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'cpp', 'c++', 'hpp' ] }

" Enhanced Python Syntax
Plug 'hdima/python-syntax', { 'for': [ 'python' ] }

"}}}

"--------------------------
" 1.A: Other Plugins
"--------------------------
"{{{

" Vim AutoClose
Plug 'Townk/vim-autoclose'

" Auto Commenting
Plug 'The-NERD-Commenter'

" Alignment
Plug 'Align', { 'on' : 'Align' }

" FZF Fuzzy Finder Disabled until fixed on nvim
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : 'yes \| ./install' }

" Fast Fold
Plug 'Konfekt/FastFold'

" Buftabline
Plug 'ap/vim-buftabline'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Vim Surround
Plug 'tpope/vim-surround'

" Vim Session
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

" Vim Caps Lock
Plug 'tpope/vim-capslock'

" Vim-Pad for note taking
Plug 'fmoralesc/vim-pad'

" Vim NerdTree
Plug 'scrooloose/nerdtree', { 'on' : [ 'NERDTree', 'NERDTreeToggle' ] }

" Colorschemes for pynvim
Plug 'NLKNguyen/papercolor-theme'
Plug 'trusktr/seti.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'romainl/Apprentice'
" Plug 'flazz/vim-colorschemes' " Colorscheme pack
Plug 'mhumeSF/one-dark.vim'

" Targets
Plug 'wellle/targets.vim'

" Gutentags for tags files
Plug 'ludovicchabant/vim-gutentags'

" Vim Numbers
Plug 'myusuf3/numbers.vim'

"}}}

call plug#end()

"}}}

"------------------------------------------
" 2: GENERAL SETTINGS
"------------------------------------------
"{{{

set encoding=utf-8

"--------------------------
" 2.A: UI Settings
"--------------------------
"{{{

set background=dark

set lazyredraw      " Only Redraw When Needed

set number          " Line Numbering

set nowrap          " No Text Wrap

set autoread        " Auto Reload File

set autowriteall    " Auto Save File

set laststatus=2    " Show Status Line

set ruler           " Show Line and Column Position

set hidden          " UnHide Closed Buffers

set showcmd         " Show The Last Command

set showtabline=2   " Always Show Tab Line

set scrolloff=5     " How Many Lines visible before scrolling of buffer
set sidescrolloff=5
set sidescroll=1

set showmatch       " Highlight Brackets

set matchtime=2     " Tenths of a Second to Show the Matching Bracket

" Speed tests
set nocursorline
set nocursorcolumn
set synmaxcol=180

" Disable All Bells
set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set guicursor=a:blinkon0

let g:plug_window='top new' " Force Vim-Plug to split horizontally instead of Vertically

set foldmethod=marker       " Use Default Fold Marker

set omnifunc=syntaxcomplete#Complete

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

if has('gui_running')
    " set guifont = Office\ Code\ Pro\ 12
endif

"}}}

"--------------------------
" 2.B: Tab Stuff
"--------------------------
"{{{

set expandtab                 " Expand Tabs to Spaces
set tabstop=2
set softtabstop=2
set shiftwidth=1
set shiftround

set breakindent               " Visually Break Lines in Wrap Mode

set smartindent               " Auto Indenting
set autoindent

set list                      " Show Whitespace and Tabs
set listchars=tab:…\ ,trail:•

"}}}

"--------------------------
" 2.C: Search/Undo/ETC
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
set ttimeoutlen=125            " Timeout for Commands

set history=1000               " Loads of History
set undolevels=1000            " And Undo
set undoreload=1000

set noswapfile                 " Disable Vim Swap
set nobackup                   " Disable Vim Backup

set formatoptions=qn1          " Text Formatting

" Persistent Info
" set viminfo='10,\"100,:20'

" Find tags files
set tags+="./.tags;,tags"

"}}}

"--------------------------
" 2.D: Popup Menu Settings
"--------------------------
"{{{

set wildmenu
set wildchar=<TAB>

set wildmode=list:full

" Auto Completion Vim Popup
set completeopt=longest,menu,preview

set wildignore=*/.git/*,*/node_modules/*,*/dist/*

"}}}

"}}}

"------------------------------------------
" 3: PLUGIN SETTINGS
"------------------------------------------
"{{{

" Enhanced Python Syntax Settings
let python_hilight_all = 1

" Vim Pad
let g:pad#dir = "~/.notes/"
let g:pad#window_height = 15
let g:pad#default_file_extension = ".md"
let g:pad#default_format = "ghmarkdown"
let g:pad#title_first_line = 1

" Markdown
let g:vim_mardown_folding_disabled = 1

" Markdown Composer
let g:markdown_composer_syntax_theme = 'railscasts'
let g:markdown_composer_browser = 'iceweasel'

" CloseTag
let g:closetag_html_style=1

" Jquery Syntax Highlighting
" let g:used_javascript_libs = 'jquery'

" FZF settings
let g:fzf_height = '20%'


" Numbers settings
let g:numbers_exclue = [ 'tagbar', 'fzf', 'help' ]

" Nerd Commenter
let g:NERDRemoveExtraSpaces = 1
let g:NERDSpaceDelims       = 1

" HTML5 and PHP syntax settings
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete          = 0
let g:html5_aria_attributes_complete          = 0

let g:PHP_outdentphpescape                    = 1
let g:PHP_BracesAtCodeLevel                   = 1

function! PhpSyntaxOverride()
    hi! def link phpDocTags phpDefine
    hi! def link phpDocParam phpType
endfunction

" FastFold Settings
let g:fastfold_savehook                       = 1
let g:fastfold_fold_command_suffixes          = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands         = [']z', '[z','zj','zk']

" Live LaTeX
let g:livepreivew_previewer = 'zathura'

" CtrlP
let g:ctrlp_show_hidden = 1

" GutenTags
let g:gutentags_generate_on_write = 0

" C++ function highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

"--------------------------
" 3.A: YouCompleteMe
"--------------------------
"{{{

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_allow_changing_updatetime       = 1

" Fix for esc and Autoclose
let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>"}

" Allow YCM to Complete Inside Comments and Strings
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings  = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" Complete Identifiers With Syntax
let g:ycm_seed_identifiers_with_syntax                  = 1

" Close YCM Menu After a Completion
let g:ycm_autoclose_preview_window_after_completion     = 1

" Collect Completions from tags files
let g:ycm_collect_identifiers_from_tags_files = 1

"}}}

"}}}

"------------------------------------------
" 4: KEY MAPPINGS & COMMANDS
"------------------------------------------
"{{{

" Remap Leader Key
let mapleader=","

"--------------------------
" 4.A: Normal/Visual/Operator Mode
"--------------------------
"{{{

" Remap Command key for Faster Commands
noremap ; :

" Remap ;
nnoremap <Leader>; ;

" Get Filepath relative to working dir
nnoremap <leader>en :echo @%<CR>

nnoremap <leader>scr :e $HOME/.note/scratch.note<CR>ggVGdP

" FZF Fuzzy Finder -- Broken in NVim
nnoremap <C-p> :FZF<CR>

" CtrlP Fuzzy Finder
" nnoremap <C-p> :CtrlP<CR>

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Treat Linebreaks as Seperate Lines
noremap k gk
noremap j gj

" Move Line Up or Down
noremap <A-j> :m .+1<CR>==
noremap <A-k> :m .-2<CR>==

" Generate ComDoc
nnoremap <Leader>doc :set paste<CR>i/**<CR> *<CR> *<CR> */<CR><ESC>:set nopaste<CR>

" Generate Section
nnoremap <Leader>fld :set paste<CR>i/* *----------------------------------------<CR> * {{{<CR> * *----------------------------------------<CR> */<CR><CR><CR> /* }}}<CR> * *----------------------------------------<CR> */<ESC>:set nopaste<CR>7ka

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
nnoremap <silent><ESC> :nohlsearch<CR>

" Copy Line and Return to Cursor Position
nnoremap <Leader>c mzVy`z:delmarks z<CR>

" Copy and Past Line and Return to Cursor Position
noremap <Leader>d mzVyp`z:delmarks z<CR>

" Prev Buffer
nnoremap <S-h> :bp<CR>

" Next Buffer
nnoremap <S-l> :bn<CR>

" Close Buffer
nnoremap <Leader>x :bp\|bd #<CR>

" VSplit
nnoremap <Leader>v :vsplit<CR>

" HSplit
nnoremap <Leader>h :split<CR>

" Navigate Splits
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h

" Switch to Previous Buffer
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

" Rails
nnoremap <Leader>re i<%= %><ESC>2hi<SPACE>
nnoremap <Leader>rr i<% %><ESC>2hi<SPACE>

" }}}

"--------------------------
" 4.B: Commands
"--------------------------
"{{{

" Sudo Save
command! W :execute ':silent w !sudo tee % > /dev/null' ':silent l'

" Run Markdown Parser
function! Markup()
    let l:FileName = expand('%:p') . ''
    if l:FileName =~? ".md"
        :execute "!ghmd -o=\"" . l:FileName . ".html\" " . l:FileName
        echo l:FileName . '.html has been created'
    else
        echo 'Not a markdown file'
    endif
endfunction

command! MarkUp :execute ':call Markup()'

"}}}

"--------------------------
" 4.C: Insert Mode
"--------------------------
"{{{

" Exit Insert Mode
inoremap <silent>jk <ESC>:nohlsearch<CR>

" Yank (or Copy) Text to System Clipboard
vnoremap <Leader>y "+y

" Exit Visual Mode
vnoremap <CR> <ESC>

" CAPS-LOCK toggle
imap <C-L> <C-O><Plug>CapsLockToggle
inoremap <C-c> <C-O><Plug>CapsLockToggle

" Pop Open Curly Braces / Paranthesis
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap [<CR> [<CR>]<C-o>O
inoremap ><CR> ><CR><C-o>O

" Jump to beginning or end of line from Insert mode
inoremap <C-a> <C-o>A
inoremap <C-i> <C-o>I

"}}}

"--------------------------
" 4.D: Paste From Registers
"--------------------------
"{{{

" Paste from numbered registers
noremap <Leader>0p "0p
noremap <Leader>1p "1p
noremap <Leader>2p "2p
noremap <Leader>3p "3p
noremap <Leader>4p "4p
noremap <Leader>5p "5p

"}}}

"}}}

"------------------------------------------
" 5: CURSOR SETTINGS
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
let &t_EI .= "\<Esc>[4 q"

"}}}

"------------------------------------------
" 6: COLORS
"------------------------------------------
"{{{

" *NOTE*
" Unfortunately I created this colorscheme before I knew about the
" 'set background=dark' bug, so for it to appear correctly,
" background must be set to dark BEFORE the color scheme is called.

" Clear All Highlighting
" hi clear

" hi Normal guifg=#F1F3F4 guibg=#1A1A1A

" " Kill the CursorLine Underline
" hi CursorLine cterm=none ctermbg=0 gui=none guibg=#1A1A1A
" " Highlight the current line number
" hi CursorLineNr ctermfg=9 ctermbg=0 guifg=#ff2e4c guibg=#1A1A1A
" hi LineNr ctermfg=7 guifg=#5b7785
" hi StatusLine cterm=none ctermfg=7 ctermbg=0 gui=none guifg=#5b7785 guibg=#1A1A1A
" hi StatusLineNC cterm=none ctermfg=7 ctermbg=235 gui=none guifg=#5b7785 guibg=#3A3A3A
" hi TabLineFill ctermbg=none ctermfg=0 gui=none guifg=#1A1A1A
" hi TabLine ctermfg=2 ctermbg=0 cterm=none gui=none guifg=#6e8b62 guibg=#1A1A1A
" hi TabLineSel ctermfg=10 ctermbg=0 guifg=#7ed65a guibg=#1A1A1A


" " UI Highlighting
" hi Search cterm=reverse ctermfg=none ctermbg=none gui=reverse guifg=none
" hi MatchParen ctermfg=10 guifg=#7ed65a
" hi VertSplit ctermfg=0 ctermbg=7 guifg=#1A1A1A guibg=#5b7785
" hi Directory ctermfg=4 guifg=#31789c
" hi SpecialKey ctermfg=7 guifg=#5b7785
" hi Special ctermfg=10 guifg=#7ed65a
" hi Nontext ctermfg=7 guifg=#5b7785
" hi Visual ctermbg=2 ctermfg=0 guibg=#6e8b62 guifg=#1A1A1A
" hi Number ctermfg=11 guifg=#ff5724
" hi Error ctermfg=15 ctermbg=9 guifg=#F1F3F4 guibg=#ff2e4c
" hi ErrorMsg ctermbg=9 ctermfg=15 guibg=#ff2e4c guifg=#F1F3F4
" hi ToDo ctermbg=0 ctermfg=12 guibg=#1A1A1A guifg=#2eb9ff

" " Menu Highlighting
" hi Pmenu ctermfg=15 ctermbg=4 guifg=#F1F3F4
" hi Pmenusel ctermfg=15 ctermbg=12 guifg=#F1F3F4 guibg=#2eb9ff
" hi WildMenu ctermfg=16 ctermbg=12 guifg=#1A1A1A guibg=#2eb9ff

" " Syntax Highlighting
" hi Statement ctermfg=9 guifg=#ff2e4c
" hi Constant ctermfg=11 guifg=#ff5724
" hi Folded ctermfg=7 ctermbg=0 guifg=#5b7785 guibg=#1A1A1A
" hi Title ctermfg=12 guifg=#2eb9ff
" hi TagbarIcon ctermfg=9 guifg=#ff2e4c
" hi TagbarHighlight ctermfg=9 guifg=#ff2e4c
" hi TagbarScope ctermfg=12 ctermbg=none cterm=none guifg=#2eb9ff guibg=none gui=none
" hi TagbarKind ctermfg=12 ctermbg=none cterm=none guifg=#2eb9ff guibg=none gui=none
" hi TagbarNestedKind ctermbg=12 ctermbg=none cterm=none guibg=none gui=none guibg=#2eb9ff
" hi Comment ctermfg=7 guifg=#5b7785
" hi String ctermfg=10 guifg=#7ed65a
" hi Type ctermfg=14 guifg=#38c5af
" hi PreProc ctermfg=11 guifg=#ff5724
" hi Identifier ctermfg=12 guifg=#2eb9ff

colorscheme apprentice

"}}}

"------------------------------------------
" 7: STATUSLINE
"------------------------------------------
"{{{

if( !has( 'gui_running' ) )
    hi User1 ctermbg=0 ctermfg=12
    hi User2 ctermbg=0 ctermfg=11
    hi User3 ctermfg=0 ctermbg=12
    hi User4 ctermbg=0 ctermfg=12
    hi User5 ctermbg=0 ctermfg=12
    hi User6 ctermfg=12  ctermbg=0
    hi User7 ctermbg=0 ctermfg=13
    hi User8 ctermbg=0 ctermfg=10
    hi User9 ctermbg=0 ctermfg=12
endif

" Left--------{{{

set statusline=                   " Clear Statusline

set statusline=%3*                " Set Color

set statusline+=%{GetModified()}  " If file has been modified, change color of file name

set statusline+=%-4{GetMode()}%6* " Set Mode name and color

set statusline+=%1*\              " Spacer

set statusline+=%-t%m             " Tail of the file name and the modified tag

set statusline+=%1*\              " Spacer

" ----------}}}

set statusline+=%=                " Switch to the right side

" Right--------{{{

set statusline+=%9*                   " Set Color for clock

set statusline+=%{CurrentTime()}      " Get The Current Time

set statusline+=%5*                   " Color scheme User5

set statusline+=\ %5.15Y              " Filetype

set statusline+=%-5.20{GetFileType()} " Change color scheme based on filetype (just for some added pizzaz)

set statusline+=%7*                   " Color Scheme User4

set statusline+=%5{''}\ %8*%03.04l\ %7*%02.02c\ \ " Show line and column numbers

set statusline+=%*                    " Return to statusline colors

" ----------}}}

function! GetModified()
    if &modifiable
        if &modified
            hi! User1 ctermfg=11
            return ''
        else
            hi! User1 ctermfg=10
            return ''
        endif
    elseif !&modifiable
        hi User1 ctermfg=1
        return ''
    endif
endfunction

function! GetMode()
    if mode() ==# 'n' " Normal
        hi! User3 ctermfg=15 ctermbg=12
        hi! User6 ctermfg=12 ctermbg=235
        return '  N '
    elseif mode() ==# 'i' " Insert
        if CapsLockStatusline() ==# '[caps]'
            hi! User3 ctermfg=15 ctermbg=9
            hi! User6 ctermfg=9 ctermbg=235
            return ' CAPS'
        else
            hi! User3 ctermfg=15 ctermbg=14
            hi! User6 ctermfg=14 ctermbg=235
            return '  I '
        end
    elseif mode() ==# 'R' " Replace All
        hi! User3 ctermfg=15 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  R '
    elseif mode() ==# 'r' " Replace Selection
        hi! User3 ctermfg=15 ctermbg=1
        hi! User6 ctermfg=1 ctermbg=235
        return '  r '
    elseif mode() ==# 'v' " Visual
        hi! User3 ctermfg=12 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  V '
    elseif mode() ==# 'V' " Visual Line
        hi! User3 ctermfg=12 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  -V- '
    elseif mode() ==# "" " Visual Block
        hi! User3 ctermfg=12 ctermbg=10
        hi! User6 ctermfg=10 ctermbg=235
        return '  [V] '
    elseif mode() ==# 'c' " Search
        hi! User3 ctermfg=12 ctermbg=13
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
" 8: AUTO COMMANDS
"------------------------------------------
"{{{

if has("autocmd")

    " Re-Source Vimrc on save
    augroup mynvimrchooks
        au!
        " autocmd BufWritePost .nvimrc source $MYVIMRC
        " autocmd BufWritePost .nvimrc silent YcmRestartServer
    augroup END

    " Filetype Commands
    augroup autofiletypes
        au!
        au BufRead,BufNewFile *.nvim setlocal filetype=vim
        au BufRead,BufNewFile *.nvimrc setlocal filetype=vim
        au BufRead,BufNewFile *.vimperratorrc setlocal filetype=vim
        au BufRead,BufNewFile * let g:pad#position[ "list" ] = "top"
        au BufRead,BufNewFile * let g:pad#position[ "pads" ] = "top"
    augroup END

    " Markdown Specific
    augroup markDownSettings
        au!
        au BufRead,BufNewFile *.markdown,*.md,*.txt,*.note,*.todo,*.tmp  setlocal filetype=ghmarkdown
        " Markdown synmax so highlighting doesn't end
        au FileType ghmarkdown setlocal synmaxcol=1500
    augroup END

    " SCSS Specific
    augroup sassSettings
        au!
        au Filetype scss setlocal commentstring=/*%s*/
        " Function name highlighting
        au FileType scss setlocal iskeyword+=-
    augroup END

    " Filetype Specific Mappings
    augroup filemappings
        au!
        " Quick PHP Tags (o for O and i for inline)
        au BufRead,BufNewFile *.php inoremap <?po <?php<CR>?><C-o>O<TAB>
        au BufRead,BufNewFile *.php inoremap <?pi <?php  ?><C-o>2h
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>flo <ESC>i<?php<CR><CR>?><ESC>k
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>fli <ESC>i<?php  ?><ESC>2hi
        au BufRead,BufNewFile *.php noremap <buffer> <Leader>ch <ESC>I<!--<ESC>A  --!><ESC>4h
        au BufRead,BufNewFile *.php setlocal filetype=php
        au FileType php call PhpSyntaxOverride()
    augroup END

    " Help Specific
    augroup helpFiles
        au Filetype help setlocal nonumber
        au Filetype help nnoremap <buffer>q :q<CR>
    augroup END

    " Global Formatting Options
    augroup formatting
        au!
        au Filetype * setlocal formatoptions-=c
        au Filetype * setlocal formatoptions-=r
        au Filetype * setlocal formatoptions-=o
    augroup END

    " Clear Messages on Insert Movement or normal hold
    augroup inserts
        au!
        au CursorHold * echo ""
        au CursorMovedI * echo ""
        au InsertEnter * setlocal timeoutlen=1000
        au InsertLeave * setlocal timeoutlen=250
    augroup END

endif

"}}}
