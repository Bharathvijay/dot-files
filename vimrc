set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode.git'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/rainbow_parentheses.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set Python beautiful script
let python_highlight_all=1
syntax on

" Set Encoding
set encoding=utf-8

set nu

" Auto reload .vimrc file
autocmd! bufwritepost .vimrc source %

" Enable folding
set foldmethod=indent
set foldlevel=99

syntax enable
" Colors
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

" Pymode customization
let g:pymode=1
let g:pymode_rope=0
let g:pymode_syntax=1
let g:pymode_syntax_all=0
let g:pymode_lint_ignore='W0401, W0611'
let g:pymode_lint_sort=['E', 'C', 'I']
let g:pymode_rope_lookup_project=0

" Parathesis awesomeness
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound "()
au Syntax * RainbowParenthesesLoadSquare "()
au Syntax * RainbowParenthesesLoadBraces "()
au Syntax * RainbowParenthesesLoadChevrons "()

autocmd FileType javascript  noremap <buffer> <c-f> :call JsBeautify()<cr>
" for json 
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr> 
"" for jsx 
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss 
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Leader map
let mapleader=" "

" tabfix
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set cindent

set ruler
set wildmenu

" Python Indentations
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

" Highlight unwanted white spaces
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Configuring Auto Complete plugin
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Setting up nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Activate and configure powerline
" call vam#ActivateAddons(['powerline'])
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
" colorscheme zenburn
set t_Co=256

"Color schemes for vim
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
call togglebg#map("<F5>")

" Configuring autocomplete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

" Configuring autocomplete
" autocmd FileType python  set omnifunc=pythoncomplete#Complete 
" autocmd FileType python set noexpandtab 
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html  set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css  set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php  set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" au BufRead *.less set filetype=css

" Window pane shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
