if !has("nvim")
	set nocompatible
endif
" set nocompatible
" source ~/.vimrc

"-------------- PLUGINS STARTS -----------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'

" Elixir plugins
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Configurable, flexible, intuitive text aligning
Plug 'godlygeek/tabular'

Plug 'plasticboy/vim-markdown'

" vim-markdown-wiki is a Vim plugin which eases the navigation between files in a personnal wiki based on markdown
" Plug 'mmai/vim-markdown-wiki'
"
" vim-scrum-markdown is a Vim plugin to manage a scrum dashboard inside vim
" Plug 'mmai/vim-scrum-markdown'

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
" Plug 'vim-scripts/matchit.zip'

" Plug 'vim-scripts/dbext.vim'
"Plug 'vim-scripts/SQLComplete.vim'
"
" Helps in wrtign python scripts
" Plug 'klen/python-mode'

" spawn matched brackets / quotes
Plug 'jiangmiao/auto-pairs'
"
" show trailing spaces
Plug 'bronson/vim-trailing-whitespace'
"
" smart relative numbering
 " Plug 'jeffkreeftmeijer/vim-numbertoggle'
"
" Theme
Plug 'tomasr/molokai'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'

"
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdcommenter'
" Plug 'vim-scripts/TaskList.vim'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'
" Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-scripts/a.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'Raimondi/delimitMate'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'jez/vim-c0'
" Plug 'jez/vim-ispc'
" Plug 'kchmck/vim-coffee-script'
Plug 'flazz/vim-colorschemes'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" protocol buffer support
Plug 'uarun/vim-protobuf'

" dockerfile
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-dotenv' " procfile support

" vertical lines
Plug 'yggdroot/indentline'

" For autopep8, run using the command- :Autopep8
Plug 'tell-k/vim-autopep8'

" Javascript plugins
Plug 'pangloss/vim-javascript'

" base64 converter
Plug 'christianrondeau/vim-base64'

" Autoformatter
" Plug 'Chiel92/vim-autoformat'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

" go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" " show ascii colours
" Plug 'lilydjwg/colorizer'
" " Colorizes everyword in the code
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

runtime macros/matchit.vim
call plug#end()

"-------------- PLUGINS END --------------------

let g:python3_host_prog = '/usr/local/bin/python3'

set lazyredraw

" Configuration for 'majutsushi/tagbar'
" nmap <F8> :TagbarToggle<CR>

" To format xml documents
"map @@x !%xmllint --format --recover -^M
" To format xml documents press Ctrl + x
nmap <C-x> :%! xmllint --format -<CR>
" To format json documents press Ctrl + z
nmap <C-z> :%!python -m json.tool<CR>

syntax enable
"
" show line numbers
set number
set numberwidth=3

" setting tabs to have 4 spaces
set tabstop=4

" when using the commands, shift lines by 4 spaces
set shiftwidth=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" show a visual line under the cursor's current line
set cursorline
set cursorcolumn

" show the matching part of the pair for brackets
set showmatch


"  newly added
set showcmd
set incsearch
set hlsearch
set mouse=a


" Auto remove all trailing whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

" Autosave files when focus is lost
:au FocusLost * :wa


