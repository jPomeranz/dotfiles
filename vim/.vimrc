if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'elzr/vim-json'
Plug 'ayu-theme/ayu-vim'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
call plug#end()

"Global Settings
set backspace=indent,eol,start
set number
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete
set laststatus=2
set autoindent
set autoread
set autowrite
set clipboard=unnamed,unnamedplus
set cursorline
set mouse=a
set timeoutlen=1000 ttimeoutlen=0

"Theme
set termguicolors
let ayucolor="dark"
colorscheme ayu

"ALE
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"Lightline
set noshowmode
let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [ ['lineinfo'],
  \                ['percent'],
  \		   ['fileformat', 'fileencoding']
  \	         ]
  \
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
