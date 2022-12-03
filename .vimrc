" vim-plug start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches junegunn/vim-easy-align
Plug 'sheerun/vim-polyglot'

" Color schemes
Plug 'flazz/vim-colorschemes'

" Almost useless but cool
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Show hex color on code
Plug 'lilydjwg/colorizer'

" Edit pairs easily
Plug 'tpope/vim-surround'

" Display tags
Plug 'vim-scripts/taglist.vim'

" Very very powerful complete engine, but tooooo cumberous
"Plug 'valloric/youcompleteme'

" Syntax dignostic, it stuck when opening a big file
"Plug 'scrooloose/syntastic'

" Colorful parentheses
Plug 'luochen1990/rainbow'

" Latex support
"Plug 'lervag/vimtex'
Plug 'kshenoy/vim-signature'

" Any valid git URL is allowed
"Plug 'junegunn/vim-github-dashboard'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()
" vim-plug end
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin configurations
colorscheme 3dglasses
" transparent background
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme = 'violet'
let g:bow_active = 1
let UltiSnipsExpandTrigger = '<TAB>'
"let g:ycm_key_list_select_completion = ['<Down>']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"native configurations
set number
set nobackup
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set t_Co=256
set t_RV=
