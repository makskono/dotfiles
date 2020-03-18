call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

Plug 'mattn/emmet-vim', {'for': 'html'}

Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

Plug 'dense-analysis/ale'

call plug#end()

filetype plugin indent on
syntax on

" indent/tabs
set autoindent
set smartindent
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set shiftround

" swap/info files 
set nobackup
set nowritebackup
set noswapfile

" navigate
set cursorline
set ruler
set ignorecase
set smartcase
"set number relativenumber
set scrolloff=10
set sidescroll=5
set foldenable
set foldlevel=100
set foldmethod=indent
set hlsearch
set incsearch
set mouse=a

" other
set hidden
set autoread
set history=250
set lazyredraw
set showcmd
set synmaxcol=250
set laststatus=2
set noshowmode
set display=lastline
set timeout
set timeoutlen=1000
set ttimeoutlen=10
set ttyfast
set wildmenu
set splitbelow
set splitright
set wrap linebreak nolist
set ch=1
set mousehide

colorscheme theme

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' .
       \a:extension .' ctermbg='. a:bg .' ctermfg='.
       \a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' .
       \a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('html', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" remaps
nmap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <silent> <f1> :NERDTreeToggle<CR>

xnoremap <  <gv
xnoremap >  >gv

let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✗'

let g:user_emmet_expandabbr_key = '<C-e>'

" save/reload
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" remember cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

" Enable omni completion.
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