" Path will be base dir that vim is opened from
set path=$PWD/**

set nomodeline
set noshowmode			" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set shortmess=atToOI    " To avoid the 'Hit Enter' prompts caused by the file messages
set undolevels=1000
set updatetime=1500

" Wild menu (Autocompletion)"
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=list:longest,full

" set scrolljump=10
set ttyfast            " Improves redrawing for newer computers
set pumheight=20       " popup menu height
set diffopt+=context:3
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns

" LAYOUT / TEXT FORMATTING
" Formatting Options
set wrap " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping
set smartindent
" execute "set colorcolumn=" . join(range(81,335), ',')
" set colorcolumn=81

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


set smartindent
filetype indent on

" enable all Python syntax highlighting features
let python_highlight_all=1

set si

set is
set ic

set sta
syn on
set backspace=indent,eol,start
set hlsearch
set ruler
set nobackup
set nowritebackup
au FileType make set noet
:set pastetoggle=<f5>


"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_section=''
let g:airline_detect_paste=1  " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


"----Colors-----
set t_Co=256
set background=dark
" let g:solarized_termcolors=256

" Neovim and recent Vim support true color terminal out of the box with just a single configuration option. No workarounds anymore. Just add set termguicolors to your $MYVIMRC
set termguicolors
" If italics is disabled in gruvbox then use below linethen use below line
let g:gruvbox_italic=1
" colorscheme gruvbox
" colorscheme solarized
colorscheme molokai
"
" let g:airline_theme='badwolf'
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


" ------buffer setting-----------

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" set title and allow hidden buffers
set title
" set list



" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"----- unicode symbols - START-------
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

"----- unicode symbols - END-------

"----- python-mode -- Settings---
let g:pymode_rope = 1
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" refactoring
let g:pymode_rope_rename_bind = '<C-c>rr'
" completion
let g:pymode_rope_completion = 1
let g:pymode_rope_completion_on_dot = 1
let g:pymode_rope_completion_bind = '<C-Space>'

"----- python-mode -- Settings--- END ----


set  rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim/


"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" Uncomment below line to open NERDTree evrytime
" autocmd VimEnter * NERDTree

"To open NERDTree when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" map a specific key or shortcut to open NERDTree?  "map <C-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows in NERDTree?
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" "-------- SYNTASTIC SETTINGS---------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_sh_checkers = ["shellcheck"]

let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_flake8_args='--ignore=E501,W391,E711,E701'

function Py2()
    let g:syntastic_python_python_exec = '/usr/bin/python'
endfunction

function Py3()
    let g:syntastic_python_python_exec = '/usr/local/bin/python3'
endfunction

call Py3()

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }
" nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
silent! nmap <F6> :SyntasticToggleMode<CR>

" Ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" To make ctrlp faster
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" YCM configuration
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/.ycm_extra_conf.py"

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


" NERD Commentor setting
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"set clipboard=unnamedplus " Yanks go on clipboard

" ------My custom mappings-----------
" Define ' ' as map leader
let mapleader="\<Space>"
let g:mapleader = ' '
nnoremap <leader>rf gg=G

" indenting keybinds
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

set guifont=Menlo\ for\ Powerline
set encoding=utf-8 nobomb

"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2

nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2


" other mappings
noremap <Leader>W :w !sudo tee % > /dev/null


" dbext setup

let &t_SI.="\<Esc>[4 q"
" let &t_SR = "\<Esc>[4 q"
" let &t_EI = "\<Esc>[2 q"

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
"if has('unnamedplus')
"  set clipboard^=unnamed
"  set clipboard^=unnamedplus
"endif
"set clipboard=unnamed
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" This enables us to undo files even if you exit Vim.
" if has('persistent_undo')
  " set undofile
  " set undodir=~/.config/vim/tmp/undo/
" endif


" Setting vertical 80 lines limit
set colorcolumn=80,100

" pmenu colour scheme
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000


" Autoindent according to file types
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

"gutentags settings
set statusline+=%{gutentags#statusline()}
let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]


" disable the folding configuration:
let g:vim_markdown_folding_disabled = 1

" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0


" shfmt args
let g:shfmt_extra_args = '-i 2'


" configs related to goFmt pluggin
au FileType go map <leader>r :!go run %<CR>
" au FileType go nmap <leader>r <Plug>(go-run-vertical)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)


" " semshi configs
" function MyCustomHighlights()
"     hi semshiLocal           ctermfg=209 guifg=#ff875f
"     hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"     hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
"     hi semshiParameter       ctermfg=75  guifg=#5fafff
"     hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
"     hi semshiFree            ctermfg=218 guifg=#ffafd7
"     hi semshiBuiltin         ctermfg=207 guifg=#00af00
"     hi semshiAttribute       ctermfg=49  guifg=#00ffaf
"     hi semshiSelf            ctermfg=249 guifg=#b2b2b2
"     hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
"     hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#ffff5f
"
"     hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"     hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
" sign define semshiError text=E> texthl=semshiErrorSign
" endfunction
" " autocmd FileType python call MyCustomHighlights()
" autocmd ColorScheme * call MyCustomHighlights()
