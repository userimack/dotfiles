set nocompatible

"-------------- PLUGINS STARTS -----------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'plasticboy/vim-markdown'
Plug 'mmai/vim-markdown-wiki'
Plug 'mmai/vim-scrum-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'matchit.zip'
Plug 'slashmili/alchemist.vim'
Plug 'tomasr/molokai'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdcommenter'
Plug 'TaskList.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
runtime macros/matchit.vim
call plug#end()

"-------------- PLUGINS END --------------------

set lazyredraw

" Configuration for 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

nmap <C-x> :%! xmllint --format -<CR>
nmap <C-z> :%!python -m json.tool <CR>

set t_Co=256
syntax enable
"
" show line numbers
set number

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


" show the matching part of the pair for brackets
set showmatch


"  newly added
set showcmd
set incsearch
set hlsearch
set mouse=a


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
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" colorscheme molokai
" colorscheme desert 
" let g:airline_theme='badwolf'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail'


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

" To format xml documentes
map @@x !%xmllint --format --recover -^M

"-------- SYNTASTIC SETTINGS---------
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

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W391,E116'

function Py2()
    let g:syntastic_python_python_exec = '/usr/local/bin/python2.7'
endfunction

function Py3()
    let g:syntastic_python_python_exec = '/usr/local/bin/python3.6'
endfunction

call Py3()

" Ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" YCM configuration
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

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

set clipboard=unnamedplus " Yanks go on clipboard

" My custom mappings
let mapleader=" "
nnoremap <leader>rf gg=G

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


"--------Vim Toggle Search highlight------"
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>
