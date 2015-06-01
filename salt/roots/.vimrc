" Start vundle setup
source $VIMRUNTIME/mswin.vim
set nocompatible
filetype off                   " required!
" Vundle pre-req
"
set rtp+=$VIMRUNTIME/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Snippets-related bundles
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<C-g>"
let g:UltiSnips.ListSnippets = "<C-h>"
let g:UltiSnips.JumpForwardTrigger = "<C-d>"
let g:UltiSnips.JumpBackwardTrigger = "<C-f>"
let g:UltiSnips.UltiSnips_ft_filter = {
      \  'default' : {'filetypes': ['all'] },
      \  'all' : {'filetypes': ['all', 'FILETYPE'], 'dir-regex': '.vim/bundle' },
      \  'php' : {'filetypes': ['php', 'html', 'javascript'], 'dir-regex': '.vim/bundle' },
      \  'html'    : {'filetypes': ['xhtml', "html", "javascript", "_"], 'dir-regex': '.vim/bundle' },
      \  'xhtml'    : {'filetypes': ["xhtml", "html", "javascript", "_"], 'dir-regex': '.vim/bundle' }
      \  }
let g:UltiSnips.snipmate_ft_filter = {
      \  'default' : {'filetypes': ["FILETYPE", "_"] },
      \  'php' : {'filetypes': ['php', 'html', 'javascript', '_'], 'dir-regex': '.vim/bundle' },
      \  'html'    : {'filetypes': ['xhtml', "html", "javascript", "_"], 'dir-regex': '.vim/bundle' },
      \  'xhtml'    : {'filetypes': ["xhtml", "html", "javascript", "_"],  'dir-regex': '.vim/bundle' }
      \  }

" General autocompletion bundles
Plugin 'ervandew/supertab'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
imap <C-z> <C-e>
Plugin 'closetag.vim'
imap <C-]> <C-_>

Plugin 'kien/ctrlp.vim'
Plugin 'camelcasemotion'
Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
"Plugin 'kshenoy/vim-signature'
nnoremap m4 <Nop>
nnoremap m6 <Nop>

Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
let g:airline_powerline_fonts = 0
let g:airline_left_sep='>'
let g:airline_right_sep='<'
set laststatus=2
set noshowmode
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plugin 'skammer/vim-css-color'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-pandoc/vim-pandoc'

" Language-specific
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'saltstack/salt-vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'xsbeats/vim-blade'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'
Plugin 'wookiehangover/jshint.vim'
let JSHintUpdateWriteOnly=1
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
map <c-f> :call JsBeautify()<cr>
call vundle#end()

filetype on
filetype indent on
filetype plugin on

" Move between buffers and panes
nmap <up> <C-W>k
nmap <down> <C-W>j
nmap <S-Left> <C-W>h
nmap <S-Right> <C-W>l
nmap <left> :bp!<CR>
nmap <right> :bn!<CR>
nnoremap H <C-w>w
nnoremap L <C-w>W

" Indentation
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set expandtab
set smarttab

" Annoyances
set noerrorbells
set number
set ruler
set nobackup
set noswapfile
"set autochdir
set foldmethod=indent
autocmd BufWinEnter * normal zR

" Sane searching and search highlights
set incsearch
set hlsearch
set showmatch
map - :nohls<CR>
set ignorecase
set smartcase

" Fold details
set foldminlines=3

" Diff stuff
set diffopt=filler,iwhite,vertical

" THIS IS AWESOME
nnoremap <Space> :

" Experimental / specific
imap <C-l> <Space>=><Space>
omap ri ggVG=

set guifont=DejaVu\ Sans\ Mono\ 16
"set lines=999
"set columns=999
colorscheme desert

autocmd FileType php setlocal shiftwidth=4 tabstop=4
"au FileType javascript call JavaScriptFold()
