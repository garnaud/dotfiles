" common setup
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set softtabstop=2
set nobackup
set nowritebackup
set noswapfile
set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux
set autowrite
let mapleader=","
" set fdm=syntax

" Plugins (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go',  { 'do': ':GoInstallBinaries' } 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'sjl/gundo.vim'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'altercation/vim-colors-solarized'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-ragtag'

call plug#end()
 
" LimeLight plugin
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" NERDTree plugin
map <C-n> :NERDTreeToggle<CR>

" gocode plugin
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" fatih/vim-go plugin
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>t  <Plug>(go-test)
let g:go_auto_type_info = 1

" syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" markdown plugin
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0

" gundo plugin
nnoremap <F5> :GundoToggle<CR>

" solarized plugin
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256

" ragtag plugin
let g:ragtag_global_maps = 1

" ultisnippets plugin
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
