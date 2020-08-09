set nocompatible

set colorcolumn=80

" MacVim settings
set guifont=MesloLGS\ NF:h16

" vim-plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'ayu-theme/ayu-vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'slim-template/vim-slim'
Plug 'rizzatti/dash.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-bundler'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Colorscheme
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
colorscheme ayu

" Nerdtree settings
let NERDTreeShowHidden=1  "  Always show dot files
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['\.swp$']
map <Leader>n :NERDTreeFind<CR>

" Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" FZF
set rtp+=/usr/local/opt/fzf
map <Leader>p :FZF<CR>
map <C-p> :FZF<CR>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" Line numbers
set number
map <C-l> :set invnumber<CR>
map <Leader>l :set invnumber<CR>

" Comments
map <C-/> gcc
map <Leader>/ gcc

" Find
map <C-f> :Ag<CR>
map <Leader>f :Ag<CR>

" Slim
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}
map <Leader>af :ALEFix<CR>
map <Leader>an :ALENextWrap<CR>

" Gutentag
let g:gutentags_modules = ['ctags']

" Dash
map <C-h> :Dash<CR>

" tab navigation
map <C-t>n :tabnew<cr>
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

